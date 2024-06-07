const express = require('express');
const router = express.Router();
const adminController = require('../controllers/adminController');
const { authenticateToken, authorizeAdmin } = require('../middlewares/authMiddleware');

// Assurez-vous que toutes ces fonctions existent dans adminController
router.get('/dashboard', authenticateToken, authorizeAdmin, adminController.showAdminDashboard);
router.post('/products/add', authenticateToken, authorizeAdmin, adminController.addProduct);
router.post('/products/update', authenticateToken, authorizeAdmin, adminController.updateProduct);
router.post('/products/delete', authenticateToken, authorizeAdmin, adminController.deleteProduct);
router.get('/orders', authenticateToken, authorizeAdmin, adminController.listOrders);

// Route pour afficher le formulaire d'édition du produit
router.get('/products/edit/:id_product', authenticateToken, authorizeAdmin, adminController.showEditProductForm);

module.exports = router;
