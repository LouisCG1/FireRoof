const express = require('express');
const router = express.Router();
const userService = require("../services/userService");

router.get('/all', userService.getAll);

module.exports = router;
