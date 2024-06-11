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

exports.updateStocks = (cart, callback) => {
    const aggregatedCart = cart.reduce((acc, item) => {
        const { productId, quantity } = item;
        if (!acc[productId]) {
            acc[productId] = 0;
        }
        acc[productId] += quantity;
        return acc;
    }, {});

    let itemsProcessed = 0;
    let errorOccurred = false;
    const productIds = Object.keys(aggregatedCart);

    productIds.forEach(productId => {
        const totalQuantity = aggregatedCart[productId];
        const selectQuery = 'SELECT stock FROM product WHERE id_product = ?';

        db.query(selectQuery, [productId], (error, results) => {
            if (error) {
                if (!errorOccurred) {
                    errorOccurred = true;
                    return callback(error);
                }
            }

            if (results.length > 0) {
                const currentStock = results[0].stock;
                const newStock = Math.max(0, currentStock - totalQuantity);
                console.log(`Produit ${productId}, Stock actuel: ${currentStock}, Nouveau stock: ${newStock}`);
                const updateQuery = 'UPDATE product SET stock = ? WHERE id_product = ?';

                db.query(updateQuery, [newStock, productId], (error, results) => {
                    if (error) {
                        if (!errorOccurred) {
                            errorOccurred = true;
                            return callback(error);
                        }
                    }

                    console.log(`Stock mis à jour pour le produit ${productId}`);
                    itemsProcessed++;
                    if (itemsProcessed === productIds.length && !errorOccurred) {
                        callback(null);
                    }
                });
            } else {
                console.error(`Produit ${productId} non trouvé dans le stock`);

                itemsProcessed++;
                if (itemsProcessed === productIds.length && !errorOccurred) {
                    callback(null);
                }
            }
        });
    });
};