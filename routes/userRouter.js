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

module.exports = router;
