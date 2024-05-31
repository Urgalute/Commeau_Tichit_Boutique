const db = require('../config/db');

exports.addToCart = (productId, callback) => {
    const query = 'INSERT INTO cart (product_id, quantity) VALUES (?, 1) ON DUPLICATE KEY UPDATE quantity = quantity + 1';
    db.query(query, [productId], callback);
};

exports.getCart = (callback) => {
    const query = `
        SELECT cart.id, product.id_product, product.name, product.price, product.currency, product_images.image_url, cart.quantity
        FROM cart
        JOIN product ON cart.product_id = product.id_product
        LEFT JOIN product_images ON product.id_product = product_images.product_id
        GROUP BY cart.id, product.id_product, product.name, product.price, product.currency, cart.quantity
    `;
    db.query(query, callback);
};

exports.removeFromCart = (cartId, callback) => {
    const query = 'DELETE FROM cart WHERE id = ?';
    db.query(query, [cartId], callback);
};
