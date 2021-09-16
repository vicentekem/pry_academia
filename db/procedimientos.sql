
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
	_description VARCHAR(255),
	_caractaristicas text,
	_beneficios text
)
BEGIN

DECLARE strLen    INT DEFAULT 0;
DECLARE subStrLen INT DEFAULT 0;


CASE _action
	WHEN 'ins' THEN
		IF(SELECT id FROM tbl_curso where description=_description) IS NULL THEN
		
			INSERT into tbl_curso(description) VALUES(_description);
			SET _id = (SELECT LAST_INSERT_ID());
			
			/*BUCLE PARA INSERTAR CARACTERISTICAS*/
			ins_caracteristicas: LOOP
		
				SET strLen = CHAR_LENGTH(_caractaristicas);

				if strLen > 0 THEN
					insert into tbl_curso_caracteristicas(id_curso,description) values(_id, SUBSTRING_INDEX( _caractaristicas , '|', 1 ) );
				END IF;

				SET subStrLen = CHAR_LENGTH(SUBSTRING_INDEX( _caractaristicas , '|',1 )) + 2;
				SET _caractaristicas = MID( _caractaristicas , subStrLen, strLen);
				
				IF _caractaristicas = '' THEN
					LEAVE ins_caracteristicas;
				END IF;
			END LOOP ins_caracteristicas;
			
			/*BUCLE PARA INSERTAR BENEFICIOS*/
			ins_beneficios: LOOP
		
				SET strLen = CHAR_LENGTH(_beneficios);

				if strLen > 0 THEN
					insert into tbl_curso_beneficios(id_curso,description) values(_id, SUBSTRING_INDEX( _beneficios , '|', 1 ) );
				END IF;

				SET subStrLen = CHAR_LENGTH(SUBSTRING_INDEX( _beneficios , '|',1 )) + 2;
				SET _beneficios = MID( _beneficios , subStrLen, strLen);
				
				IF _beneficios = '' THEN
					LEAVE ins_beneficios;
				END IF;
			END LOOP ins_beneficios;

			
		ELSE
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El curso ya existe', MYSQL_ERRNO = 1001;	
		END IF;
		
	WHEN 'upd' THEN
		IF(SELECT id FROM tbl_curso where description=_description and id<>_id) IS NULL THEN
		
			UPDATE tbl_curso set description=_description where id=_id;
			
			DELETE FROM tbl_curso_caracteristicas WHERE id_curso = _id;
			DELETE FROM tbl_curso_beneficios WHERE id_curso = _id;
			
			/*BUCLE PARA INSERTAR CARACTERISTICAS*/
			ins_caracteristicas: LOOP
		
				SET strLen = CHAR_LENGTH(_caractaristicas);

				if strLen > 0 THEN
					insert into tbl_curso_caracteristicas(id_curso,description) values(_id, SUBSTRING_INDEX( _caractaristicas , '|', 1 ) );
				END IF;

				SET subStrLen = CHAR_LENGTH(SUBSTRING_INDEX( _caractaristicas , '|',1 )) + 2;
				SET _caractaristicas = MID( _caractaristicas , subStrLen, strLen);
				
				IF _caractaristicas = '' THEN
					LEAVE ins_caracteristicas;
				END IF;
			END LOOP ins_caracteristicas;
			
			
			/*BUCLE PARA INSERTAR BENEFICIOS*/
			ins_beneficios: LOOP
		
				SET strLen = CHAR_LENGTH(_beneficios);

				if strLen > 0 THEN
					insert into tbl_curso_beneficios(id_curso,description) values(_id, SUBSTRING_INDEX( _beneficios , '|', 1 ) );
				END IF;

				SET subStrLen = CHAR_LENGTH(SUBSTRING_INDEX( _beneficios , '|',1 )) + 2;
				SET _beneficios = MID( _beneficios , subStrLen, strLen);
				
				IF _beneficios = '' THEN
					LEAVE ins_beneficios;
				END IF;
			END LOOP ins_beneficios;
			/*FIN DEL BUCLE*/
			
		ELSE
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error al actualizar el curso', MYSQL_ERRNO = 1001;
		END IF;
	WHEN 'est' THEN
		UPDATE tbl_curso SET estado= not estado WHERE id=_id;
	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Acción no válida', MYSQL_ERRNO = 1001;

