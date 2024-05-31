const db = require('../config/db');

const categories = [
    { id: 1, name: "Plante d'extérieure" },
    { id: 2, name: "Plante d'intérieure" },
    { id: 3, name: "Bouquets" },
    { id: 4, name: "Accessoires" }
];

const colors = [
    { id: 1, name: 'Rouge' },
    { id: 2, name: 'Orange' },
    { id: 3, name: 'Jaune' },
    { id: 4, name: 'Blanc' },
    { id: 5, name: 'Rose' },
    { id: 6, name: 'Violet' },
    { id: 7, name: 'Vert' },
    { id: 8, name: 'Bleu' }
];

exports.getAllProducts = (req, res) => {
    const query = `
        SELECT product.*, GROUP_CONCAT(product_images.image_url) AS images
        FROM product
        LEFT JOIN product_images ON product.id_product = product_images.product_id
        GROUP BY product.id_product;
    `;

    db.query(query, (err, results) => {
        if (err) {
            console.error(err);
            return res.render('home', {
                products: [],
                selectedCategory: '',
                selectedColor: '',
                categories: categories,
                colors: colors
            });
        }

        res.render('home', {
            products: results,
            selectedCategory: '',
            selectedColor: '',
            categories: categories,
            colors: colors
        });
    });
};

exports.filterProducts = (req, res) => {
    const { category, color } = req.body;
    let query = `
        SELECT product.*, GROUP_CONCAT(product_images.image_url) AS images
        FROM product
        LEFT JOIN product_images ON product.id_product = product_images.product_id
    `;

    const filters = [];
    if (category) filters.push(`product.id_category = ${db.escape(category)}`);
    if (color) filters.push(`product.id_product IN (SELECT id_product FROM asso_color WHERE id_color = ${db.escape(color)})`);

    if (filters.length > 0) {
        query += ' WHERE ' + filters.join(' AND ');
    }

    query += ' GROUP BY product.id_product';

    db.query(query, (err, results) => {
        if (err) {
            console.error(err);
            return res.render('home', {
                products: [],
                selectedCategory: category || '',
                selectedColor: color || '',
                categories: categories,
                colors: colors
            });
        }

        res.render('home', {
            products: results,
            selectedCategory: category || '',
            selectedColor: color || '',
            categories: categories,
            colors: colors
        });
    });
};

exports.getProductById = (req, res) => {
    const productId = req.params.id;

    const query = `
        SELECT product.id_product, product.name, product.description, product.price, product.currency, product_images.image_url
        FROM product
        LEFT JOIN product_images ON product.id_product = product_images.product_id
        WHERE product.id_product = ?
        GROUP BY product.id_product
    `;

    db.query(query, [productId], (err, result) => {
        if (err) {
            console.error('Error fetching product:', err);
            res.status(500).json({ message: 'Error fetching product', error: err });
        } else {
            if (result.length === 0) {
                return res.status(404).json({ message: 'Product not found' });
            }
            res.render('productDetails', { product: result[0] });
        }
    });
};
