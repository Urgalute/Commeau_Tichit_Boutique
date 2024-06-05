const express = require('express');
const session = require('express-session');
const path = require('path');
const bodyParser = require('body-parser');

const app = express();

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(express.static(path.join(__dirname, '../frontend/public')));
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, '../frontend/views'));

app.use(session({
    secret: 'your-secret-key',
    resave: false,
    saveUninitialized: true
}));

const productRoutes = require('./routes/productRoutes');
app.use('/', productRoutes);  

const cartRoutes = require('./routes/cartRoutes');
app.use('/cart', cartRoutes);

const favoriteRoutes = require('./routes/favoriteRoutes');
app.use('/favorites', favoriteRoutes);

const addressRoutes = require('./routes/addressRoutes');
app.use('/addresses', addressRoutes);

app.get('/payment', (req, res) => {
    res.render('payment', { selectedAddress: req.session.selectedAddress });
});

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
    console.log(`Server running on port: http://localhost:${PORT}`);
});