END CASE;
END$

drop procedure if exists sp_tablas$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tablas`( 
	_action varchar(10),
	_id_tabla int(32),
	_id_registro int(32),
	_description VARCHAR(255),
	_cod_referencial VARCHAR(255)
)
BEGIN
	DECLARE _idregistro int;
	set _idregistro=(SELECT max(id_registro)+1 from tbl_tablas where id_tabla=_id_tabla);
	
CASE _action
		WHEN 'ins' THEN
		IF(SELECT id_registro FROM tbl_tablas where description=_description and id_tabla=_id_tabla) IS NULL THEN
		INSERT into tbl_tablas(id_tabla,id_registro,cod_referencial,description) VALUES(_id_tabla,_idregistro,_cod_referencial,_description);
		ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El registro ya existe' , MYSQL_ERRNO = 1001;	
		END if;
	WHEN 'upd' THEN
		IF(SELECT id_registro FROM tbl_tablas where description=_description and id_registro<>_id_registro and id_tabla=_id_tabla) IS NULL THEN
		UPDATE tbl_tablas set description=_description, cod_referencial=_cod_referencial where id_tabla=_id_tabla AND id_registro=_id_registro;
		ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error al actualizar tabla', MYSQL_ERRNO = 1001;
		END IF;
	WHEN 'est' THEN
		UPDATE tbl_tablas SET estado= not estado WHERE id_tabla=_id_tabla AND id_registro=_id_registro;
	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Acción no válida', MYSQL_ERRNO = 1001;
END CASE;
END $

drop procedure if exists sp_persona$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_persona`(
_action varchar(10),
_id int(32),
_dni varchar(8),
_nombre VARCHAR(255),
_apellidop VARCHAR(255),
_apellidom VARCHAR(255),
_correo VARCHAR(255),
_celular VARCHAR(25),
_telefono varchar(25),
_fecha_nac VARCHAR(50),
_id_ubigeo VARCHAR(6),
_id_sexo INT(1),
_id_usuario int(11))
begin
case _action
	WHEN 'ins' then
	IF(SELECT id FROM tbl_persona where dni=_dni) IS NULL THEN
	INSERT INTO tbl_persona(id,dni,nombre,apellido_pat,apellido_mat,correo,telefono,celular,fecha_nac,id_ubigeo,id_sexo,user_create_at,create_at) 
					VALUES(_id,_dni,_nombre,_apellidop,_apellidom,_correo,_telefono,_celular,STR_TO_DATE(_fecha_nac,'%d/%m/%Y'),_id_ubigeo,_id_sexo,_id_usuario,CURRENT_TIMESTAMP);
	ELSE
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El Dni ya existe' , MYSQL_ERRNO = 1001;	
	END if;
	WHEN 'upd' THEN
		IF(SELECT id FROM tbl_persona where dni=_dni and id<>_id) IS NULL THEN
		UPDATE tbl_persona set dni=_dni,nombre=_nombre,apellido_pat=_apellidop,apellido_mat=_apellidom,correo=_correo,telefono=_telefono,celular=_celular,fecha_nac=STR_TO_DATE(_fecha_nac,'%d/%m/%Y'),id_ubigeo=_id_ubigeo,id_sexo=_id_sexo,user_create_up=_id_usuario,create_up=CURRENT_TIMESTAMP WHERE dni=_dni and id=_id;
		ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error al actualizar tabla', MYSQL_ERRNO = 1001;
		END IF;
		WHEN 'est' THEN
		UPDATE tbl_persona SET estado= not estado WHERE id=_id AND dni=_dni;
		ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Acción no válida', MYSQL_ERRNO = 1001;
