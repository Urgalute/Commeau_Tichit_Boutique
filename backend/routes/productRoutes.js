const express = require('express');
const router = express.Router();
const productController = require('../controllers/productController');

router.get('/', productController.getAllProducts);
router.get('/product/:id', productController.getProductById);

router.get('/api/price', async (req, res) => {
    try {
        const { productId, size } = req.query;
        const price = await productController.getPriceByProductIdAndSize(productId, size);
        res.json(price);
    } catch (err) {
        console.error('Error fetching price:', err);
        res.status(500).json({ message: 'Error fetching price', error: err });
    }
});

module.exports = router;
