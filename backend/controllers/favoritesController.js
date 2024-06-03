// backend/controllers/favoritesController.js

const db = require('../config/db');

exports.addToFavorites = (req, res) => {
    const productId = req.params.id;

    if (!req.session.favorites) {
        req.session.favorites = [];
    }

    if (!req.session.favorites.includes(productId)) {
        req.session.favorites.push(productId);
    }

    res.redirect('/');
};

exports.getFavorites = (req, res) => {
    const favorites = req.session.favorites || [];

    if (favorites.length === 0) {
        return res.render('favorites', { favoriteItems: [] });
    }

    const query = `
        SELECT product.id_product, product.name, product.price, product.currency, product_images.image_url
        FROM product
        LEFT JOIN product_images ON product.id_product = product_images.product_id
        WHERE product.id_product IN (?)
        GROUP BY product.id_product, product.name, product.price, product.currency, product_images.image_url
    `;

    db.query(query, [favorites], (err, products) => {
        if (err) {
            console.error(err);
            return res.status(500).json({ message: 'Error fetching favorites', error: err });
        }

        res.render('favorites', { favoriteItems: products });
    });
};

exports.removeFromFavorites = (req, res) => {
    const productId = req.params.id;

    if (req.session.favorites) {
        req.session.favorites = req.session.favorites.filter(id => id != productId);
    }

    res.redirect('/favorites');
};