END CASE;
END $

drop procedure if exists sp_usuario$
CREATE DEFINER=`root`@`localhost` PROCEDURE sp_usuario(
_action varchar(10),
_id int(11),
_id_persona int(32),
_usuario VARCHAR(50),
_password varchar(150),
_id_usuario VARCHAR(32))
BEGIN
DECLARE msg varchar(255) default '';
 set msg = CONCAT('El usuario ', _usuario , ' ya existe' );
case _action 
 WHEN 'ins' THEN
	IF(SELECT id from tbl_usuario where usuario=_usuario) is not null then
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg, MYSQL_ERRNO = 1001;
		ELSEIF(SELECT id from tbl_usuario where id_persona=_id_persona) IS NOT NULL THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ya existe una cuenta con este DNI', MYSQL_ERRNO = 1001;
		ELSEIF(SELECT id from tbl_persona where id=_id_persona) IS NULL THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El DNI no está registrado en la base de datos', MYSQL_ERRNO = 1001;
		ELSE
		INSERT INTO tbl_usuario(id,id_persona,usuario,`password`,create_at,user_create_at,update_password)
				VALUES(_id,_id_persona,_usuario,MD5(_password),CURRENT_TIMESTAMP,_id_usuario,0);
		END if;
		/*
	IF(SELECT id from tbl_usuario where id_persona=_id_persona OR usuario=_usuario LIMIT 1) IS NULL THEN
	INSERT INTO tbl_usuario(id,id_persona,usuario,`password`,create_at,user_create_at,update_password)
				VALUES(_id,_id_persona,_usuario,MD5(_password),CURRENT_TIMESTAMP,_id_usuario,0);
	ELSE
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El usuario ya existe' , MYSQL_ERRNO = 1001;	
	END if;*/
 WHEN'upd' THEN
	IF(SELECT id from tbl_usuario where id_persona=_id_persona and id<>_id) is NULL THEN
	UPDATE tbl_usuario SET usuario=_usuario,`password`=MD5(_password),create_up=CURRENT_TIMESTAMP,user_create_up=_id_usuario,update_password=1 WHERE id=_id and id_persona=_id_persona;
	ELSE
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error al actualizar usuario', MYSQL_ERRNO = 1001;
	END IF;
 WHEN 'est' THEN
		UPDATE tbl_usuario SET estado= not estado WHERE id=_id AND id_persona=_id_persona;
 ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Accion no válida', MYSQL_ERRNO = 1001;
 END CASE;
END $


