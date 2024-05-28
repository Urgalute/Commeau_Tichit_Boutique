const db = require('../config/db');

exports.getAllProducts = (req, res) => {
    const { category, color } = req.query;

    let query = 'SELECT product.*, GROUP_CONCAT(product_images.image_url) AS images FROM product LEFT JOIN product_images ON product.id_product = product_images.product_id';
    let queryParams = [];
    
    if (category || color) {
        query += ' WHERE';
        if (category) {
            query += ' product.id_category = ?';
            queryParams.push(category);
        }
        if (category && color) {
            query += ' AND';
        }
        if (color) {
            query += ' product.id_product IN (SELECT id_product FROM asso_color WHERE id_color = ?)';
            queryParams.push(color);
        }
    }

    query += ' GROUP BY product.id_product';

    db.query(query, queryParams, (err, results) => {
        if (err) {
            console.error('Error fetching products:', err);
            res.status(500).json({ message: 'Error fetching products', error: err });
        } else {
            res.render('home', { products: results, selectedCategory: category, selectedColor: color });
        }
    });
};

exports.getProductById = (req, res) => {
    const productId = req.params.id;
    const query = 'SELECT product.*, GROUP_CONCAT(product_images.image_url) AS images FROM product LEFT JOIN product_images ON product.id_product = product_images.product_id WHERE product.id_product = ? GROUP BY product.id_product';
    
    db.query(query, [productId], (err, results) => {
        if (err) {
            console.error('Error fetching product:', err);
            res.status(500).json({ message: 'Error fetching product', error: err });
        } else if (results.length === 0) {
            res.status(404).json({ message: 'Product not found' });
        } else {
            res.render('productDetails', { product: results[0] });
        }
    });
};
