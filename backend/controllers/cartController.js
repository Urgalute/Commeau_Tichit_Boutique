const db = require('../config/db');

let cart = [];

exports.viewCart = (req, res) => {
    res.render('cart', { cart });
};

exports.addToCart = (req, res) => {
    const productId = req.params.id;
    const query = 'SELECT * FROM product WHERE id_product = ?';
    db.query(query, [productId], (err, results) => {
        if (err) {
            console.error('Error fetching product:', err);
            res.status(500).json({ message: 'Error fetching product', error: err });
        } else if (results.length === 0) {
            res.status(404).json({ message: 'Product not found' });
        } else {
            const product = results[0];
            cart.push(product);
            res.redirect('/cart');
        }
    });
};
