/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('language', {
    id: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    shortName: {
      type: DataTypes.STRING(20),
      allowNull: false
    },
    fullName: {
      type: DataTypes.STRING(50),
      allowNull: false
    }
  }, {
    tableName: 'language'
  });
};
