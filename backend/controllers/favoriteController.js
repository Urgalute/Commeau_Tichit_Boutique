const db = require('../config/db');

exports.getFavorites = (req, res) => {
    const favorites = req.session.favorites || [];
    if (favorites.length === 0) {
        return res.render('favorites', { favoriteItems: [] });
    }

    const productIds = favorites.map(item => item.productId);

    const query = `
        SELECT product.id_product, product.name, product.description, asso_size.price, product.currency, product_images.image_url
        FROM product
        LEFT JOIN product_images ON product.id_product = product_images.product_id
        LEFT JOIN asso_size ON product.id_product = asso_size.id_product
        WHERE product.id_product IN (?)
        GROUP BY product.id_product, asso_size.price, product.currency, product_images.image_url;
    `;

    db.query(query, [productIds], (err, products) => {
        if (err) {
            console.error(err);
            return res.status(500).json({ message: 'Error fetching favorites', error: err });
        }

        const favoriteItems = favorites.map(favorite => {
            const product = products.find(p => p.id_product == favorite.productId);
            return {
                ...product,
                price: product.price // Assurez-vous que le prix correspond à la taille choisie, ici simplifié
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

    const existingFavorite = req.session.favorites.find(item => item.productId == productId);

    if (!existingFavorite) {
        req.session.favorites.push({ productId });
    }

    res.json({ success: true, message: 'le produit a bien été ajouté a vos favoris.' });
};

exports.removeFromFavorites = (req, res) => {
    const productId = req.body.productId;

    if (!req.session.favorites) {
        req.session.favorites = [];
    }

    req.session.favorites = req.session.favorites.filter(item => item.productId != productId);

    res.json({ success: true, message: 'Removed from favorites' });
};


