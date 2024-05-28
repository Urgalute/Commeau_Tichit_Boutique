const db = require('../config/db');

exports.getAll = ({ category, color }, callback) => {
  let query = 'SELECT p.* FROM product p';
  const params = [];

  if (color) {
    query += ' JOIN asso_color ac ON p.id_product = ac.id_product WHERE ac.id_color = ?';
    params.push(color);
  }

  if (category) {
    if (params.length > 0) {
      query += ' AND p.id_category = ?';
    } else {
      query += ' WHERE p.id_category = ?';
    }
    params.push(category);
  }

  db.query(query, params, callback);
};

exports.getCategories = (callback) => {
  db.query('SELECT * FROM category', callback);
};

exports.getColors = (callback) => {
  db.query('SELECT * FROM color', callback);
};

exports.getById = (id, callback) => {
    db.query('SELECT * FROM product WHERE id_product = ?', [id], (err, results) => {
      if (err) {
        return callback(err);
      }
      callback(null, results[0]);
    });
  };