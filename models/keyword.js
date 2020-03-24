/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('keyword', {
    id: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    content: {
      type: DataTypes.STRING(50),
      allowNull: false,
      unique: true
    }
  }, {
    tableName: 'keyword'
  });
};
