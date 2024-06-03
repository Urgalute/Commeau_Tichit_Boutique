const db = require('../config/db');
// backend/controllers/cartController.js

exports.getCart = (req, res) => {
    const cart = req.session.cart || [];

    if (cart.length === 0) {
        return res.render('cart', { cartItems: [] });
    }

    const productIds = cart.map(item => item.productId);

    const query = `
        SELECT product.id_product, product.name, product.price, product.currency, product_images.image_url
        FROM product
        LEFT JOIN product_images ON product.id_product = product_images.product_id
        WHERE product.id_product IN (?)
        GROUP BY product.id_product, product.name, product.price, product.currency, product_images.image_url
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

        res.render('cart', { cartItems });
    });
};

exports.confirmCart = (req, res) => {
    const cart = req.session.cart || [];

    if (cart.length === 0) {
        return res.render('confirmCart', { cartItems: [], addresses: [] });
    }

    const productIds = cart.map(item => item.productId);

    const query = `
        SELECT product.id_product, product.name, product.price, product.currency, product_images.image_url
        FROM product
        LEFT JOIN product_images ON product.id_product = product_images.product_id
        WHERE product.id_product IN (?)
        GROUP BY product.id_product, product.name, product.price, product.currency, product_images.image_url
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

exports.checkout = (req, res) => {
    const addresses = req.session.addresses || [];
    res.render('checkout', { addresses });
};

exports.placeOrder = (req, res) => {
    const addresses = req.session.addresses || [];
    addresses.push(req.body);
    req.session.addresses = addresses;
    res.redirect('/cart/confirm');
};

exports.validateAddress = (req, res) => {
    const selectedAddressIndex = req.body.selectedAddressIndex;
    req.session.selectedAddress = req.session.addresses[selectedAddressIndex];
    res.redirect('/payment');
};

exports.addToCart = (req, res) => {
    const productId = req.params.id;
    const quantity = parseInt(req.body.quantity, 10) || 1;

    if (!req.session.cart) {
        req.session.cart = [];
    }

    const existingProductIndex = req.session.cart.findIndex(item => item.productId == productId);

    if (existingProductIndex !== -1) {
        req.session.cart[existingProductIndex].quantity += quantity;
    } else {
        req.session.cart.push({ productId, quantity });
    }

    res.redirect('/');
};

exports.removeFromCart = (req, res) => {
    const productId = req.params.id;

    if (req.session.cart) {
        req.session.cart = req.session.cart.filter(item => item.productId != productId);
    }

    res.redirect('/cart');
}
