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

const updateStocks = async (cart) => {
    const aggregatedCart = cart.reduce((acc, item) => {
        const { productId, quantity } = item;
        if (!acc[productId]) {
            acc[productId] = 0;
        }
        acc[productId] += quantity;
        return acc;
    }, {});

    const productIds = Object.keys(aggregatedCart);

    const connection = await db.getConnection(); // Assuming you're using a connection pool
    try {
        await connection.beginTransaction();

        for (const productId of productIds) {
            const totalQuantity = aggregatedCart[productId];
            const [results] = await connection.query('SELECT stock FROM product WHERE id_product = ?', [productId]);

            if (results.length > 0) {
                const currentStock = results[0].stock;
                
                // Vérifier si le stock est suffisant
                if (totalQuantity > currentStock) {
                    throw new Error(`Stock insuffisant pour le produit ${productId}. Stock disponible: ${currentStock}, Quantité demandée: ${totalQuantity}`);
                }

                const newStock = Math.max(0, currentStock - totalQuantity);
                console.log(`Produit ${productId}, Stock actuel: ${currentStock}, Nouveau stock: ${newStock}`);

                await connection.query('UPDATE product SET stock = ? WHERE id_product = ?', [newStock, productId]);
                console.log(`Stock mis à jour pour le produit ${productId}`);
            } else {
                console.error(`Produit ${productId} non trouvé dans le stock`);
            }
        }

        await connection.commit();
        connection.release();
        return null; // Success
    } catch (error) {
        await connection.rollback();
        connection.release();
        throw error; // Propagate error
    }
};
