// paymentRoutes.js
const express = require('express');
const router = express.Router();
const PaymentController = require('../controllers/paymentController');

// Affichage du formulaire de paiement
router.get('/', PaymentController.paymentPage);
router.get('/processpayment', PaymentController.processPayment);

/*(req, res) => {
    res.render('payment', { selectedAddress: req.session.selectedAddress });
    console.log(req.session.selectedAddress)
});*/



module.exports = router;
