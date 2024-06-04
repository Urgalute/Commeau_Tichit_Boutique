const db = require('../config/db');

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

exports.getAllProducts = async (req, res) => {
    try {
        const products = await getAllProducts();

        // Ajouter les tailles aux produits
        const productWithSizes = await Promise.all(products.map(async (product) => {
            const sizes = await getSizesByProductId(product.id_product);
            return { ...product, sizes };
        }));

        res.render('home', {
            products: productWithSizes,
            selectedCategory: '',
            selectedColor: '',
            categories: [], // Ajoutez vos catégories ici
            colors: [] // Ajoutez vos couleurs ici
        });
    } catch (err) {
        console.error('Error fetching products:', err);
        res.status(500).json({ message: 'Error fetching products', error: err });
    }
};

exports.filterProducts = (req, res) => {
    // Implémentez la logique de filtrage des produits ici
    res.json({ message: 'Filtre des produits non encore implémenté.' });
};

const getProductById = (productId) => {
    return new Promise((resolve, reject) => {
        const query = `
            SELECT product.*, GROUP_CONCAT(product_images.image_url) AS images
            FROM product
            LEFT JOIN product_images ON product.id_product = product_images.product_id
            WHERE product.id_product = ?
            GROUP BY product.id_product;
        `;

        db.query(query, [productId], (err, results) => {
            if (err) {
                reject(err);
            } else {
                resolve(results[0]);
            }
        });
    });
};

exports.getProductById = async (req, res) => {
    try {
        const productId = req.params.id;
        const product = await getProductById(productId);

        if (!product) {
            return res.status(404).json({ message: 'Product not found' });
        }

        res.render('productdetail', { product });
    } catch (err) {
        console.error('Error fetching product details:', err);
        res.status(500).json({ message: 'Error fetching product details', error: err });
    }
};