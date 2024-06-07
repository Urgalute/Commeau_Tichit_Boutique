const db = require('../config/db');

const getAllProducts = (sortOrder, category, color, limit, offset) => {
    return new Promise((resolve, reject) => {
        let query = `
            SELECT product.*, GROUP_CONCAT(DISTINCT product_images.image_url) AS images, MIN(asso_size.price) AS price
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
        } else if (sortOrder === 'name_desc') {
            query += ' ORDER BY product.name DESC';
        } else {
            query += ' ORDER BY product.id_product ASC';
        }

        query += ' LIMIT ? OFFSET ?';
        queryParams.push(limit, offset);

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
        const sortOrder = req.query.sort || 'default';
        const category = req.query.category || '';
        const color = req.query.color || '';
        const page = parseInt(req.query.page) || 1;
        const limit = 9;
        const offset = (page - 1) * limit;

        const [products, categories, colors, totalCount] = await Promise.all([
            getAllProducts(sortOrder, category, color, limit, offset),
            getAllCategories(),
            getAllColors(),
            getProductCount(category, color)
        ]);

        const totalPages = Math.ceil(totalCount / limit);

        const productsWithSizes = await Promise.all(products.map(async product => {
            product.sizes = await getSizesByProductId(product.id_product);
            return product;
        }));

        res.render('home', {
            products: productsWithSizes,
            categories,
            colors,
            selectedCategory: category,
            selectedColor: color,
            sortOrder,
            currentPage: page,
            totalPages
        });
    } catch (err) {
        console.error('Error fetching products:', err);
        res.status(500).json({ message: 'Error fetching products', error: err });
    }
};

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
        const { category, color, sort } = req.body;
        console.log('FilterProducts function called');
        console.log('Category:', category, 'Color:', color, 'Sort:', sort);

        let query = `
            SELECT product.*, GROUP_CONCAT(product_images.image_url) AS images, MIN(asso_size.price) AS min_price
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

        // Ajoutez des clauses ORDER BY en fonction du paramètre de tri
        if (sort) {
            if (sort === 'price_asc') {
                query += ' ORDER BY min_price ASC';
            } else if (sort === 'price_desc') {
                query += ' ORDER BY min_price DESC';
            } else if (sort === 'name_asc') {
                query += ' ORDER BY product.name ASC';
            } else if (sort === 'name_desc') {
                query += ' ORDER BY product.name DESC';
            }
        } else {
            // Trier par défaut par id_product
            query += ' ORDER BY product.id_product ASC';
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
                colors: colors
            });
        });
    } catch (err) {
        console.error('Error filtering products:', err);
        res.status(500).json({ message: 'Error filtering products', error: err });
    }
};


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

const getProductCount = (category, color) => {
    return new Promise((resolve, reject) => {
        let query = 'SELECT COUNT(DISTINCT product.id_product) AS count FROM product';
        let conditions = [];
        let params = [];

        if (category) {
            conditions.push('product.id_category = ?');
            params.push(category);
        }

        if (color) {
            conditions.push('product.id_product IN (SELECT id_product FROM asso_color WHERE id_color = ?)');
            params.push(color);
        }

        if (conditions.length > 0) {
            query += ' WHERE ' + conditions.join(' AND ');
        }

        db.query(query, params, (err, results) => {
            if (err) {
                reject(err);
            } else {
                resolve(results[0].count);
            }
        });
    });
};
