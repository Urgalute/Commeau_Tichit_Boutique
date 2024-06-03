exports.getAllAddresses = (req, res) => {
    const addresses = req.session.addresses || [];
    res.render('addresses', { addresses });
};

exports.addAddress = (req, res) => {
    const { address_line1, address_line2, city, state, postal_code, country } = req.body;
    const newAddress = { address_line1, address_line2, city, state, postal_code, country };

    if (!req.session.addresses) {
        req.session.addresses = [];
    }

    req.session.addresses.push(newAddress);
    res.redirect('/addresses');
};
