const express = require('express');
const router = express.Router();
const addressController = require('../controllers/addressController');

router.get('/', addressController.getAllAddresses);
router.post('/add', addressController.addAddress);

module.exports = router;
