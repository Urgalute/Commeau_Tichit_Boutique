// backend/routes/productRoutes.js
const express = require('express');
const router = express.Router();
const productController = require('../controllers/productController');

router.get('/', productController.getAllProducts);
router.post('/filter', productController.filterProducts);
router.get('/product/:id', productController.getProductById);

module.exports = router;
