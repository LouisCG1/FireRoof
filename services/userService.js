const db = require("../models");

function getAll(req, res) {
    db.user.findAll().then(users => {
        console.log(users);
        res.send(users);
    });
    // res.json({ message: 'Votre requête a bien été reçue !' });
}

module.exports = {
    getAll
};
