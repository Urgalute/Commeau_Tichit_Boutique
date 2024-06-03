// backend/routes/favoriteRoutes.js

const express = require('express');
const router = express.Router();
const favoritesController = require('../controllers/favoritesController');

router.post('/add/:id', favoritesController.addToFavorites);
router.post('/remove/:id', favoritesController.removeFromFavorites);
router.get('/', favoritesController.getFavorites);

module.exports = router;
