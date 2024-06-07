const bcrypt = require('bcrypt');
const db = require('./config/db'); // Assurez-vous que le chemin est correct

const createAdmin = async () => {
    const username = 'admin';
    const email = 'admin@example.com';
    const password = 'yourAdminPassword'; // Remplacez par le mot de passe de l'administrateur
    const role = 'admin';

    try {
        const hashedPassword = await bcrypt.hash(password, 10);

        const query = 'INSERT INTO users (username, email, password, role) VALUES (?, ?, ?, ?)';
        const values = [username, email, hashedPassword, role];

        db.query(query, values, (err, results) => {
            if (err) {
                console.error('Error inserting admin user:', err);
            } else {
                console.log('Admin user created successfully');
            }
        });
    } catch (error) {
        console.error('Error hashing password:', error);
    }
};

createAdmin();
