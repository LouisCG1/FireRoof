/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('source', {
    id: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    title: {
      type: DataTypes.STRING(50),
      allowNull: false
    },
    url: {
      type: DataTypes.STRING(255),
      allowNull: false
    },
    idLang: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      references: {
        model: 'language',
        key: 'id'
      }
    }
  }, {
    tableName: 'source'
  });
};
