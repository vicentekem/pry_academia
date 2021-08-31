
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
DELIMITER ;








