const db = require('../config/db');

exports.getFavorites = (req, res) => {
    console.log('Fetching favorite products...');
    if (!req.session.favorites) {
        req.session.favorites = [];
    }

    const favoriteIds = req.session.favorites;
    console.log('Favorite IDs:', favoriteIds);

    if (favoriteIds.length === 0) {
        return res.render('favorites', { favoriteItems: [] });
    }

    const query = `
        SELECT product.id_product, product.name, MIN(asso_size.price) AS price, product.currency, MIN(product_images.image_url) AS image_url
        FROM product
        LEFT JOIN product_images ON product.id_product = product_images.product_id
        LEFT JOIN asso_size ON product.id_product = asso_size.id_product
        WHERE product.id_product IN (?)
        GROUP BY product.id_product, product.name, product.currency
    `;

    db.query(query, [favoriteIds], (err, results) => {
        if (err) {
            console.error('Error fetching favorite products:', err);
            return res.status(500).json({ message: 'Error fetching favorite products', error: err });
        }
        console.log('Favorite products fetched:', results);
        res.render('favorites', { favoriteItems: results });
    });
};

exports.addToFavorites = (req, res) => {
    console.log('Adding product to favorites...');
    const productId = req.params.id;

    if (!req.session.favorites) {
        req.session.favorites = [];
    }

    if (!req.session.favorites.includes(productId)) {
        req.session.favorites.push(productId);
    }

    console.log('Updated favorites:', req.session.favorites);
    res.json({ message: 'Product added to favorites' });
};


exports.removeFromFavorites = (req, res) => {
    console.log('Removing product from favorites...');
    const productId = req.body.productId;

    if (!req.session.favorites) {
        req.session.favorites = [];
    }

    req.session.favorites = req.session.favorites.filter(id => id !== productId);
    console.log('Updated favorites:', req.session.favorites);

    // Rediriger vers la page des favoris après la suppression
    res.redirect('/favorites');
};