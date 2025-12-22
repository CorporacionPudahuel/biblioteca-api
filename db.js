/**
 * Este archivo es para realizar la conexión a la Base de Datos
 */

// db.js
const { Pool } = require('pg');

const pool = new Pool({
  user: 'sabiblio',         // por defecto: 'postgres'
  host: 'localhost',
  database: 'dbbiblio',
  password: 'C0d3p2025',
  port: 5432,
});

module.exports = {
  query: (text, params) => pool.query(text, params),
};
