const db = require('../config/db');

const getProductById = async (productId) => {
  const productQuery = `
      SELECT product.*, GROUP_CONCAT(product_images.image_url) AS images
      FROM product
      LEFT JOIN product_images ON product.id_product = product_images.product_id
      WHERE product.id_product = ?
      GROUP BY product.id_product
  `;
  const sizesQuery = `
      SELECT asso_size.id_size, size.label, asso_size.price
      FROM asso_size
      JOIN size ON asso_size.id_size = size.id_size
      WHERE id_product = ?
  `;

  const [product] = await db.query(productQuery, [productId]);
  const sizes = await db.query(sizesQuery, [productId]);

  return {
      ...product[0],
      sizes
  };
};


const getAllProducts = () => {
  return new Promise((resolve, reject) => {
      const query = `
          SELECT product.*, GROUP_CONCAT(product_images.image_url) AS images
          FROM product
          LEFT JOIN product_images ON product.id_product = product_images.product_id
          GROUP BY product.id_product;
      `;

      db.query(query, (err, results) => {
          if (err) {
              reject(err);
          } else {
              resolve(results);
          }
      });
  });
};

const getCategories = () => {
  return new Promise((resolve, reject) => {
      const query = 'SELECT * FROM category';
      
      db.query(query, (err, results) => {
          if (err) {
              reject(err);
          } else {
              resolve(results);
          }
      });
  });
};


const getColors = () => {
  return new Promise((resolve, reject) => {
      const query = 'SELECT * FROM color';
      
      db.query(query, (err, results) => {
          if (err) {
              reject(err);
          } else {
              resolve(results);
          }
      });
  });
};

module.exports = {
  getAllProducts,
  getCategories,
  getColors
};

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
