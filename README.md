¿Por qué usaste LEFT JOIN para la Consulta 1 y no INNER JOIN? ¿Qué se perdería si usaras INNER JOIN?

Utilicé LEFT JOIN porque permite mostrar todos los productos de la tabla productos, incluso aquellos que no tienen ventas asociadas.Al agregar WHERE v.venta_id IS NULL, identifico exclusivamente los productos que nunca fueron vendidos.Si utilizara INNER JOIN, se mostrarían únicamente los productos que tienen ventas registradas, perdiendo aquellos sin ventas, que son justamente los que necesito identificar.

¿Por qué usaste RIGHT JOIN para la Consulta 2? ¿Qué tabla está a la izquierda y cuál a la derecha en tu consulta?

Utilicé RIGHT JOIN porque necesito conservar todas las ventas registradas, incluso aquellas que no tienen un producto asociado en el catálogo. En mi consulta, la tabla productos está a la izquierda y la tabla ventas está a la derecha. Como RIGHT JOIN conserva todos los registros de la tabla derecha, puedo identificar las ventas cuyos productos no existen en el catálogo utilizando WHERE p.producto_id IS NULL. Esto permite detectar posibles errores en la carga de datos.

¿Qué representan los valores NULL en cada resultado? Explicá con un ejemplo concreto de los datos qué significa que venta_id sea NULL en la Consulta 1 y que producto_id de productos sea NULL en la Consulta 2.

Consulta 1 — LEFT JOIN
Cuando venta_id es NULL, significa que el producto existe en el catálogo, pero no tiene ventas registradas.
Ejemplo: el producto 108, Hub USB-C 7p, está registrado en productos, pero no aparece en ninguna venta.

Consulta 2 — RIGHT JOIN
Cuando p.producto_id es NULL, significa que existe una venta cuyo producto no está registrado en el catálogo.
Ejemplo: la venta 10 tiene asociado el producto_id = 999, pero ese producto no existe en la tabla productos.

Importante: estos NULL indican ausencia de coincidencia entre las tablas, no necesariamente que el dato original esté vacío.

¿Cuándo usarías FULL OUTER JOIN en un caso real de negocio?

Utilizaría FULL OUTER JOIN cuando necesito comparar dos tablas y conservar todos sus registros, independientemente de si tienen coincidencias. Por ejemplo, en una auditoría de inventario y ventas, permitiría identificar productos del catálogo que nunca fueron vendidos y ventas asociadas a productos que no existen en el catálogo. De esta manera, podría detectar productos sin movimiento comercial y posibles errores de carga de datos.
