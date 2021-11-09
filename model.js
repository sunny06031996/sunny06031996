import Sequelize from 'sequelize';
import { sequelize } from '../database/employee';

const User = sequelize.define(
  'employee',
  {
    id: {
      type: Sequelize.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    name: {
      type: Sequelize.STRING,
      allowNull: false
    },
    age: {
      type: Sequelize.INTEGER,
      allowNull: false
    }
    }

);