drop procedure if exists sp_personal$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_personal`(
	_action varchar(10),
	_id int(32),
	_id_persona varchar(255),
	_dni varchar(8),
	_nombre VARCHAR(255),
	_apellidop VARCHAR(255),
	_apellidom VARCHAR(255),
	_correo VARCHAR(255),
	_celular VARCHAR(25),
	_telefono VARCHAR(25),
	_fecha_nac VARCHAR(50),
	_id_ubigeo VARCHAR(6),
	_id_sexo INT(1),
	_id_cargo INT(32),
	_id_usuario int(11)
)
BEGIN

		CASE _action
			WHEN 'ins' THEN
			
				SET _id_persona = (SELECT id FROM tbl_persona where dni=_dni);
				
				IF _id_persona IS NULL THEN
				
					CALL sp_persona(_action,null,_dni,_nombre,_apellidop,_apellidom,_correo,
							_celular,_telefono,_fecha_nac,_id_ubigeo,_id_sexo,_id_usuario);
							
					SET _id_persona =(SELECT LAST_INSERT_ID());
					
				END if;
				
				IF (SELECT id FROM tbl_personal WHERE id_persona = _id_persona AND id_cargo = _id_cargo) IS NULL THEN
						INSERT INTO tbl_personal(id_persona,id_cargo) values(_id_persona,_id_cargo);
				ELSE
					SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El personal ya existe', MYSQL_ERRNO = 1001;	
				END IF;
				
				
			WHEN 'upd' THEN
				
				CALL sp_persona(_action,_id_persona,_dni,_nombre,_apellidop,_apellidom,_correo,
					_celular,_telefono,_fecha_nac,_id_ubigeo,_id_sexo,_id_usuario);
				
				IF (SELECT id FROM tbl_personal WHERE id_persona = _id_persona AND id_cargo = _id_cargo and id<>_id) IS NULL THEN
						UPDATE tbl_personal SET id_cargo = _id_cargo WHERE id = _id;
				ELSE
					SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El personal ya tiene el cargo seleccionado', MYSQL_ERRNO = 1001;	
				END IF;
			WHEN 'est' THEN
				UPDATE tbl_personal SET estado= not estado WHERE id= _id;
			ELSE
				SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Acción no válida', MYSQL_ERRNO = 1001;				
			
		END CASE;
END$

drop procedure if exists sp_alumno$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_alumno`(
	_action varchar(10),
	_id int(32),
	_id_persona varchar(255),
	_dni varchar(8),
	_nombre VARCHAR(255),
	_apellidop VARCHAR(255),
	_apellidom VARCHAR(255),
	_correo VARCHAR(255),
	_celular VARCHAR(25),
	_telefono VARCHAR(25),
	_fecha_nac VARCHAR(50),
	_id_ubigeo VARCHAR(6),
	_id_sexo INT(1),
	_id_usuario int(11)
)
BEGIN

		CASE _action
			WHEN 'ins' THEN
			
				SET _id_persona = (SELECT id FROM tbl_persona where dni=_dni);
				
				IF _id_persona IS NULL THEN
				
					CALL sp_persona(_action,null,_dni,_nombre,_apellidop,_apellidom,_correo,
							_celular,_telefono,_fecha_nac,_id_ubigeo,_id_sexo,_id_usuario);
							
					SET _id_persona =(SELECT LAST_INSERT_ID());
					
				END if;
				
				IF (SELECT id FROM tbl_personal WHERE id_persona = _id_persona) IS NULL THEN
						INSERT INTO tbl_alumno(id_persona,id_cargo) values(_id_persona,_id_cargo);
				ELSE
					SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El alumno ya existe', MYSQL_ERRNO = 1001;	
				END IF;				
				
			WHEN 'upd' THEN
				
				CALL sp_persona(_action,_id_persona,_dni,_nombre,_apellidop,_apellidom,_correo,
					_celular,_telefono,_fecha_nac,_id_ubigeo,_id_sexo,_id_usuario);				
				/* IF (SELECT id FROM tbl_personal WHERE id_persona = _id_persona AND id<>_id) IS NULL THEN
						UPDATE tbl_alumno SET id_cargo = _id_cargo WHERE id = _id;
				ELSE
					SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El alumno ya existe', MYSQL_ERRNO = 1001;	
				END IF; */
			WHEN 'est' THEN
				UPDATE tbl_alumno SET estado= not estado WHERE id= _id;
			ELSE
				SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Acción no válida', MYSQL_ERRNO = 1001;
		END CASE;
END$


