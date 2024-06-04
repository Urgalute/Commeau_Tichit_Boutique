const express = require('express');
const router = express.Router();
const productController = require('../controllers/productController');

router.get('/', productController.getAllProducts);
router.post('/filter', productController.filterProducts);
router.get('/product/:id', productController.getProductById);

router.get('/api/price', async (req, res) => {
    try {
        const { productId, size } = req.query;
        const price = await getPriceByProductIdAndSize(productId, size);
        res.json(price);
    } catch (err) {
        console.error('Error fetching price:', err);
        res.status(500).json({ message: 'Error fetching price', error: err });
    }
});

const getPriceByProductIdAndSize = (productId, sizeLabel) => {
    return new Promise((resolve, reject) => {
        const query = `
            SELECT asso_size.price, product.currency
            FROM asso_size
            JOIN size ON asso_size.id_size = size.id_size
            JOIN product ON asso_size.id_product = product.id_product
            WHERE asso_size.id_product = ? AND size.label = ?
        `;

        db.query(query, [productId, sizeLabel], (err, results) => {
            if (err) {
                reject(err);
            } else {
                resolve(results[0]);
            }
        });
    });
};

module.exports = router;
