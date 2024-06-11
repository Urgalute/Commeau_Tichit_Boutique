// paymentController.js
const db = require('../config/db');
const token = "f100e8f9-fc3d-4ad7-848b-ed97d10c1817";
const Cart = require('../models/Cart');

class PaymentController {
    static paymentPage(req, res) {
        if (!req.session.selectedAddress) {
            return res.redirect('/cart');
        }
        console.log(req.session.selectedAddress);
        // console.log(req.cart.price);
        res.render('payment', { selectedAddress: req.session.selectedAddress });
    };

    static processPayment(req, res) {
        const cart = req.session.cart;

        //Mise à jour des stock suite à l'achat
        Cart.updateStocks(cart, (err) => {
            if (err) {
                console.error('Erreur lors de la mise à jour des stocks:', err);
                return res.status(500).send('Erreur interne du serveur');
            }

            // Suppression du panier
            console.log('Cart before clearing:', cart);
            req.session.cart = [];
            console.log('Cart after clearing:', req.session.cart);
            
            res.render('confirmPurchase');
        });
    }
}
module.exports = PaymentController;