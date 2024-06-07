const express = require('express');
const app = express();
const path = require('path');
const bodyParser = require('body-parser');
const session = require('express-session');

console.log('Loading routes...');
const productRoutes = require('./routes/productRoutes');
const cartRoutes = require('./routes/cartRoutes');
const favoriteRoutes = require('./routes/favoriteRoutes'); // Assurez-vous que le nom est correct
const addressRoutes = require('./routes/addressRoutes');

console.log('Setting up middleware...');
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

console.log('Registering routes...');
app.use('/', productRoutes);
app.use('/cart', cartRoutes);
app.use('/favorites', favoriteRoutes); 
app.use('/addresses', addressRoutes);

app.get('/payment', (req, res) => {
    res.render('payment', { selectedAddress: req.session.selectedAddress });
});

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
    console.log(`Server running on port: http://localhost:${PORT}`);
});
