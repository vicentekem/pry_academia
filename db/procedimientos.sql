
DELIMITER $
drop procedure if exists sp_login$
CREATE PROCEDURE sp_login( 
	_usuario varchar(255),
	_password varchar(255)
)
BEGIN
		DECLARE _id_usuario int default null;
		DECLARE msg varchar(255) default '';
		set msg = CONCAT('El usuario ', _usuario , ' no existe' );
		
    	-- select * from tbl_usuario;
		IF (select id from tbl_usuario where usuario = _usuario) is null THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg, MYSQL_ERRNO = 1001;
		ELSEIF (select id from tbl_usuario 
				where usuario = _usuario and `password`= md5(_password)) is null THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La contraseña ingresada es incorrecta', MYSQL_ERRNO = 1001;			
		ELSE
			select u.id,u.id_persona,usuario,p.dni,u.update_password,
				trim(upper(concat(p.nombre,' ',ifnull(p.apellido_pat,''),' ',ifnull(p.apellido_mat,'')))) as nombre_completo
			from tbl_usuario u
			inner join tbl_persona p on u.id_persona = p.id
			where usuario = _usuario and `password`= md5(_password);
		END IF;
		
END $


drop procedure if exists sp_curso$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_curso`( 
	_action varchar(10),
	_id int(32),
	_description VARCHAR(255)
)
BEGIN
CASE _action
	WHEN 'ins' THEN
		INSERT into tbl_curso(description) VALUES(_description);
	WHEN 'upd' THEN
		UPDATE tbl_curso set description=_description where id=_id;
	WHEN 'del' THEN
		UPDATE tbl_curso SET estado=0 WHERE id=_id;
	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Acción no válida', MYSQL_ERRNO = 1001;
END CASE;
END $


drop procedure if exists sp_tablas$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tablas`( 
	_action varchar(10),
	_id_tabla int(32),
	_id_registro int(32),
	_description VARCHAR(255),
	_cod_referencial VARCHAR(255)
)
BEGIN
CASE _action
	WHEN 'ins' THEN
		INSERT into tbl_tablas(id_tabla,id_registro,cod_referencial,description) VALUES(_id_tabla,_id_registro,_cod_referencial,_description);
	WHEN 'upd' THEN
		UPDATE tbl_tablas set description=_description, cod_referencial=_cod_referencial where id_tabla=_id_tabla AND id_registro=_id_registro;
	WHEN 'del' THEN
		UPDATE tbl_tablas SET estado=0 WHERE id_tabla=_id_tabla AND id_registro=_id_registro;
	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Acción no válida', MYSQL_ERRNO = 1001;
END CASE;
END $
DELIMITER ;







