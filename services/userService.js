const db = require("../models");

function getAll(req, res) {
    db.user.findAll().then(users => {
        res.send(users);
    });
}

function getOneById(req, res) {
    db.user.findByPk(req.params.id).then(user => {
        res.send(user);
    });
}

function createOne(req, res) {
    db.user.create({
        username: req.body.username,
        email: req.body.email,
        password: req.body.password,
        privilegeLevel: req.body.privilegeLevel
    }).then(user => {
        res.json(user);
    });
}

function saveOne(req, res) {
    db.user.update({
        username: req.body.username,
        email: req.body.email,
        password: req.body.password,
        privilegeLevel: req.body.privilegeLevel
    },
    {
        where: {
            id: req.params.id
        }
    }).then(response => {
        res.json(response);
    });
}

function deleteOne(req, res) {
    db.user.destroy({
        where: {
          id: req.params.id
        }
    }).then(response => {
        res.json(response);
    });
}

module.exports = {
    getAll,
    getOneById,
    createOne,
    saveOne,
    deleteOne
};
