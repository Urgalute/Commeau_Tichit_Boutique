const db = require('../config/db');

exports.getFavorites = (req, res) => {
    const favorites = req.session.favorites || [];

    // Suppose que vous voulez aussi afficher des informations détaillées sur les produits favoris
    if (favorites.length === 0) {
        return res.render('favorites', { favoriteItems: [] });
    }

    const productIds = favorites.map(item => item.productId);

    const query = `
        SELECT product.id_product, product.name, asso_size.price, product.currency, product_images.image_url
        FROM product
        LEFT JOIN product_images ON product.id_product = product_images.product_id
        LEFT JOIN asso_size ON product.id_product = asso_size.id_product
        WHERE product.id_product IN (?)
        GROUP BY product.id_product, product.name, asso_size.price, product.currency, product_images.image_url
    `;

    db.query(query, [productIds], (err, products) => {
        if (err) {
            console.error(err);
            return res.status(500).json({ message: 'Error fetching favorites', error: err });
        }

        const favoriteItems = favorites.map(item => {
            const product = products.find(p => p.id_product == item.productId);
            return {
                ...product,
                ...item
            };
        });

        res.render('favorites', { favoriteItems });
    });
};

exports.addToFavorites = (req, res) => {
    const productId = req.params.id;

    if (!req.session.favorites) {
        req.session.favorites = [];
    }

    // Vérifier si le produit est déjà dans les favoris
    const existingFavorite = req.session.favorites.find(item => item.productId == productId);

    if (!existingFavorite) {
        // Ajouter aux favoris
        req.session.favorites.push({ productId });
    }

    res.redirect('/favorites');
};

exports.removeFromFavorites = (req, res) => {
    const productId = req.body.productId;

    if (!req.session.favorites) {
        req.session.favorites = [];
    }

    // Supprimer seulement le produit spécifié
    req.session.favorites = req.session.favorites.filter(item => item.productId != productId);

    res.redirect('/favorites');
};

