const express = require('express');
const router = express.Router();
const favoriteController = require('../controllers/favoriteController');

router.get('/', favoriteController.getFavorites);
router.post('/add/:id', favoriteController.addToFavorites);
router.post('/remove', favoriteController.removeFromFavorites);

module.exports = router;
