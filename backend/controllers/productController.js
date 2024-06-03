const db = require('../config/db');

exports.getAllProducts = (req, res) => {
    const query = `
        SELECT product.*, GROUP_CONCAT(product_images.image_url) AS images
        FROM product
        LEFT JOIN product_images ON product.id_product = product_images.product_id
        GROUP BY product.id_product;
    `;

    const categoriesQuery = 'SELECT * FROM category';
    const colorsQuery = 'SELECT * FROM color';

    db.query(categoriesQuery, (err, categories) => {
        if (err) {
            console.error(err);
            return res.status(500).json({ message: 'Error fetching categories', error: err });
        }

        console.log("Fetched categories:", categories);  // Debugging line

        db.query(colorsQuery, (err, colors) => {
            if (err) {
                console.error(err);
                return res.status(500).json({ message: 'Error fetching colors', error: err });
            }

            console.log("Fetched colors:", colors);  // Debugging line

            db.query(query, (err, results) => {
                if (err) {
                    console.error(err);
                    return res.status(500).json({ message: 'Error fetching products', error: err });
                }

                res.render('home', {
                    products: results,
                    selectedCategory: '',
                    selectedColor: '',
                    categories: categories,
                    colors: colors
                });
            });
        });
    });
};

exports.filterProducts = (req, res) => {
    const { category, color } = req.body;
    let query = `
        SELECT product.*, GROUP_CONCAT(product_images.image_url) AS images
        FROM product
        LEFT JOIN product_images ON product.id_product = product_images.product_id
    `;

    const filters = [];
    if (category) filters.push(`product.id_category = ${db.escape(category)}`);
    if (color) filters.push(`product.id_product IN (SELECT id_product FROM asso_color WHERE id_color = ${db.escape(color)})`);

    if (filters.length > 0) {
        query += ' WHERE ' + filters.join(' AND ');
    }

    query += ' GROUP BY product.id_product';

    const categoriesQuery = 'SELECT * FROM category';
    const colorsQuery = 'SELECT * FROM color';

    db.query(categoriesQuery, (err, categories) => {
        if (err) {
            console.error(err);
            return res.status(500).json({ message: 'Error fetching categories', error: err });
        }

        console.log("Fetched categories:", categories);  // Debugging line

        db.query(colorsQuery, (err, colors) => {
            if (err) {
                console.error(err);
                return res.status(500).json({ message: 'Error fetching colors', error: err });
            }

            console.log("Fetched colors:", colors);  // Debugging line

            db.query(query, (err, results) => {
                if (err) {
                    console.error(err);
                    return res.status(500).json({ message: 'Error fetching products', error: err });
                }

                res.render('home', {
                    products: results,
                    selectedCategory: category || '',
                    selectedColor: color || '',
                    categories: categories,
                    colors: colors
                });
            });
        });
    });
};

exports.getProductById = (req, res) => {
    const productId = req.params.id;

    const query = `
        SELECT product.id_product, product.name, product.description, product.price, product.currency, GROUP_CONCAT(product_images.image_url) AS images
        FROM product
        LEFT JOIN product_images ON product.id_product = product_images.product_id
        WHERE product.id_product = ?
        GROUP BY product.id_product
    `;

    db.query(query, [productId], (err, result) => {
        if (err) {
            console.error('Error fetching product:', err);
            res.status(500).json({ message: 'Error fetching product', error: err });
        } else {
            if (result.length === 0) {
                return res.status(404).json({ message: 'Product not found' });
            }

            const product = result[0];

            // Fetch random products
            const randomProductsQuery = `
                SELECT product.id_product, product.name, product.price, product.currency, GROUP_CONCAT(product_images.image_url) AS images
                FROM product
                LEFT JOIN product_images ON product.id_product = product_images.product_id
                WHERE product.id_product != ?
                GROUP BY product.id_product
                ORDER BY RAND()
                LIMIT 5
            `;

            db.query(randomProductsQuery, [product.id_product], (err, randomProducts) => {
                if (err) {
                    console.error('Error fetching random products:', err);
                    res.status(500).json({ message: 'Error fetching random products', error: err });
                } else {
                    res.render('productDetails', { product, randomProducts });
                }
            });
        }
    });
};
