/* jshint indent: 2 */

/**
 * @swagger
 *  tags:
 *    name: Users
 *    description: User management
 */

/**
 * @swagger
 *  components:
 *    schemas:
 *      User:
 *        type: object
 *        required:
 *          - username
 *          - email
 *          - password
 *          - privilegeLevel
 *        properties:
 *          username:
 *            type: string
 *          email:
 *            type: string
 *            format: email
 *            uniqueItems: true
 *          password:
 *            type: string
 *            format: password
 *          privilegeLevel:
 *            type: integer
 *        example:
 *           name: Alexander
 *           email: fake@email.com
 *           privilegeLevel: 0
 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('user', {
    id: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    username: {
      type: DataTypes.STRING(50),
      allowNull: false,
      unique: true
    },
    email: {
      type: DataTypes.STRING(50),
      allowNull: false,
      unique: true
    },
    password: {
      type: DataTypes.STRING(50),
      allowNull: false
    },
    privilegeLevel: {
      type: DataTypes.INTEGER(1),
      allowNull: false,
      defaultValue: '0'
    }
  }, {
    tableName: 'user'
  });
};
