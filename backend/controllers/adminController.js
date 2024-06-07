const db = require('../config/db');

exports.showAdminDashboard = async (req, res) => {
    try {
        const products = await getAllProducts();
        res.render('admin_dashboard', { products });
    } catch (err) {
        console.error('Error fetching products:', err);
        res.status(500).json({ message: 'Error fetching products', error: err });
    }
};

exports.addProduct = (req, res) => {
    const { name, description, promotional_price, promotion, currency, stock, id_category } = req.body;

    const query = `
        INSERT INTO product (name, description, promotional_price, promotion, currency, stock, id_category)
        VALUES (?, ?, ?, ?, ?, ?, ?)
    `;

    db.query(query, [name, description, promotional_price, promotion, currency, stock, id_category], (err, result) => {
        if (err) {
            console.error('Error adding product:', err);
            return res.status(500).json({ message: 'Error adding product', error: err });
        }

        res.redirect('/admin/dashboard');
    });
};

exports.updateProduct = (req, res) => {
    const { id_product, name, description, promotional_price, promotion, currency, stock, id_category } = req.body;

    const query = `
        UPDATE product
        SET name = ?, description = ?, promotional_price = ?, promotion = ?, currency = ?, stock = ?, id_category = ?
        WHERE id_product = ?
    `;

    db.query(query, [name, description, promotional_price, promotion, currency, stock, id_category, id_product], (err, result) => {
        if (err) {
            console.error('Error updating product:', err);
            return res.status(500).json({ message: 'Error updating product', error: err });
        }

        res.redirect('/admin/dashboard');
    });
};

exports.deleteProduct = (req, res) => {
    const { id_product } = req.body;

    const query = `
        DELETE FROM product
        WHERE id_product = ?
    `;

    db.query(query, [id_product], (err, result) => {
        if (err) {
            console.error('Error deleting product:', err);
            return res.status(500).json({ message: 'Error deleting product', error: err });
        }

        res.redirect('/admin/dashboard');
    });
};

exports.listOrders = (req, res) => {
    const query = `
        SELECT orders.*, users.username
        FROM orders
        JOIN users ON orders.user_id = users.id
        ORDER BY orders.order_date DESC
    `;

    db.query(query, (err, orders) => {
        if (err) {
            console.error('Error fetching orders:', err);
            return res.status(500).json({ message: 'Error fetching orders', error: err });
        }

        res.render('orders', { orders });
    });
};

exports.showEditProductForm = (req, res) => {
    const { id_product } = req.params;

    const query = 'SELECT * FROM product WHERE id_product = ?';

    db.query(query, [id_product], (err, results) => {
        if (err) {
            console.error('Error fetching product:', err);
            return res.status(500).json({ message: 'Error fetching product', error: err });
        }

        if (results.length === 0) {
            return res.status(404).json({ message: 'Product not found' });
        }

        const product = results[0];
        res.render('edit_product', { product });
    });
};

const getAllProducts = () => {
    return new Promise((resolve, reject) => {
        const query = `
            SELECT product.*, GROUP_CONCAT(product_images.image_url) AS images
            FROM product
            LEFT JOIN product_images ON product.id_product = product_images.product_id
            GROUP BY product.id_product;
        `;

        db.query(query, (err, results) => {
            if (err) {
                reject(err);
            } else {
                resolve(results);
            }
        });
    });
};
