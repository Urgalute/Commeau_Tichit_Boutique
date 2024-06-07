const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const db = require('../config/db');

exports.showLogin = (req, res) => {
    res.render('login');
};

exports.showRegister = (req, res) => {
    res.render('register');
};

exports.registerUser = (req, res) => {
    const { username, email, password } = req.body;
    const hashedPassword = bcrypt.hashSync(password, 10);

    const query = 'INSERT INTO users (username, email, password) VALUES (?, ?, ?)';
    db.query(query, [username, email, hashedPassword], (err, result) => {
        if (err) {
            console.error('Error registering user:', err);
            return res.status(500).json({ message: 'Error registering user', error: err });
        }
        res.status(201).json({ message: 'User registered successfully' });
    });
};

exports.loginUser = (req, res) => {
    const { username, password } = req.body;

    console.log('Login attempt for user:', username); // Debugging log

    const query = 'SELECT * FROM users WHERE username = ?';
    db.query(query, [username], (err, results) => {
        if (err) {
            console.error('Error logging in user:', err);
            return res.status(500).json({ message: 'Error logging in user', error: err });
        }

        if (results.length === 0) {
            console.log('No user found with username:', username); // Debugging log
            return res.status(401).json({ message: 'Invalid username or password' });
        }

        const user = results[0];

        if (!bcrypt.compareSync(password, user.password)) {
            console.log('Invalid password for user:', username); // Debugging log
            return res.status(401).json({ message: 'Invalid username or password' });
        }

        const token = jwt.sign({ id: user.id, role: user.role }, 'secret_key', { expiresIn: '1h' });

        console.log('Login successful for user:', username); // Debugging log

        res.cookie('token', token, { httpOnly: true });
        res.redirect('/'); // Rediriger vers la page d'accueil après la connexion
    });
};

exports.logoutUser = (req, res) => {
    res.clearCookie('token');
    res.json({ message: 'Logout successful' });
};
