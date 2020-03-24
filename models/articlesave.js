/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('articlesave', {
    id: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    label: {
      type: DataTypes.STRING(100),
      allowNull: false
    },
    url: {
      type: DataTypes.STRING(255),
      allowNull: false
    },
    idSource: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      references: {
        model: 'source',
        key: 'id'
      }
    }
  }, {
    tableName: 'articlesave'
  });
};
