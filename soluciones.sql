-- ══════════════════════════════════════════
-- MiniStore — Soluciones con Outer JOINs
-- Autor: Mauro Bianchi
-- Fecha: 26/10
-- ══════════════════════════════════════════

-- ── CONSULTA 1: LEFT JOIN ─────────────────
-- Pregunta de negocio: ¿Qué productos del catálogo nunca fueron vendidos?
-- Mostrá todos los productos y sus ventas asociadas.
-- Los productos sin ventas aparecerán con NULL en las columnas de ventas.

USE Modulo_5;

SELECT*FROM productos;
SELECT*FROM ventas;

SELECT 
v.venta_id,
p.nombre,
p.categoria,
v.cantidad,
v.fecha_venta
FROM productos p -- Coloco acá la tabla cuyos registros quiero conservar (conservás todos los productos)
LEFT JOIN ventas v ON v.producto_id = p.producto_id;

SELECT 
p.nombre,
p.categoria
FROM productos p -- Coloco acá la tabla cuyos registros quiero conservar (conservás todos los productos)
LEFT JOIN ventas v ON v.producto_id = p.producto_id
WHERE 
v.venta_id IS NULL; -- muestro solo los que no tuvieron ventas, por ende aparecen como NULL en venta_id


-- ── CONSULTA 2: RIGHT JOIN ────────────────
-- Pregunta de negocio: ¿Existen ventas registradas con productos que no figuran en nuestro catálogo? (posible error de carga de datos)
-- Los registros huérfanos aparecerán con NULL en las columnas de productos.

SELECT
v.venta_id,
v.producto_id,
p.producto_id
FROM productos  p
RIGHT JOIN ventas v ON v.producto_id = p.producto_id
WHERE 
p.producto_id IS NULL;


-- ── CONSULTA 3: FULL OUTER JOIN ───────────
-- Pregunta de negocio: Vista completa de auditoría que muestre
-- todos los productos y todas las ventas sin perder ninguna fila,
-- identificando tanto productos sin ventas como ventas sin producto.

SELECT
v.venta_id,
v.producto_id,
p.nombre,
p.categoria
FROM productos p
FULL OUTER JOIN ventas v ON v.producto_id = p.producto_id;