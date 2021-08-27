SELECT u.id,sm.id_menu,sm.alias,sm.file_view from tbl_usuario u
INNER JOIN tbl_accesos_usuario au ON u.id=au.id_usuario
inner JOIN tbl_submenu sm on u.id=au.id_usuario
INNER JOIN tbl_menu m on sm.id_menu=m.id
WHERE m.id=1


SELECT u.id,m.name_menu,sm.id_menu,sm.alias,sm.file_view from tbl_usuario u
INNER JOIN tbl_accesos_usuario au ON u.id=au.id_usuario
INNER JOIN tbl_submenu sm on u.id=au.id_usuario
INNER JOIN tbl_menu m on sm.id_menu=m.id
ORDER BY m.orden;


SELECT CONCAT(departamento," ,",provincia," ,",distrito)from tbl_ubigeo
WHERE CONCAT(departamento," ,",provincia," ,",distrito) LIKE '%CAÑETE%'