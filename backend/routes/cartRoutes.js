const express = require('express');
const router = express.Router();
const cartController = require('../controllers/cartController');

router.get('/', cartController.viewCart);
router.post('/add/:id', cartController.addToCart);
router.post('/remove', cartController.removeFromCart); // Vérifiez que cette ligne est correcte
router.get('/confirm', cartController.confirmCart);
router.post('/checkout', cartController.placeOrder);
router.post('/validate-address', cartController.validateAddress);
router.post('/update/:id', cartController.updateQuantity);

module.exports = router;
