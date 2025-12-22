// test.js

const db = require('./db');

async function testConnection() {
  try {
    console.log('🔍 Intentando conectar a la base de datos...');
    const result = await db.query('SELECT NOW() as fecha_actual');
    console.log('✅ ¡Conexión exitosa!');
    console.log('Hora en la base de datos:', result.rows[0].fecha_actual);
    process.exit(0); // Finaliza con éxito
  } catch (err) {
    console.error('❌ Error al conectar con la base de datos:');
    console.error('Mensaje:', err.message);
    console.error('Detalles:', err.stack);
    process.exit(1); // Finaliza con error
  }
}

testConnection();

//console.log('---> process existe:', typeof process);
//console.log('process.env:', typeof process.env);
//console.log('PORT simulado:', process.env.PORT || 3000);
