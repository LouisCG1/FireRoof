const express = require('express');
const router = express.Router();
const userService = require("../services/userService");

/**
 * @swagger
 * path:
 *  /user/all:
 *    get:
 *      summary: Get all users
 *      tags: [Users]
 *      responses:
 *        "200":
 *          description: An array of all users
 *          content:
 *            application/json:
 *              schema:
 *                $ref: '#/components/schemas/User'
 */
router.get('/all', userService.getAll);
router.get('/:id', userService.getOneById);
router.post('/', userService.createOne);
router.put('/:id', userService.saveOne);
router.delete('/:id', userService.deleteOne);

module.exports = router;
