const express = require('express');
const path = require('path');
const db = require('./config/db');
const app = express();
const productRoutes = require('./routes/productRoutes');
const cartRoutes = require('./routes/cartRoutes');

// Configuration
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, '../frontend/views'));

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname, '../frontend/public')));

// Routes
app.use('/products', productRoutes);
app.use('/cart', cartRoutes);

app.get('/', (req, res) => {
    res.redirect('/products');
});

// Start the server
const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
    console.log(`Server running on port: http://localhost:${PORT}`);
});
