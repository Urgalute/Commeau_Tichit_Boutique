const express = require('express');
const router = express.Router();
const userController = require('../controllers/userController');

router.post('/login', userController.loginUser);
router.post('/register', userController.registerUser);
router.get('/login', (req, res) => {
    res.render('login'); // Assurez-vous que le fichier login.ejs existe dans le dossier views
});
router.get('/register', (req, res) => {
    res.render('register'); // Assurez-vous que le fichier register.ejs existe dans le dossier views
});

module.exports = router;
