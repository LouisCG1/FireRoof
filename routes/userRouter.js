const express = require('express');
const router = express.Router();
const userService = require("../services/userService");

router.get('/', userService.getAll);
router.get('/:id', userService.getOneById);
router.post('/', userService.createOne);
router.put('/:id', userService.saveOne);
router.delete('/:id', userService.deleteOne);

module.exports = router;
