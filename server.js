// server.js
const express = require('express');
const cors = require('cors');
const db = require('./db');

const app = express();
const PORT = process.env.PORT || 3000;

app.use(cors());

app.get('/api/estado', (req, res) => {
  res.json({ ok: true, mensaje: ' ----> Funcionando...' });
});


/**
 * Este método de API sirve para recuperar todas las noticias que estén activas 
 */
app.get('/api/news/total', async (req, res) => {
  try {
    console.error('para revisar');
    const result = await db.query('select news_code, news_image_type_01, news_title_page, news_image_01, news_base64_image_01, news_text, news_publish_date from bsp_news where news_enable = TRUE order by news_code');
    res.json(result.rows);
  } catch (err) {
    console.error('Error al contar registros:', err);
    res.status(500).json({ error: 'No se pudo obtener el total de noticias' });
  }
});


// Endpoint: obtener recurso por código (ej. /api/recurso/001)
app.get('/api/news/:code', async (req, res) => {
  const { code } = req.params;

  // Validación: solo permite códigos de 3 dígitos (000 a 999)
  if (!/^\d{3}$/.test(code)) {
    return res.status(400).json({ error: 'El código debe tener exactamente 3 dígitos numéricos (ej. "001")' });
  }

  try {
    // Consulta segura usando parámetro preparado
    const result = await db.query(
      'SELECT news_code, news_mini_title, news_title_page, news_subtitle_page, news_image_type_01, news_image_01, news_base64_image_01, news_image_type_02, news_image_02, news_base64_image_02, news_text, news_publish_date FROM bsp_news WHERE news_code = $1',
      [code] // ← cadena "001", "002", etc.
    );

    if (result.rows.length === 0) {
      return res.status(404).json({ error: 'Recurso no encontrado' });
    }

    console.error('Devolvio valor : ' + result.rows[0].news_code);
    res.json(result.rows);
  } catch (err) {
    console.error('Error al buscar recurso por código:', err);
    res.status(500).json({ error: 'Error interno del servidor' });
  }
});

app.get('/api/zones/:code', async (req, res) => {
  const { code } = req.params;

  // Validación: solo permite códigos de 3 dígitos (000 a 999)
  if (!/^\d{3}$/.test(code)) {
    return res.status(400).json({ error: 'El código debe tener exactamente 3 dígitos numéricos (ej. "001")' });
  }

  try {
    // Consulta segura usando parámetro preparado
    const result = await db.query(
      'SELECT zone_code WHERE zone_code = $1',
      [code] // ← cadena "001", "002", etc.
    );

    if (result.rows.length === 0) {
      return res.status(404).json({ error: 'Recurso no encontrado' });
    }

    console.error('Devolvio valor : ' + result.rows[0].zone_code);
    res.json(result.rows);
  } catch (err) {
    console.error('Error al buscar recurso por código:', err);
    res.status(500).json({ error: 'Error interno del servidor' });
  }
});


app.listen(PORT, () => {
  console.log(`Servidor en puerto ${PORT}`);
});
