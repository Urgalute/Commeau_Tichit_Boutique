const db = require('../config/db');

// Fonction pour obtenir le panier
exports.getCart = (req, res) => {
    const cart = req.session.cart || [];

    if (cart.length === 0) {
        return res.render('cart', { cartItems: [] });
    }

    const productIds = cart.map(item => item.productId);

    const query = `
        SELECT product.id_product, product.name, asso_size.price, product.currency, product_images.image_url, size.label AS size
        FROM product
        LEFT JOIN product_images ON product.id_product = product_images.product_id
        LEFT JOIN asso_size ON product.id_product = asso_size.id_product
        LEFT JOIN size ON asso_size.id_size = size.id_size
        WHERE product.id_product IN (?)
        GROUP BY product.id_product, product.name, asso_size.price, product.currency, product_images.image_url, size.label
    `;

    db.query(query, [productIds], (err, products) => {
        if (err) {
            console.error(err);
            return res.status(500).json({ message: 'Error fetching cart', error: err });
        }

        const cartItems = cart.map(item => {
            const product = products.find(p => p.id_product == item.productId && p.size == item.size);
            return {
                ...product,
                quantity: item.quantity
            };
        });

        res.render('cart', { cartItems });
    });
};

// Fonction pour confirmer le panier
exports.confirmCart = (req, res) => {
    const cart = req.session.cart || [];

    if (cart.length === 0) {
        return res.render('confirmCart', { cartItems: [], addresses: [] });
    }

    const productIds = cart.map(item => item.productId);

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
            return res.status(500).json({ message: 'Error fetching cart', error: err });
        }

        const cartItems = cart.map(item => {
            const product = products.find(p => p.id_product == item.productId);
            return {
                ...product,
                quantity: item.quantity
            };
        });

        res.render('confirmCart', { cartItems, addresses: req.session.addresses || [] });
    });
};

// Fonction pour afficher la page de paiement
exports.checkout = (req, res) => {
    const addresses = req.session.addresses || [];
    res.render('checkout', { addresses });
};

// Fonction pour passer une commande
exports.placeOrder = (req, res) => {
    const addresses = req.session.addresses || [];
    addresses.push(req.body);
    req.session.addresses = addresses;
    res.redirect('/cart/confirm');
};

// Fonction pour valider une adresse
exports.validateAddress = (req, res) => {
    const selectedAddressIndex = req.body.selectedAddressIndex;
    req.session.selectedAddress = req.session.addresses[selectedAddressIndex];
    res.redirect('/payment');
};

// Fonction pour ajouter un produit au panier
exports.addToCart = (req, res) => {
    const productId = req.params.id;
    const size = req.body.size || 'S'; // Default to 'S'
    const quantity = parseInt(req.body.quantity, 10) || 1;

    if (!req.session.cart) {
        req.session.cart = [];
    }

    const existingProductIndex = req.session.cart.findIndex(item => item.productId == productId && item.size == size);

    if (existingProductIndex !== -1) {
        req.session.cart[existingProductIndex].quantity += quantity;
    } else {
        req.session.cart.push({ productId, size, quantity });
    }

    res.redirect('/');
};

// Fonction pour supprimer un produit du panier
exports.removeFromCart = (req, res) => {
    const { productId, size } = req.body;
    console.log('Removing item:', { productId, size });

    if (!req.session.cart) {
        req.session.cart = [];
    }

    // Log the initial state of the cart
    console.log('Initial cart:', req.session.cart);

    // Use strict comparison and ensure types are correct
    req.session.cart = req.session.cart.filter(item => !(item.productId == productId && item.size === size));

    // Log the updated state of the cart
    console.log('Updated cart:', req.session.cart);

    res.redirect('/cart'); // Rediriger vers la page du panier après la suppression
};

// Fonction pour mettre à jour la quantité d'un produit dans le panier
exports.updateQuantity = (req, res) => {
    const productId = req.params.id;
    const quantity = parseInt(req.body.quantity, 10);

    if (!req.session.cart) {
        req.session.cart = [];
    }

    const productIndex = req.session.cart.findIndex(item => item.productId == productId);

    if (productIndex !== -1 && quantity > 0) {
        req.session.cart[productIndex].quantity = quantity;
    } else if (quantity <= 0) {
        req.session.cart = req.session.cart.filter(item => item.productId != productId);
    }

    res.redirect('/cart');
};

// Fonction pour afficher le panier
exports.viewCart = (req, res) => {
    const cart = req.session.cart || [];

    if (cart.length === 0) {
        return res.render('cart', { cartItems: [] });
    }

    const productIds = cart.map(item => item.productId);

    const query = `
        SELECT product.id_product, product.name, asso_size.price, product.currency, product_images.image_url, size.label AS size
        FROM product
        LEFT JOIN product_images ON product.id_product = product_images.product_id
        LEFT JOIN asso_size ON product.id_product = asso_size.id_product
        LEFT JOIN size ON asso_size.id_size = size.id_size
        WHERE product.id_product IN (?)
        GROUP BY product.id_product, product.name, asso_size.price, product.currency, product_images.image_url, size.label
    `;

    db.query(query, [productIds], (err, products) => {
        if (err) {
            console.error(err);
            return res.status(500).json({ message: 'Error fetching cart', error: err });
        }

        const cartItems = cart.map(item => {
            const product = products.find(p => p.id_product == item.productId && p.size == item.size);
            return {
                ...product,
                quantity: item.quantity
            };
        });

        res.render('cart', { cartItems });
    });
};
