const db = require('../config/db');

const getAllProducts = (sortOrder, category, color) => {
    return new Promise((resolve, reject) => {
        let query = `
            SELECT product.*, GROUP_CONCAT(product_images.image_url) AS images, MIN(asso_size.price) AS price
            FROM product
            LEFT JOIN product_images ON product.id_product = product_images.product_id
            LEFT JOIN asso_size ON product.id_product = asso_size.id_product
            LEFT JOIN size ON asso_size.id_size = size.id_size
            LEFT JOIN asso_color ON product.id_product = asso_color.id_product
            WHERE 1=1
        `;

        const queryParams = [];

        if (category) {
            query += ' AND product.id_category = ?';
            queryParams.push(category);
        }

        if (color) {
            query += ' AND asso_color.id_color = ?';
            queryParams.push(color);
        }

        query += ' GROUP BY product.id_product';

        if (sortOrder === 'price_asc') {
            query += ' ORDER BY MIN(asso_size.price) ASC';
        } else if (sortOrder === 'price_desc') {
            query += ' ORDER BY MIN(asso_size.price) DESC';
        } else if (sortOrder === 'name_asc') {
            query += ' ORDER BY product.name ASC';
        } else {
            query += ' ORDER BY product.id_product ASC';
        }

        db.query(query, queryParams, (err, results) => {
            if (err) {
                reject(err);
            } else {
                resolve(results);
            }
        });
    });
};



exports.getAllProducts = async (req, res) => {
    try {
        const products = await getAllProducts();
        const sortOrder = req.query.sort || 'default';

        res.render('home', {
            products,
            sortOrder,
            user: req.user // Pass the user information to the view
        });
    } catch (err) {
        console.error('Error fetching products:', err);
        res.status(500).json({ message: 'Error fetching products', error: err });
    }
};



// Récupérer les tailles par ID de produit
const getSizesByProductId = (productId) => {
    return new Promise((resolve, reject) => {
        const query = `
            SELECT size.label, asso_size.price
            FROM asso_size
            JOIN size ON asso_size.id_size = size.id_size
            WHERE asso_size.id_product = ?
        `;

        db.query(query, [productId], (err, results) => {
            if (err) {
                reject(err);
            } else {
                resolve(results);
            }
        });
    });
};

// Récupérer toutes les catégories
const getAllCategories = () => {
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

// Récupérer toutes les couleurs
const getAllColors = () => {
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



exports.filterProducts = async (req, res) => {
    try {
        const { category, color } = req.body;
        const sortOrder = req.query.sort || 'default';
        let query = `
            SELECT product.*, GROUP_CONCAT(product_images.image_url) AS images, MIN(asso_size.price) AS price
            FROM product
            LEFT JOIN product_images ON product.id_product = product_images.product_id
            LEFT JOIN asso_size ON product.id_product = asso_size.id_product
            LEFT JOIN size ON asso_size.id_size = size.id_size
            LEFT JOIN asso_color ON product.id_product = asso_color.id_product
            WHERE 1=1
        `;

        const queryParams = [];

        if (category) {
            query += ' AND product.id_category = ?';
            queryParams.push(category);
        }

        if (color) {
            query += ' AND asso_color.id_color = ?';
            queryParams.push(color);
        }

        if (sortOrder === 'price_asc') {
            query += ' GROUP BY product.id_product ORDER BY MIN(asso_size.price) ASC';
        } else if (sortOrder === 'price_desc') {
            query += ' GROUP BY product.id_product ORDER BY MIN(asso_size.price) DESC';
        } else if (sortOrder === 'name_asc') {
            query += ' GROUP BY product.id_product ORDER BY product.name ASC';
        } else {
            query += ' GROUP BY product.id_product ORDER BY product.id_product ASC';
        }

        db.query(query, queryParams, async (err, products) => {
            if (err) {
                console.error('Error filtering products:', err);
                return res.status(500).json({ message: 'Error filtering products', error: err });
            }

            const productWithSizes = await Promise.all(products.map(async (product) => {
                const sizes = await getSizesByProductId(product.id_product);
                return { ...product, sizes };
            }));

            const categories = await getAllCategories();
            const colors = await getAllColors();

            res.render('home', {
                products: productWithSizes,
                selectedCategory: category,
                selectedColor: color,
                categories: categories,
                colors: colors,
                sortOrder: sortOrder // Assurez-vous de passer sortOrder à la vue
            });
        });
    } catch (err) {
        console.error('Error filtering products:', err);
        res.status(500).json({ message: 'Error filtering products', error: err });
    }
};

// Récupérer le produit par ID
exports.getProductById = async (req, res) => {
    try {
        const productId = req.params.id;
        const query = `
            SELECT product.*, 
                   GROUP_CONCAT(product_images.image_url) AS images, 
                   CASE 
                       WHEN promotion = 1 THEN promotional_price 
                       ELSE NULL 
                   END AS final_price
            FROM product
            LEFT JOIN product_images ON product.id_product = product_images.product_id
            WHERE product.id_product = ?
            GROUP BY product.id_product;
        `;

        db.query(query, [productId], async (err, results) => {
            if (err) {
                console.error('Error fetching product:', err);
                return res.status(500).json({ message: 'Error fetching product', error: err });
            }

            if (results.length === 0) {
                return res.status(404).json({ message: 'Product not found' });
            }

            const product = results[0];
            product.sizes = await getSizesByProductId(product.id_product);

            // Récupérer les produits recommandés
            const recommendedQuery = `
                SELECT product.*, 
                       GROUP_CONCAT(product_images.image_url) AS images, 
                       CASE 
                           WHEN promotion = 1 THEN promotional_price 
                           ELSE NULL 
                       END AS final_price
                FROM product
                LEFT JOIN product_images ON product.id_product = product_images.product_id
                WHERE product.id_product != ?
                GROUP BY product.id_product
                ORDER BY RAND()
                LIMIT 5;
            `;

            db.query(recommendedQuery, [productId], async (err, recommendedProducts) => {
                if (err) {
                    console.error('Error fetching recommended products:', err);
                    return res.status(500).json({ message: 'Error fetching recommended products', error: err });
                }

                const recommendedProductsWithSizes = await Promise.all(recommendedProducts.map(async (product) => {
                    const sizes = await getSizesByProductId(product.id_product);
                    return { ...product, sizes };
                }));

                res.render('productdetail', { product, recommendedProducts: recommendedProductsWithSizes });
            });
        });
    } catch (err) {
        console.error('Error fetching product:', err);
        res.status(500).json({ message: 'Error fetching product', error: err });
    }
};

exports.getPriceByProductIdAndSize = (productId, sizeLabel) => {
    return new Promise((resolve, reject) => {
        const query = `
            SELECT asso_size.price, product.currency
            FROM asso_size
            JOIN size ON asso_size.id_size = size.id_size
            JOIN product ON asso_size.id_product = product.id_product
            WHERE asso_size.id_product = ? AND size.label = ?
        `;

        db.query(query, [productId, sizeLabel], (err, results) => {
            if (err) {
                reject(err);
            } else {
                resolve(results[0]);
            }
        });
    });
};