drop procedure if exists sp_accesos$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_accesos`(
_action VARCHAR(10),
_id_usuario int(32),
_id_rol INT(32),
_accesos VARCHAR(50)
)
BEGIN
DECLARE strLen INT DEFAULT 0;
DECLARE subStrlen INT DEFAULT 0;


case _action 
WHEN 'ins' THEN
SET strLen=CHAR_LENGTH(_accesos);
		ins_accesos: LOOP
		SET strLen = CHAR_LENGTH(_accesos);
		
		
		IF strLen > 0 THEN
			IF(SELECT id FROM tbl_submenu where id=SUBSTRING_INDEX( _accesos , '|', 1 ))is NULL THEN
					SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La tabla no existe', MYSQL_ERRNO = 1001;
			
			ELSEIF(SELECT id from tbl_usuario 
				where id=_id_usuario ) IS NULL  THEN
						SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El Usuario no existe', MYSQL_ERRNO = 1001;
			ELSEIF(SELECT id_usuario from tbl_accesos_usuario 
				where id_usuario=_id_usuario and id_rol=_id_rol and id_submenu=SUBSTRING_INDEX( _accesos , '|', 1 )) IS NULL  THEN
					
					insert into tbl_accesos_usuario(id_usuario,id_rol,id_submenu) values(_id_usuario,_id_rol,SUBSTRING_INDEX( _accesos , '|', 1 ) );
						
			END IF;
		END IF;
				
		SET subStrlen = CHAR_LENGTH(SUBSTRING_INDEX( _accesos , '|',1 )) + 2;
		SET _accesos = MID( _accesos , subStrLen, strLen);
				
	IF _accesos='' THEN
		LEAVE ins_accesos; 
	END IF; 
END LOOP ins_accesos;

WHEN 'dlt' THEN
		SET strLen=CHAR_LENGTH(_accesos);
		dlt_accesos: LOOP
		SET strLen = CHAR_LENGTH(_accesos);
		
		IF(SELECT id_usuario FROM tbl_accesos_usuario 
		where id_usuario=_id_usuario and id_rol=_id_rol and id_submenu=SUBSTRING_INDEX( _accesos , '|', 1 )) IS NULL THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error', MYSQL_ERRNO = 1001;
		ELSE
			DELETE FROM tbl_accesos_usuario where id_usuario=_id_usuario and id_rol=_id_rol and id_submenu=SUBSTRING_INDEX( _accesos , '|', 1 );
		END IF;
		SET subStrlen = CHAR_LENGTH(SUBSTRING_INDEX( _accesos , '|',1 )) + 2;
		SET _accesos = MID( _accesos , subStrLen, strLen);
	IF _accesos='' THEN
		LEAVE dlt_accesos; 
	END IF; 
END LOOP dlt_accesos;
END CASE;
END$


drop procedure if exists `sp_curso_programado`$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_curso_programado`(
_action varchar(10),
_id int(32),
_id_curso int(32),
_fecha_inicio VARCHAR(50),
_fecha_fin VARCHAR(50),
_url_img VARCHAR(255),
_id_usuario int(32),
_id_persona int(32))
begin
case _action
	WHEN 'ins' then
	IF(SELECT ID FROM tbl_curso WHERE id=11_id) is NULL THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El curso no existe' , MYSQL_ERRNO = 1001;	
	ELSEIF(SELECT id FROM tbl_curso_programado where id=_id) IS NULL THEN
		INSERT INTO tbl_curso_programado(id,id_curso,create_at,user_create_at,fecha_inicio,fecha_fin,url_img,id_persona) 
					VALUES(_id,_id_curso,CURRENT_TIMESTAMP,_id_usuario,STR_TO_DATE(_fecha_inicio,'%d/%m/%Y'),STR_TO_DATE(_fecha_fin,'%d/%m/%Y'),_url_img,_id_persona);
	ELSE
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error' , MYSQL_ERRNO = 1001;	
	END if;
	WHEN 'upd' THEN
		IF(SELECT id FROM tbl_curso_programado where id_curso=_id_curso and id<>_id) IS NULL THEN
		UPDATE tbl_curso_programado set id_curso=_id_curso,fecha_inicio=STR_TO_DATE(_fecha_inicio,'%d/%m/%Y'),fecha_fin=STR_TO_DATE(_fecha_fin,'%d/%m/%Y'),url_img=_url_img/*,user_create_up=_id_usuario*/,create_up=CURRENT_TIMESTAMP WHERE id=_id;
		ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error al actualizar tabla', MYSQL_ERRNO = 1001;
		END IF;
		WHEN 'est' THEN
		UPDATE tbl_curso_programado SET estado= not estado WHERE id=_id AND id_curso=_id_curso;
		ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Acción no válida', MYSQL_ERRNO = 1001;
END CASE;
END$