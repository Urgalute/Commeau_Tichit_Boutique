const bcrypt = require('bcryptjs');
const db = require('../config/db');

exports.showLoginPage = (req, res) => {
    res.render('login');
};

exports.login = (req, res) => {
    const { username, password } = req.body;

    const query = 'SELECT * FROM users WHERE username = ?';
    db.query(query, [username], (err, results) => {
        if (err) {
            console.error('Error fetching user:', err);
            return res.status(500).json({ message: 'Error fetching user', error: err });
        }

        if (results.length === 0) {
            return res.status(401).json({ message: 'Invalid username or password' });
        }

        const user = results[0];
        bcrypt.compare(password, user.password, (err, isMatch) => {
            if (err) {
                console.error('Error comparing passwords:', err);
                return res.status(500).json({ message: 'Error comparing passwords', error: err });
            }

            if (isMatch) {
                req.session.userId = user.id;
                req.session.username = user.username;
                req.session.role = user.role;
                res.redirect('/');
            } else {
                res.status(401).json({ message: 'Invalid username or password' });
            }
        });
    });
};

exports.showRegisterPage = (req, res) => {
    res.render('register');
};

exports.register = (req, res) => {
    const { username, password, email } = req.body;

    bcrypt.hash(password, 10, (err, hashedPassword) => {
        if (err) {
            console.error('Error hashing password:', err);
            return res.status(500).json({ message: 'Error hashing password', error: err });
        }

        const query = 'INSERT INTO users (username, password, email, role) VALUES (?, ?, ?, ?)';
        db.query(query, [username, hashedPassword, email, 'user'], (err, result) => {
            if (err) {
                console.error('Error creating user:', err);
                return res.status(500).json({ message: 'Error creating user', error: err });
            }

            res.redirect('/auth/login');
        });
    });
};

exports.logout = (req, res) => {
    req.session.destroy();
    res.redirect('/');
};
