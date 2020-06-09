const express = require('express');
const router = express.Router();
const swaggerJsdoc = require("swagger-jsdoc");
const swaggerUi = require("swagger-ui-express");
const userRouter = require('./userRouter');

router.use('/user', userRouter);

const options = {
  swaggerDefinition: {
    openapi: "3.0.3",
    info: {
      title: "FireRoof API",
      version: "1.0.0"
    },
    servers: [
      {
        url: "http://localhost:3000/api"
      }
    ]
  },
  apis: ["./models/*.js", "./routes/*.js"]
};
const specs = swaggerJsdoc(options);
router.use("/docs", swaggerUi.serve);
router.get(
    "/docs",
    swaggerUi.setup(specs, {
      explorer: true
    })
);

module.exports = router;
