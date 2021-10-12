/*
 Navicat Premium Data Transfer

 Source Server         : MYSQL_LOCAL
 Source Server Type    : MySQL
 Source Server Version : 100130
 Source Host           : localhost:3306
 Source Schema         : db_pry_academia

 Target Server Type    : MySQL
 Target Server Version : 100130
 File Encoding         : 65001

 Date: 12/10/2021 12:06:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_accesos_rol
-- ----------------------------
DROP TABLE IF EXISTS `tbl_accesos_rol`;
CREATE TABLE `tbl_accesos_rol`  (
  `id_rol` int(32) NOT NULL,
  `id_submenu` int(32) NOT NULL,
  PRIMARY KEY (`id_rol`, `id_submenu`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_accesos_rol
-- ----------------------------
INSERT INTO `tbl_accesos_rol` VALUES (1, 1);
INSERT INTO `tbl_accesos_rol` VALUES (1, 2);
INSERT INTO `tbl_accesos_rol` VALUES (1, 4);
INSERT INTO `tbl_accesos_rol` VALUES (1, 5);
INSERT INTO `tbl_accesos_rol` VALUES (1, 11);
INSERT INTO `tbl_accesos_rol` VALUES (1, 12);
INSERT INTO `tbl_accesos_rol` VALUES (1, 13);
INSERT INTO `tbl_accesos_rol` VALUES (1, 15);
INSERT INTO `tbl_accesos_rol` VALUES (1, 16);
INSERT INTO `tbl_accesos_rol` VALUES (1, 17);
INSERT INTO `tbl_accesos_rol` VALUES (1, 18);
INSERT INTO `tbl_accesos_rol` VALUES (1, 19);
INSERT INTO `tbl_accesos_rol` VALUES (4, 11);
INSERT INTO `tbl_accesos_rol` VALUES (4, 14);
INSERT INTO `tbl_accesos_rol` VALUES (5, 15);
INSERT INTO `tbl_accesos_rol` VALUES (5, 18);

-- ----------------------------
-- Table structure for tbl_accesos_usuario
-- ----------------------------
DROP TABLE IF EXISTS `tbl_accesos_usuario`;
CREATE TABLE `tbl_accesos_usuario`  (
  `id_usuario` int(32) NOT NULL,
  `id_submenu` int(32) NOT NULL,
  `id_rol` int(32) NOT NULL,
  PRIMARY KEY (`id_usuario`, `id_submenu`, `id_rol`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_accesos_usuario
-- ----------------------------
INSERT INTO `tbl_accesos_usuario` VALUES (1, 0, 1);
INSERT INTO `tbl_accesos_usuario` VALUES (1, 1, 1);
INSERT INTO `tbl_accesos_usuario` VALUES (1, 2, 1);
INSERT INTO `tbl_accesos_usuario` VALUES (1, 3, 1);
INSERT INTO `tbl_accesos_usuario` VALUES (1, 4, 1);
INSERT INTO `tbl_accesos_usuario` VALUES (1, 5, 1);
INSERT INTO `tbl_accesos_usuario` VALUES (1, 6, 1);
INSERT INTO `tbl_accesos_usuario` VALUES (1, 11, 1);
INSERT INTO `tbl_accesos_usuario` VALUES (1, 12, 1);
INSERT INTO `tbl_accesos_usuario` VALUES (1, 14, 1);
INSERT INTO `tbl_accesos_usuario` VALUES (1, 15, 1);
INSERT INTO `tbl_accesos_usuario` VALUES (1, 17, 1);
INSERT INTO `tbl_accesos_usuario` VALUES (1, 18, 1);
INSERT INTO `tbl_accesos_usuario` VALUES (1, 19, 1);
INSERT INTO `tbl_accesos_usuario` VALUES (2, 11, 4);
INSERT INTO `tbl_accesos_usuario` VALUES (2, 14, 4);
INSERT INTO `tbl_accesos_usuario` VALUES (2, 15, 4);
INSERT INTO `tbl_accesos_usuario` VALUES (2, 18, 4);
INSERT INTO `tbl_accesos_usuario` VALUES (17, 11, 4);
INSERT INTO `tbl_accesos_usuario` VALUES (17, 14, 4);

-- ----------------------------
-- Table structure for tbl_alumno
-- ----------------------------
DROP TABLE IF EXISTS `tbl_alumno`;
CREATE TABLE `tbl_alumno`  (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `id_persona` int(32) NOT NULL,
  `create_at` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `user_create_at` int(32) NULL DEFAULT NULL,
  `create_up` datetime(6) NULL DEFAULT NULL,
  `update_password` int(32) NULL DEFAULT NULL,
  `estado` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_alumno
-- ----------------------------
INSERT INTO `tbl_alumno` VALUES (1, 2, '2021-08-31 12:21:10.803778', NULL, NULL, NULL, 1);
INSERT INTO `tbl_alumno` VALUES (18, 21, '2021-09-22 16:39:05.502532', NULL, NULL, NULL, 1);
INSERT INTO `tbl_alumno` VALUES (20, 1, '2021-09-29 17:26:19.411433', NULL, NULL, NULL, 1);

-- ----------------------------
-- Table structure for tbl_concurso
-- ----------------------------
DROP TABLE IF EXISTS `tbl_concurso`;
CREATE TABLE `tbl_concurso`  (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `resumen` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `fecha` date NULL DEFAULT NULL,
  `hora_inicio` time(6) NULL DEFAULT NULL,
  `hora_fin` time(6) NULL DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `create_at` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `user_create_at` int(32) NULL DEFAULT NULL,
  `create_up` datetime(6) NULL DEFAULT NULL,
  `user_create_up` int(32) NULL DEFAULT NULL,
  `direccion` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `monto_inscripcion` decimal(30, 2) NULL DEFAULT NULL,
  `url_img` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `puntaje_total` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_concurso
-- ----------------------------
INSERT INTO `tbl_concurso` VALUES (21, 'LOREM IPSUM', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has su', '2021-10-15', '10:00:00.000000', '13:00:00.000000', 1, '2021-10-06 15:54:05.971555', NULL, NULL, NULL, 'LOREM IPSUM LOREM IPSUM LOREM IPSUM', 10.00, 'public/img/concurso/615e0cedea7a2.jpg', 4);

-- ----------------------------
-- Table structure for tbl_curso
-- ----------------------------
DROP TABLE IF EXISTS `tbl_curso`;
CREATE TABLE `tbl_curso`  (
  `id` int(32) UNSIGNED NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `create_at` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `user_create_at` int(32) NULL DEFAULT NULL,
  `create_up` datetime(6) NULL DEFAULT NULL,
  `estado` tinyint(1) NULL DEFAULT 1,
  `resumen` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_curso
-- ----------------------------
INSERT INTO `tbl_curso` VALUES (1, 'ARITMETICA', '2021-08-31 12:30:59.569567', NULL, NULL, 1, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Nam est suscipit itaque?sds');
INSERT INTO `tbl_curso` VALUES (2, 'ALGEBRA', '2021-08-31 12:31:04.793439', NULL, NULL, 1, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Nam est suscipit itaque?');
INSERT INTO `tbl_curso` VALUES (3, 'GEOMETRIA', '2021-08-31 12:31:53.927558', NULL, NULL, 1, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Nam est suscipit itaque?');
INSERT INTO `tbl_curso` VALUES (4, 'TRIGONOMETRIA', '2021-08-31 12:32:03.854089', NULL, NULL, 1, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Nam est suscipit itaque?');
INSERT INTO `tbl_curso` VALUES (5, 'RAZONAMIENTO MATEMATICO', '2021-08-31 12:32:26.959922', NULL, NULL, 1, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Nam est suscipit itaque?');
INSERT INTO `tbl_curso` VALUES (6, 'ONEM', '2021-08-31 12:32:31.653761', NULL, NULL, 1, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Nam est suscipit itaque?');
INSERT INTO `tbl_curso` VALUES (7, 'CONAMAT', '2021-08-31 12:32:37.954210', NULL, NULL, 1, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Nam est suscipit itaque?');
INSERT INTO `tbl_curso` VALUES (8, 'NOMBRAMIENTO', '2021-08-31 12:32:42.369781', NULL, NULL, 1, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Nam est suscipit itaque?');
INSERT INTO `tbl_curso` VALUES (9, 'ACSCENSO DE NIVEL ESPECIALIZACION', '2021-08-31 12:33:29.542455', NULL, NULL, 1, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Nam est suscipit itaque?');
INSERT INTO `tbl_curso` VALUES (10, 'NUEVO CURO', '2021-09-06 17:00:38.004706', NULL, NULL, 1, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Nam est suscipit itaque?');

-- ----------------------------
-- Table structure for tbl_curso_beneficios
-- ----------------------------
DROP TABLE IF EXISTS `tbl_curso_beneficios`;
CREATE TABLE `tbl_curso_beneficios`  (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `id_curso` int(32) NULL DEFAULT NULL,
  `description` varchar(800) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_curso_beneficios
-- ----------------------------
INSERT INTO `tbl_curso_beneficios` VALUES (12, 1, 'wqda');
INSERT INTO `tbl_curso_beneficios` VALUES (13, 5, 'Fusce consequat diam eget vulputate tristique.');
INSERT INTO `tbl_curso_beneficios` VALUES (14, 5, 'Nam aliquet mauris non commodo tristique. Phasellus sit amet pellentesque ipsum.');

-- ----------------------------
-- Table structure for tbl_curso_caracteristicas
-- ----------------------------
DROP TABLE IF EXISTS `tbl_curso_caracteristicas`;
CREATE TABLE `tbl_curso_caracteristicas`  (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `id_curso` int(32) NULL DEFAULT NULL,
  `description` varchar(800) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_curso_caracteristicas
-- ----------------------------
INSERT INTO `tbl_curso_caracteristicas` VALUES (11, 1, 'sssss');
INSERT INTO `tbl_curso_caracteristicas` VALUES (12, 1, '1233rqdqds');
INSERT INTO `tbl_curso_caracteristicas` VALUES (13, 5, 'Lorem ipsum dolor sit amet consectetur adipisicing elit.');
INSERT INTO `tbl_curso_caracteristicas` VALUES (14, 5, 'Morbi sollicitudin ipsum urna, sit amet dignissim ligula euismod et.');

-- ----------------------------
-- Table structure for tbl_curso_programado
-- ----------------------------
DROP TABLE IF EXISTS `tbl_curso_programado`;
CREATE TABLE `tbl_curso_programado`  (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `id_curso` int(32) NULL DEFAULT NULL,
  `create_at` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `user_create_at` int(32) NULL DEFAULT NULL,
  `create_up` datetime(6) NULL DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `fecha_inicio` date NULL DEFAULT NULL,
  `fecha_fin` date NULL DEFAULT NULL,
  `url_img` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `id_persona` int(32) NOT NULL,
  `user_create_up` int(32) NULL DEFAULT NULL,
  `link_clase` varchar(750) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `cant_mensualidades` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_curso_programado
-- ----------------------------
INSERT INTO `tbl_curso_programado` VALUES (1, 5, '2021-08-31 12:51:32.611256', NULL, '2021-10-12 10:35:41.000000', 1, '2021-09-06', '2021-12-17', 'public/img/cursos/6165a9c066649.jpg', 1, 1, 'https://www.youtube.com/', 3);
INSERT INTO `tbl_curso_programado` VALUES (2, 4, '2021-08-31 12:54:34.937925', NULL, '2021-09-30 18:21:13.000000', 1, '2021-09-01', '2021-12-01', 'public/img/cursos/615646693f0c8.jpg', 1, 1, '', 3);
INSERT INTO `tbl_curso_programado` VALUES (3, 2, '2021-08-31 12:55:30.022456', NULL, NULL, 1, '2021-09-13', '2021-11-26', 'public/img/cursos/curso3.jpg', 1, NULL, NULL, 3);
INSERT INTO `tbl_curso_programado` VALUES (6, 9, '2021-09-16 15:38:18.000000', 1, '2021-09-17 01:03:55.000000', 1, '2021-09-20', '2012-12-15', 'public/img/cursos/614e433c4b7c1.jpg', 1, 1, '', 3);

-- ----------------------------
-- Table structure for tbl_curso_programado_tipo_pago
-- ----------------------------
DROP TABLE IF EXISTS `tbl_curso_programado_tipo_pago`;
CREATE TABLE `tbl_curso_programado_tipo_pago`  (
  `id_curso_programado` int(32) NOT NULL,
  `id_tipo_pago` int(32) NOT NULL,
  `monto` decimal(30, 2) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_curso_programado`, `id_tipo_pago`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_curso_programado_tipo_pago
-- ----------------------------
INSERT INTO `tbl_curso_programado_tipo_pago` VALUES (1, 1, 70.50, 1);
INSERT INTO `tbl_curso_programado_tipo_pago` VALUES (1, 2, 50.00, 1);
INSERT INTO `tbl_curso_programado_tipo_pago` VALUES (2, 1, 60.00, 1);
INSERT INTO `tbl_curso_programado_tipo_pago` VALUES (2, 2, 60.00, 1);
INSERT INTO `tbl_curso_programado_tipo_pago` VALUES (3, 1, 85.00, 1);
INSERT INTO `tbl_curso_programado_tipo_pago` VALUES (6, 1, 120.00, 1);
INSERT INTO `tbl_curso_programado_tipo_pago` VALUES (6, 2, 80.50, 1);

-- ----------------------------
-- Table structure for tbl_curso_programado_turno
-- ----------------------------
DROP TABLE IF EXISTS `tbl_curso_programado_turno`;
CREATE TABLE `tbl_curso_programado_turno`  (
  `id_curso_programado` int(32) NOT NULL,
  `id_turno` int(32) NOT NULL,
  `hora_inicio` time(6) NULL DEFAULT NULL,
  `hora_fin` time(6) NULL DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_curso_programado`, `id_turno`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_curso_programado_turno
-- ----------------------------
INSERT INTO `tbl_curso_programado_turno` VALUES (1, 2, '08:00:00.000000', '11:00:00.000000', 1);
INSERT INTO `tbl_curso_programado_turno` VALUES (2, 1, '02:00:00.000000', '05:00:00.000000', 1);
INSERT INTO `tbl_curso_programado_turno` VALUES (6, 1, '08:00:00.000000', '12:00:00.000000', 1);
INSERT INTO `tbl_curso_programado_turno` VALUES (6, 2, '13:00:00.000000', '15:30:00.000000', 1);

-- ----------------------------
-- Table structure for tbl_inscripcion
-- ----------------------------
DROP TABLE IF EXISTS `tbl_inscripcion`;
CREATE TABLE `tbl_inscripcion`  (
  `id` int(23) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_concurso` int(32) NOT NULL,
  `id_persona` int(32) NOT NULL,
  `create_at` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `user_create_at` int(32) NULL DEFAULT NULL,
  `create_up` datetime(6) NULL DEFAULT NULL,
  `user_create_up` int(32) NULL DEFAULT NULL,
  `estado` tinyint(1) NULL DEFAULT 1,
  `monto` decimal(30, 2) NULL DEFAULT NULL,
  `estado_inscripcion` int(32) UNSIGNED NOT NULL DEFAULT 1,
  `puntaje` tinyint(32) NULL DEFAULT NULL,
  `respuestas` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_inscripcion
-- ----------------------------
INSERT INTO `tbl_inscripcion` VALUES (2, 21, 1, '2021-10-07 15:37:23.206249', NULL, NULL, NULL, 1, 10.00, 1, 1, '46,87|47,91|48,93|49,97');

-- ----------------------------
-- Table structure for tbl_matricula
-- ----------------------------
DROP TABLE IF EXISTS `tbl_matricula`;
CREATE TABLE `tbl_matricula`  (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `id_curso_programado` int(32) NOT NULL,
  `id_alumno` int(32) NOT NULL,
  `create_at` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `user_create_at` int(32) NULL DEFAULT NULL,
  `create_up` datetime(6) NULL DEFAULT NULL,
  `user_create_up` int(32) NULL DEFAULT NULL,
  `id_turno` int(32) NOT NULL COMMENT 'id_tabla: 4',
  `monto` decimal(30, 2) NOT NULL,
  `id_tipo_pago` int(32) NOT NULL DEFAULT 1 COMMENT 'id_tabla: 3',
  `estado_matricula` int(32) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_matricula
-- ----------------------------
INSERT INTO `tbl_matricula` VALUES (1, 6, 1, '2021-09-21 23:58:27.143462', NULL, NULL, NULL, 1, 120.00, 1, 1);
INSERT INTO `tbl_matricula` VALUES (16, 1, 18, '2021-09-22 16:39:05.503530', NULL, NULL, NULL, 2, 70.50, 1, 1);
INSERT INTO `tbl_matricula` VALUES (17, 6, 20, '2021-09-29 17:26:19.472488', NULL, NULL, NULL, 1, 120.00, 1, 1);

-- ----------------------------
-- Table structure for tbl_menu
-- ----------------------------
DROP TABLE IF EXISTS `tbl_menu`;
CREATE TABLE `tbl_menu`  (
  `id` int(32) NOT NULL,
  `name_menu` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `class_icon` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `orden` int(11) NULL DEFAULT NULL,
  `estado` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_menu
-- ----------------------------
INSERT INTO `tbl_menu` VALUES (1, 'MANTENIMIENTO', 'fa-table', 1, 1);
INSERT INTO `tbl_menu` VALUES (2, 'PROCESOS', 'fa-cog', 2, 1);
INSERT INTO `tbl_menu` VALUES (3, 'REPORTES', 'fa-bar-chart', 3, 1);
INSERT INTO `tbl_menu` VALUES (4, 'HERRAMIENTAS', 'fa-wrench', 4, 1);
INSERT INTO `tbl_menu` VALUES (5, 'CURSOS', 'fa-book', 2, 1);
INSERT INTO `tbl_menu` VALUES (6, 'CONSULTAS', 'fa-search', 2, 1);

-- ----------------------------
-- Table structure for tbl_opcion
-- ----------------------------
DROP TABLE IF EXISTS `tbl_opcion`;
CREATE TABLE `tbl_opcion`  (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `id_pregunta` int(32) NOT NULL,
  `nro_orden` int(32) NULL DEFAULT 1,
  `description` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `es_correcto` tinyint(1) NULL DEFAULT 0,
  `create_at` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `user_create_at` int(32) NULL DEFAULT NULL,
  `create_up` datetime(6) NULL DEFAULT NULL,
  `user_create_up` int(32) NULL DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 98 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_opcion
-- ----------------------------
INSERT INTO `tbl_opcion` VALUES (86, 46, 1, 'opcion 1', 1, '2021-10-11 17:32:21.108061', NULL, NULL, NULL, 1);
INSERT INTO `tbl_opcion` VALUES (87, 46, 2, 'opcion 2', 0, '2021-10-11 17:32:21.108061', NULL, NULL, NULL, 1);
INSERT INTO `tbl_opcion` VALUES (88, 46, 3, 'opcion 3', 0, '2021-10-11 17:32:21.108061', NULL, NULL, NULL, 1);
INSERT INTO `tbl_opcion` VALUES (89, 46, 4, 'Nueva opcion', 0, '2021-10-11 17:32:21.108061', NULL, NULL, NULL, 1);
INSERT INTO `tbl_opcion` VALUES (90, 47, 1, 'Nueva opcion', 0, '2021-10-11 17:32:21.108061', NULL, NULL, NULL, 1);
INSERT INTO `tbl_opcion` VALUES (91, 47, 2, 'Nueva opcion', 1, '2021-10-11 17:32:21.109043', NULL, NULL, NULL, 1);
INSERT INTO `tbl_opcion` VALUES (92, 47, 3, 'Nueva opcion', 0, '2021-10-11 17:32:21.109043', NULL, NULL, NULL, 1);
INSERT INTO `tbl_opcion` VALUES (93, 48, 1, 'Nueva opcion', 0, '2021-10-11 17:32:21.109043', NULL, NULL, NULL, 1);
INSERT INTO `tbl_opcion` VALUES (94, 48, 2, 'Nueva opcion', 1, '2021-10-11 17:32:21.109043', NULL, NULL, NULL, 1);
INSERT INTO `tbl_opcion` VALUES (95, 49, 1, 'Nueva opcion', 0, '2021-10-11 17:32:21.109043', NULL, NULL, NULL, 1);
INSERT INTO `tbl_opcion` VALUES (96, 49, 2, 'Nueva opcion peee', 1, '2021-10-11 17:32:21.109043', NULL, NULL, NULL, 1);
INSERT INTO `tbl_opcion` VALUES (97, 49, 3, 'Nueva opcion', 0, '2021-10-11 17:32:21.109043', NULL, NULL, NULL, 1);

-- ----------------------------
-- Table structure for tbl_pago
-- ----------------------------
DROP TABLE IF EXISTS `tbl_pago`;
CREATE TABLE `tbl_pago`  (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `id_matricula` int(32) NULL DEFAULT NULL,
  `id_tipo_pago` int(32) NOT NULL,
  `monto` decimal(30, 2) NULL DEFAULT NULL,
  `fecha_pago` date NULL DEFAULT NULL,
  `estado_pago` int(32) NULL DEFAULT NULL,
  `create_at` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `user_create_at` int(32) NULL DEFAULT NULL,
  `create_up` datetime(6) NULL DEFAULT NULL,
  `user_create_up` int(32) NULL DEFAULT NULL,
  `fecha_plazo` date NULL DEFAULT NULL,
  `url_img` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `observacion` varchar(800) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `id_inscripcion` int(32) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_pago
-- ----------------------------
INSERT INTO `tbl_pago` VALUES (1, 1, 1, 120.00, NULL, 2, '2021-09-22 14:10:42.000196', NULL, NULL, NULL, '2021-09-24', NULL, NULL, NULL);
INSERT INTO `tbl_pago` VALUES (2, 1, 2, 80.50, NULL, 1, '2021-09-22 14:13:03.419637', NULL, NULL, NULL, '2021-09-30', NULL, NULL, NULL);
INSERT INTO `tbl_pago` VALUES (3, 1, 2, 80.50, NULL, 1, '2021-09-22 14:13:03.419637', NULL, NULL, NULL, '2021-10-30', NULL, NULL, NULL);
INSERT INTO `tbl_pago` VALUES (4, 1, 2, 80.50, NULL, 1, '2021-09-22 14:13:03.419637', NULL, NULL, NULL, '2021-11-30', NULL, NULL, NULL);
INSERT INTO `tbl_pago` VALUES (14, 16, 1, 70.50, NULL, 4, '2021-09-22 16:39:05.503530', NULL, NULL, NULL, '2021-09-23', 'public/img/bauchers/614e07a87b22414.jpg', 'El documento enviado no es correcto', NULL);
INSERT INTO `tbl_pago` VALUES (15, 16, 2, 50.00, NULL, 1, '2021-09-22 16:39:05.503530', NULL, NULL, NULL, '2021-10-22', NULL, NULL, NULL);
INSERT INTO `tbl_pago` VALUES (16, 16, 2, 50.00, NULL, 1, '2021-09-22 16:39:05.503530', NULL, NULL, NULL, '2021-11-22', NULL, NULL, NULL);
INSERT INTO `tbl_pago` VALUES (17, 16, 2, 50.00, NULL, 1, '2021-09-22 16:39:05.503530', NULL, NULL, NULL, '2021-12-22', NULL, NULL, NULL);
INSERT INTO `tbl_pago` VALUES (18, 17, 1, 120.00, NULL, 2, '2021-09-29 17:26:19.513504', NULL, NULL, NULL, '2021-09-30', NULL, NULL, NULL);
INSERT INTO `tbl_pago` VALUES (19, 17, 2, 80.50, NULL, 1, '2021-09-29 17:26:19.513504', NULL, NULL, NULL, '2021-10-29', NULL, NULL, NULL);
INSERT INTO `tbl_pago` VALUES (20, 17, 2, 80.50, NULL, 1, '2021-09-29 17:26:19.513504', NULL, NULL, NULL, '2021-11-29', NULL, NULL, NULL);
INSERT INTO `tbl_pago` VALUES (21, 17, 2, 80.50, NULL, 1, '2021-09-29 17:26:19.513504', NULL, NULL, NULL, '2021-12-29', NULL, NULL, NULL);
INSERT INTO `tbl_pago` VALUES (23, NULL, 3, 10.00, NULL, 2, '2021-10-07 15:37:23.206249', NULL, NULL, NULL, '2021-10-08', NULL, NULL, 2);

-- ----------------------------
-- Table structure for tbl_persona
-- ----------------------------
DROP TABLE IF EXISTS `tbl_persona`;
CREATE TABLE `tbl_persona`  (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `dni` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nombre` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `apellido_pat` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `fecha_nac` date NULL DEFAULT NULL,
  `correo` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `telefono` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `celular` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `id_ubigeo` varchar(6) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `create_at` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `user_create_at` int(32) NULL DEFAULT NULL,
  `create_up` datetime(6) NULL DEFAULT NULL,
  `user_create_up` int(32) NULL DEFAULT NULL,
  `apellido_mat` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `id_sexo` int(1) NULL DEFAULT NULL,
  `estado` tinyint(1) NULL DEFAULT 1,
  `url_img` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_persona
-- ----------------------------
INSERT INTO `tbl_persona` VALUES (1, '70389257', 'JOEL', 'VICENTE', NULL, '', '', '', '140406', '2021-08-27 12:13:45.860842', NULL, '2021-09-08 12:46:33.000000', 1, 'QUISPE', 1, 1, 'public/img/profile_small.jpg');
INSERT INTO `tbl_persona` VALUES (2, '70786548', 'BRAYHAN', 'BARRAGAN', NULL, '', '', '', '', '2021-08-31 12:17:50.211782', NULL, '2021-09-08 10:14:15.000000', 1, '', 1, 1, 'public/img/profile_small.jpg');
INSERT INTO `tbl_persona` VALUES (3, '12345678', 'KEVIN', 'VICENTE', NULL, '', '', '', '140406', '2021-08-31 12:18:26.986157', NULL, '2021-09-08 11:28:30.000000', 1, '', 1, 1, 'public/img/profile_small.jpg');
INSERT INTO `tbl_persona` VALUES (4, '70389258', 'JORGE', 'QUISPE', NULL, 'JOAN.14.08.95@GMAIL.COM', NULL, '991234657', '140406', '2021-09-21 23:57:08.000000', NULL, NULL, NULL, 'QUISPE', NULL, 1, NULL);
INSERT INTO `tbl_persona` VALUES (21, '70897099', 'DENIS JESUS', 'HERRERA', NULL, 'JSHERR.6@GMAIL.COM', NULL, '', '140411', '2021-09-22 16:39:05.000000', NULL, NULL, NULL, 'ESPIRITU', NULL, 1, NULL);

-- ----------------------------
-- Table structure for tbl_personal
-- ----------------------------
DROP TABLE IF EXISTS `tbl_personal`;
CREATE TABLE `tbl_personal`  (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `id_persona` int(32) NULL DEFAULT NULL,
  `id_cargo` int(32) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_personal
-- ----------------------------
INSERT INTO `tbl_personal` VALUES (1, 1, 1);

-- ----------------------------
-- Table structure for tbl_pregunta
-- ----------------------------
DROP TABLE IF EXISTS `tbl_pregunta`;
CREATE TABLE `tbl_pregunta`  (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `id_concurso` int(32) NOT NULL,
  `nro_orden` int(32) NOT NULL,
  `description` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `url_img` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `create_at` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `user_create_at` int(32) NULL DEFAULT NULL,
  `create_up` datetime(6) NULL DEFAULT NULL,
  `user_create_up` int(32) NULL DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `puntaje` tinyint(2) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_pregunta
-- ----------------------------
INSERT INTO `tbl_pregunta` VALUES (46, 21, 1, 'nueva pregunta pe causa', NULL, '2021-10-11 17:32:21.029986', NULL, NULL, NULL, 1, 1);
INSERT INTO `tbl_pregunta` VALUES (47, 21, 2, 'Nuena Pregunta 2', NULL, '2021-10-11 17:32:21.108061', NULL, NULL, NULL, 1, 1);
INSERT INTO `tbl_pregunta` VALUES (48, 21, 3, 'Nuena Pregunta 3', NULL, '2021-10-11 17:32:21.109043', NULL, NULL, NULL, 1, 1);
INSERT INTO `tbl_pregunta` VALUES (49, 21, 4, 'Nuena Pregunta 4', NULL, '2021-10-11 17:32:21.109043', NULL, NULL, NULL, 1, 1);

-- ----------------------------
-- Table structure for tbl_submenu
-- ----------------------------
DROP TABLE IF EXISTS `tbl_submenu`;
CREATE TABLE `tbl_submenu`  (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `id_menu` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `name_menu` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_tipo_menu` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '1:web , 2:admin',
  `alias` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `file_view` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `icon_class` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `estado` tinyint(1) NULL DEFAULT 1,
  `orden` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_submenu
-- ----------------------------
INSERT INTO `tbl_submenu` VALUES (1, '1', 'TABLAS', '2', 'tablas', 'tablas.php', NULL, 1, 1);
INSERT INTO `tbl_submenu` VALUES (2, '1', 'PERSONAL', '2', 'personal', 'personal.php', NULL, 1, 2);
INSERT INTO `tbl_submenu` VALUES (3, '5', 'CURSO', '2', 'curso', 'curso.php', NULL, 1, 1);
INSERT INTO `tbl_submenu` VALUES (4, '1', 'ALUMNO', '2', 'alumno', 'alumno.php', NULL, 1, 3);
INSERT INTO `tbl_submenu` VALUES (5, '4', 'ACCESOS X USUARIO', '2', 'accesos', 'accesos.php', NULL, 1, 1);
INSERT INTO `tbl_submenu` VALUES (6, '5', 'CURSO PROGRAMADO', '2', 'curso_programado', 'curso_programado.php', NULL, 1, 2);
INSERT INTO `tbl_submenu` VALUES (7, NULL, 'Inicio', '1', 'inicio', 'index.php', NULL, 1, 1);
INSERT INTO `tbl_submenu` VALUES (8, NULL, 'Sobre Nosotros', '1', 'sobre_nosotros', 'sobre_nosotros.php', NULL, 1, 2);
INSERT INTO `tbl_submenu` VALUES (9, NULL, 'Ciclos', '1', 'ciclos', 'ciclos.php', NULL, 1, 3);
INSERT INTO `tbl_submenu` VALUES (10, NULL, 'Matricula Virtual', '1', 'matricula_virtual', 'matricula_virtual.php', NULL, 1, 4);
INSERT INTO `tbl_submenu` VALUES (11, '2', 'MATRICULA Y MENSUALIDADES', '2', 'registrar_pago', 'registrar_pago.php', NULL, 1, 2);
INSERT INTO `tbl_submenu` VALUES (12, '1', 'USUARIO', '2', 'usuario', 'usuario.php', NULL, 1, 4);
INSERT INTO `tbl_submenu` VALUES (13, '1', 'ROLES', '2', 'roles', 'rol.php', NULL, 0, 4);
INSERT INTO `tbl_submenu` VALUES (14, '5', 'MIS CURSOS', '2', 'mis_cursos', 'mis_cursos.php', NULL, 1, 3);
INSERT INTO `tbl_submenu` VALUES (15, '2', 'INSCRIPCIONES', '2', 'inscripciones', 'inscripciones.php', NULL, 1, 3);
INSERT INTO `tbl_submenu` VALUES (16, '2', 'REVISAR PAGOS', '2', 'registrar_pago', 'registrar_pago.php', NULL, 1, 2);
INSERT INTO `tbl_submenu` VALUES (17, '1', 'CONCURSO', '2', 'concursos', 'concurso.php', NULL, 1, 2);
INSERT INTO `tbl_submenu` VALUES (18, '2', 'PARTICIPAR', '2', 'participar_concurso', 'participar.php', NULL, 1, 1);
INSERT INTO `tbl_submenu` VALUES (19, '4', 'ACCESOS X ROL', '2', 'accesos_rol', 'accesos_rol.php', NULL, 1, 1);

-- ----------------------------
-- Table structure for tbl_tablas
-- ----------------------------
DROP TABLE IF EXISTS `tbl_tablas`;
CREATE TABLE `tbl_tablas`  (
  `id_tabla` smallint(255) NULL DEFAULT NULL,
  `id_registro` smallint(255) NULL DEFAULT NULL,
  `cod_referencial` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `estado` tinyint(1) NULL DEFAULT 1
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_tablas
-- ----------------------------
INSERT INTO `tbl_tablas` VALUES (0, 1, '', 'TIPO_MENU', 1);
INSERT INTO `tbl_tablas` VALUES (1, 1, NULL, 'PAGINA_WEB', 1);
INSERT INTO `tbl_tablas` VALUES (1, 2, NULL, 'ADMIN', 1);
INSERT INTO `tbl_tablas` VALUES (0, 2, NULL, 'ROLES', 1);
INSERT INTO `tbl_tablas` VALUES (2, 1, NULL, 'SUPERADMIN', 1);
INSERT INTO `tbl_tablas` VALUES (2, 2, NULL, 'ADMINISTRADOR', 1);
INSERT INTO `tbl_tablas` VALUES (0, 3, NULL, 'TIPO_PAGO', 1);
INSERT INTO `tbl_tablas` VALUES (3, 1, NULL, 'MATRICULA', 1);
INSERT INTO `tbl_tablas` VALUES (3, 2, NULL, 'MENSUALIDAD', 1);
INSERT INTO `tbl_tablas` VALUES (0, 4, NULL, 'TURNOS', 1);
INSERT INTO `tbl_tablas` VALUES (4, 1, NULL, 'MAÑANA', 1);
INSERT INTO `tbl_tablas` VALUES (4, 2, NULL, 'TARDE', 1);
INSERT INTO `tbl_tablas` VALUES (4, 3, NULL, 'NOCHE', 1);
INSERT INTO `tbl_tablas` VALUES (0, 5, NULL, 'CARGO', 1);
INSERT INTO `tbl_tablas` VALUES (5, 1, NULL, 'PROFESOR', 1);
INSERT INTO `tbl_tablas` VALUES (0, 6, NULL, 'SEXO', 1);
INSERT INTO `tbl_tablas` VALUES (6, 1, NULL, 'MASCULINO', 1);
INSERT INTO `tbl_tablas` VALUES (6, 2, NULL, 'FEMENINO', 1);
INSERT INTO `tbl_tablas` VALUES (0, 7, NULL, 'ESTADO_MATRICULA', 1);
INSERT INTO `tbl_tablas` VALUES (7, 1, NULL, 'PRE-MATRICULADO', 1);
INSERT INTO `tbl_tablas` VALUES (7, 2, NULL, 'COMPLETADO', 1);
INSERT INTO `tbl_tablas` VALUES (7, 3, NULL, 'ANULADO', 1);
INSERT INTO `tbl_tablas` VALUES (1, 3, NULL, 'ESTUDIANTE', 1);
INSERT INTO `tbl_tablas` VALUES (2, 3, NULL, 'PROFESOR', 1);
INSERT INTO `tbl_tablas` VALUES (2, 4, NULL, 'ESTUDIANTE', 1);
INSERT INTO `tbl_tablas` VALUES (0, 8, NULL, 'ESTADO_PAGO', 1);
INSERT INTO `tbl_tablas` VALUES (8, 1, NULL, 'NO GENERADO', 1);
INSERT INTO `tbl_tablas` VALUES (8, 2, NULL, 'NO CANCELADO', 1);
INSERT INTO `tbl_tablas` VALUES (8, 3, NULL, 'PENDIENTE', 1);
INSERT INTO `tbl_tablas` VALUES (8, 4, NULL, 'RECHAZADO', 1);
INSERT INTO `tbl_tablas` VALUES (8, 5, NULL, 'COMPLETADO', 1);
INSERT INTO `tbl_tablas` VALUES (8, 6, NULL, 'ANULADO', 1);
INSERT INTO `tbl_tablas` VALUES (3, 3, NULL, 'INSCRIPCION POR PATICIPACION', 1);
INSERT INTO `tbl_tablas` VALUES (2, 5, NULL, 'PARTICIPANTE', 1);
INSERT INTO `tbl_tablas` VALUES (0, 9, NULL, 'ESTADO_INSCRIPCION', 1);
INSERT INTO `tbl_tablas` VALUES (9, 1, NULL, 'PRE-INSCRITO', 1);
INSERT INTO `tbl_tablas` VALUES (9, 2, NULL, 'COMPLETADO', 1);
INSERT INTO `tbl_tablas` VALUES (9, 3, NULL, 'ANULADO', 1);

-- ----------------------------
-- Table structure for tbl_ubigeo
-- ----------------------------
DROP TABLE IF EXISTS `tbl_ubigeo`;
CREATE TABLE `tbl_ubigeo`  (
  `id_ubigeo` varchar(6) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `departamento` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `provincia` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `distrito` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_pais` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_estadoreg` int(11) NOT NULL,
  `lat` decimal(30, 10) NULL DEFAULT NULL,
  `lng` decimal(30, 10) NULL DEFAULT NULL,
  `idz` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_ubigeo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_ubigeo
-- ----------------------------
INSERT INTO `tbl_ubigeo` VALUES ('010101', 'AMAZONAS', 'CHACHAPOYAS', 'CHACHAPOYAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010102', 'AMAZONAS', 'CHACHAPOYAS', 'ASUNCION', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010103', 'AMAZONAS', 'CHACHAPOYAS', 'BALSAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010104', 'AMAZONAS', 'CHACHAPOYAS', 'CHETO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010105', 'AMAZONAS', 'CHACHAPOYAS', 'CHILIQUIN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010106', 'AMAZONAS', 'CHACHAPOYAS', 'CHUQUIBAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010107', 'AMAZONAS', 'CHACHAPOYAS', 'GRANADA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010108', 'AMAZONAS', 'CHACHAPOYAS', 'HUANCAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010109', 'AMAZONAS', 'CHACHAPOYAS', 'LA JALCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010110', 'AMAZONAS', 'CHACHAPOYAS', 'LEIMEBAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010111', 'AMAZONAS', 'CHACHAPOYAS', 'LEVANTO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010112', 'AMAZONAS', 'CHACHAPOYAS', 'MAGDALENA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010113', 'AMAZONAS', 'CHACHAPOYAS', 'MARISCAL CASTILLA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010114', 'AMAZONAS', 'CHACHAPOYAS', 'MOLINOPAMPA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010115', 'AMAZONAS', 'CHACHAPOYAS', 'MONTEVIDEO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010116', 'AMAZONAS', 'CHACHAPOYAS', 'OLLEROS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010117', 'AMAZONAS', 'CHACHAPOYAS', 'QUINJALCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010118', 'AMAZONAS', 'CHACHAPOYAS', 'SAN FRANCISCO DE DAGUAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010119', 'AMAZONAS', 'CHACHAPOYAS', 'SAN ISIDRO DE MAINO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010120', 'AMAZONAS', 'CHACHAPOYAS', 'SOLOCO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010121', 'AMAZONAS', 'CHACHAPOYAS', 'SONCHE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010201', 'AMAZONAS', 'BAGUA', 'LA PECA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010202', 'AMAZONAS', 'BAGUA', 'ARAMANGO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010203', 'AMAZONAS', 'BAGUA', 'COPALLIN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010204', 'AMAZONAS', 'BAGUA', 'EL PARCO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010205', 'AMAZONAS', 'BAGUA', 'BAGUA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010206', 'AMAZONAS', 'BAGUA', 'IMAZA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010301', 'AMAZONAS', 'BONGARA', 'JUMBILLA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010302', 'AMAZONAS', 'BONGARA', 'COROSHA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010303', 'AMAZONAS', 'BONGARA', 'CUISPES', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010304', 'AMAZONAS', 'BONGARA', 'CHISQUILLA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010305', 'AMAZONAS', 'BONGARA', 'CHURUJA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010306', 'AMAZONAS', 'BONGARA', 'FLORIDA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010307', 'AMAZONAS', 'BONGARA', 'RECTA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010308', 'AMAZONAS', 'BONGARA', 'SAN CARLOS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010309', 'AMAZONAS', 'BONGARA', 'SHIPASBAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010310', 'AMAZONAS', 'BONGARA', 'VALERA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010311', 'AMAZONAS', 'BONGARA', 'YAMBRASBAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010312', 'AMAZONAS', 'BONGARA', 'JAZAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010401', 'AMAZONAS', 'LUYA', 'LAMUD', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010402', 'AMAZONAS', 'LUYA', 'CAMPORREDONDO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010403', 'AMAZONAS', 'LUYA', 'COCABAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010404', 'AMAZONAS', 'LUYA', 'COLCAMAR', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010405', 'AMAZONAS', 'LUYA', 'CONILA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010406', 'AMAZONAS', 'LUYA', 'INGUILPATA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010407', 'AMAZONAS', 'LUYA', 'LONGUITA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010408', 'AMAZONAS', 'LUYA', 'LONYA CHICO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010409', 'AMAZONAS', 'LUYA', 'LUYA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010410', 'AMAZONAS', 'LUYA', 'LUYA VIEJO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010411', 'AMAZONAS', 'LUYA', 'MARIA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010412', 'AMAZONAS', 'LUYA', 'OCALLI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010413', 'AMAZONAS', 'LUYA', 'OCUMAL', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010414', 'AMAZONAS', 'LUYA', 'PISUQUIA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010415', 'AMAZONAS', 'LUYA', 'SAN CRISTOBAL', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010416', 'AMAZONAS', 'LUYA', 'SAN FRANCISCO DE YESO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010417', 'AMAZONAS', 'LUYA', 'SAN JERONIMO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010418', 'AMAZONAS', 'LUYA', 'SAN JUAN DE LOPECANCHA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010419', 'AMAZONAS', 'LUYA', 'SANTA CATALINA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010420', 'AMAZONAS', 'LUYA', 'SANTO TOMAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010421', 'AMAZONAS', 'LUYA', 'TINGO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010422', 'AMAZONAS', 'LUYA', 'TRITA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010423', 'AMAZONAS', 'LUYA', 'PROVIDENCIA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010501', 'AMAZONAS', 'RODRIGUEZ DE MENDOZA', 'SAN NICOLAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010502', 'AMAZONAS', 'RODRIGUEZ DE MENDOZA', 'COCHAMAL', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010503', 'AMAZONAS', 'RODRIGUEZ DE MENDOZA', 'CHIRIMOTO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010504', 'AMAZONAS', 'RODRIGUEZ DE MENDOZA', 'HUAMBO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010505', 'AMAZONAS', 'RODRIGUEZ DE MENDOZA', 'LIMABAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010506', 'AMAZONAS', 'RODRIGUEZ DE MENDOZA', 'LONGAR', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010507', 'AMAZONAS', 'RODRIGUEZ DE MENDOZA', 'MILPUCC', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010508', 'AMAZONAS', 'RODRIGUEZ DE MENDOZA', 'MARISCAL BENAVIDES', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010509', 'AMAZONAS', 'RODRIGUEZ DE MENDOZA', 'OMIA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010510', 'AMAZONAS', 'RODRIGUEZ DE MENDOZA', 'SANTA ROSA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010511', 'AMAZONAS', 'RODRIGUEZ DE MENDOZA', 'TOTORA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010512', 'AMAZONAS', 'RODRIGUEZ DE MENDOZA', 'VISTA ALEGRE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010601', 'AMAZONAS', 'CONDORCANQUI', 'NIEVA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010602', 'AMAZONAS', 'CONDORCANQUI', 'RIO SANTIAGO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010603', 'AMAZONAS', 'CONDORCANQUI', 'EL CENEPA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010701', 'AMAZONAS', 'UTCUBAMBA', 'BAGUA GRANDE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010702', 'AMAZONAS', 'UTCUBAMBA', 'CAJARURO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010703', 'AMAZONAS', 'UTCUBAMBA', 'CUMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010704', 'AMAZONAS', 'UTCUBAMBA', 'EL MILAGRO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010705', 'AMAZONAS', 'UTCUBAMBA', 'JAMALCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010706', 'AMAZONAS', 'UTCUBAMBA', 'LONYA GRANDE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('010707', 'AMAZONAS', 'UTCUBAMBA', 'YAMON', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020101', 'ANCASH', 'HUARAZ', 'HUARAZ', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020102', 'ANCASH', 'HUARAZ', 'INDEPENDENCIA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020103', 'ANCASH', 'HUARAZ', 'COCHABAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020104', 'ANCASH', 'HUARAZ', 'COLCABAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020105', 'ANCASH', 'HUARAZ', 'HUANCHAY', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020106', 'ANCASH', 'HUARAZ', 'JANGAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020107', 'ANCASH', 'HUARAZ', 'LA LIBERTAD', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020108', 'ANCASH', 'HUARAZ', 'OLLEROS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020109', 'ANCASH', 'HUARAZ', 'PAMPAS GRANDE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020110', 'ANCASH', 'HUARAZ', 'PARIACOTO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020111', 'ANCASH', 'HUARAZ', 'PIRA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020112', 'ANCASH', 'HUARAZ', 'TARICA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020201', 'ANCASH', 'AIJA', 'AIJA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020203', 'ANCASH', 'AIJA', 'CORIS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020205', 'ANCASH', 'AIJA', 'HUACLLAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020206', 'ANCASH', 'AIJA', 'LA MERCED', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020208', 'ANCASH', 'AIJA', 'SUCCHA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020301', 'ANCASH', 'BOLOGNESI', 'CHIQUIAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020302', 'ANCASH', 'BOLOGNESI', 'ABELARDO PARDO LEZAMETA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020304', 'ANCASH', 'BOLOGNESI', 'AQUIA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020305', 'ANCASH', 'BOLOGNESI', 'CAJACAY', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020310', 'ANCASH', 'BOLOGNESI', 'HUAYLLACAYAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020311', 'ANCASH', 'BOLOGNESI', 'HUASTA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020313', 'ANCASH', 'BOLOGNESI', 'MANGAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020315', 'ANCASH', 'BOLOGNESI', 'PACLLON', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020317', 'ANCASH', 'BOLOGNESI', 'SAN MIGUEL DE CORPANQUI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020320', 'ANCASH', 'BOLOGNESI', 'TICLLOS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020321', 'ANCASH', 'BOLOGNESI', 'ANTONIO RAIMONDI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020322', 'ANCASH', 'BOLOGNESI', 'CANIS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020323', 'ANCASH', 'BOLOGNESI', 'COLQUIOC', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020324', 'ANCASH', 'BOLOGNESI', 'LA PRIMAVERA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020325', 'ANCASH', 'BOLOGNESI', 'HUALLANCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020401', 'ANCASH', 'CARHUAZ', 'CARHUAZ', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020402', 'ANCASH', 'CARHUAZ', 'ACOPAMPA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020403', 'ANCASH', 'CARHUAZ', 'AMASHCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020404', 'ANCASH', 'CARHUAZ', 'ANTA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020405', 'ANCASH', 'CARHUAZ', 'ATAQUERO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020406', 'ANCASH', 'CARHUAZ', 'MARCARA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020407', 'ANCASH', 'CARHUAZ', 'PARIAHUANCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020408', 'ANCASH', 'CARHUAZ', 'SAN MIGUEL DE ACO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020409', 'ANCASH', 'CARHUAZ', 'SHILLA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020410', 'ANCASH', 'CARHUAZ', 'TINCO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020411', 'ANCASH', 'CARHUAZ', 'YUNGAR', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020501', 'ANCASH', 'CASMA', 'CASMA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020502', 'ANCASH', 'CASMA', 'BUENA VISTA ALTA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020503', 'ANCASH', 'CASMA', 'COMANDANTE NOEL', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020505', 'ANCASH', 'CASMA', 'YAUTAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020601', 'ANCASH', 'CORONGO', 'CORONGO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020602', 'ANCASH', 'CORONGO', 'ACO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020603', 'ANCASH', 'CORONGO', 'BAMBAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020604', 'ANCASH', 'CORONGO', 'CUSCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020605', 'ANCASH', 'CORONGO', 'LA PAMPA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020606', 'ANCASH', 'CORONGO', 'YANAC', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020607', 'ANCASH', 'CORONGO', 'YUPAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020701', 'ANCASH', 'HUAYLAS', 'CARAZ', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020702', 'ANCASH', 'HUAYLAS', 'HUALLANCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020703', 'ANCASH', 'HUAYLAS', 'HUATA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020704', 'ANCASH', 'HUAYLAS', 'HUAYLAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020705', 'ANCASH', 'HUAYLAS', 'MATO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020706', 'ANCASH', 'HUAYLAS', 'PAMPAROMAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020707', 'ANCASH', 'HUAYLAS', 'PUEBLO LIBRE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020708', 'ANCASH', 'HUAYLAS', 'SANTA CRUZ', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020709', 'ANCASH', 'HUAYLAS', 'YURACMARCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020710', 'ANCASH', 'HUAYLAS', 'SANTO TORIBIO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020801', 'ANCASH', 'HUARI', 'HUARI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020802', 'ANCASH', 'HUARI', 'CAJAY', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020803', 'ANCASH', 'HUARI', 'CHAVIN DE HUANTAR', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020804', 'ANCASH', 'HUARI', 'HUACACHI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020805', 'ANCASH', 'HUARI', 'HUACHIS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020806', 'ANCASH', 'HUARI', 'HUACCHIS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020807', 'ANCASH', 'HUARI', 'HUANTAR', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020808', 'ANCASH', 'HUARI', 'MASIN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020809', 'ANCASH', 'HUARI', 'PAUCAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020810', 'ANCASH', 'HUARI', 'PONTO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020811', 'ANCASH', 'HUARI', 'RAHUAPAMPA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020812', 'ANCASH', 'HUARI', 'RAPAYAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020813', 'ANCASH', 'HUARI', 'SAN MARCOS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020814', 'ANCASH', 'HUARI', 'SAN PEDRO DE CHANA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020815', 'ANCASH', 'HUARI', 'UCO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020816', 'ANCASH', 'HUARI', 'ANRA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020901', 'ANCASH', 'MARISCAL LUZURIAGA', 'PISCOBAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020902', 'ANCASH', 'MARISCAL LUZURIAGA', 'CASCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020903', 'ANCASH', 'MARISCAL LUZURIAGA', 'LUCMA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020904', 'ANCASH', 'MARISCAL LUZURIAGA', 'FIDEL OLIVAS ESCUDERO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020905', 'ANCASH', 'MARISCAL LUZURIAGA', 'LLAMA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020906', 'ANCASH', 'MARISCAL LUZURIAGA', 'LLUMPA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020907', 'ANCASH', 'MARISCAL LUZURIAGA', 'MUSGA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('020908', 'ANCASH', 'MARISCAL LUZURIAGA', 'ELEAZAR GUZMAN BARRON', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021001', 'ANCASH', 'PALLASCA', 'CABANA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021002', 'ANCASH', 'PALLASCA', 'BOLOGNESI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021003', 'ANCASH', 'PALLASCA', 'CONCHUCOS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021004', 'ANCASH', 'PALLASCA', 'HUACASCHUQUE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021005', 'ANCASH', 'PALLASCA', 'HUANDOVAL', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021006', 'ANCASH', 'PALLASCA', 'LACABAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021007', 'ANCASH', 'PALLASCA', 'LLAPO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021008', 'ANCASH', 'PALLASCA', 'PALLASCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021009', 'ANCASH', 'PALLASCA', 'PAMPAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021010', 'ANCASH', 'PALLASCA', 'SANTA ROSA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021011', 'ANCASH', 'PALLASCA', 'TAUCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021101', 'ANCASH', 'POMABAMBA', 'POMABAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021102', 'ANCASH', 'POMABAMBA', 'HUAYLLAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021103', 'ANCASH', 'POMABAMBA', 'PAROBAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021104', 'ANCASH', 'POMABAMBA', 'QUINUABAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021201', 'ANCASH', 'RECUAY', 'RECUAY', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021202', 'ANCASH', 'RECUAY', 'COTAPARACO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021203', 'ANCASH', 'RECUAY', 'HUAYLLAPAMPA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021204', 'ANCASH', 'RECUAY', 'MARCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021205', 'ANCASH', 'RECUAY', 'PAMPAS CHICO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021206', 'ANCASH', 'RECUAY', 'PARARIN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021207', 'ANCASH', 'RECUAY', 'TAPACOCHA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021208', 'ANCASH', 'RECUAY', 'TICAPAMPA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021209', 'ANCASH', 'RECUAY', 'LLACLLIN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021210', 'ANCASH', 'RECUAY', 'CATAC', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021301', 'ANCASH', 'SANTA', 'CHIMBOTE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021302', 'ANCASH', 'SANTA', 'CACERES DEL PERU', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021303', 'ANCASH', 'SANTA', 'MACATE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021304', 'ANCASH', 'SANTA', 'MORO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021305', 'ANCASH', 'SANTA', 'NEPEÑA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021306', 'ANCASH', 'SANTA', 'SAMANCO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021307', 'ANCASH', 'SANTA', 'SANTA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021308', 'ANCASH', 'SANTA', 'COISHCO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021309', 'ANCASH', 'SANTA', 'NUEVO CHIMBOTE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021401', 'ANCASH', 'SIHUAS', 'SIHUAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021402', 'ANCASH', 'SIHUAS', 'ALFONSO UGARTE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021403', 'ANCASH', 'SIHUAS', 'CHINGALPO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021404', 'ANCASH', 'SIHUAS', 'HUAYLLABAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021405', 'ANCASH', 'SIHUAS', 'QUICHES', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021406', 'ANCASH', 'SIHUAS', 'SICSIBAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021407', 'ANCASH', 'SIHUAS', 'ACOBAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021408', 'ANCASH', 'SIHUAS', 'CASHAPAMPA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021409', 'ANCASH', 'SIHUAS', 'RAGASH', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021410', 'ANCASH', 'SIHUAS', 'SAN JUAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021501', 'ANCASH', 'YUNGAY', 'YUNGAY', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021502', 'ANCASH', 'YUNGAY', 'CASCAPARA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021503', 'ANCASH', 'YUNGAY', 'MANCOS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021504', 'ANCASH', 'YUNGAY', 'MATACOTO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021505', 'ANCASH', 'YUNGAY', 'QUILLO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021506', 'ANCASH', 'YUNGAY', 'RANRAHIRCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021507', 'ANCASH', 'YUNGAY', 'SHUPLUY', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021508', 'ANCASH', 'YUNGAY', 'YANAMA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021601', 'ANCASH', 'ANTONIO RAIMONDI', 'LLAMELLIN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021602', 'ANCASH', 'ANTONIO RAIMONDI', 'ACZO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021603', 'ANCASH', 'ANTONIO RAIMONDI', 'CHACCHO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021604', 'ANCASH', 'ANTONIO RAIMONDI', 'CHINGAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021605', 'ANCASH', 'ANTONIO RAIMONDI', 'MIRGAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021606', 'ANCASH', 'ANTONIO RAIMONDI', 'SAN JUAN DE RONTOY', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021701', 'ANCASH', 'CARLOS FERMIN FITZCARRALD', 'SAN LUIS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021702', 'ANCASH', 'CARLOS FERMIN FITZCARRALD', 'YAUYA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021703', 'ANCASH', 'CARLOS FERMIN FITZCARRALD', 'SAN NICOLAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021801', 'ANCASH', 'ASUNCION', 'CHACAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021802', 'ANCASH', 'ASUNCION', 'ACOCHACA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021901', 'ANCASH', 'HUARMEY', 'HUARMEY', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021902', 'ANCASH', 'HUARMEY', 'COCHAPETI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021903', 'ANCASH', 'HUARMEY', 'HUAYAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021904', 'ANCASH', 'HUARMEY', 'MALVAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('021905', 'ANCASH', 'HUARMEY', 'CULEBRAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('022001', 'ANCASH', 'OCROS', 'ACAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('022002', 'ANCASH', 'OCROS', 'CAJAMARQUILLA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('022003', 'ANCASH', 'OCROS', 'CARHUAPAMPA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('022004', 'ANCASH', 'OCROS', 'COCHAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('022005', 'ANCASH', 'OCROS', 'CONGAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('022006', 'ANCASH', 'OCROS', 'LLIPA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('022007', 'ANCASH', 'OCROS', 'OCROS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('022008', 'ANCASH', 'OCROS', 'SAN CRISTOBAL DE RAJAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('022009', 'ANCASH', 'OCROS', 'SAN PEDRO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('022010', 'ANCASH', 'OCROS', 'SANTIAGO DE CHILCAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030101', 'APURIMAC', 'ABANCAY', 'ABANCAY', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030102', 'APURIMAC', 'ABANCAY', 'CIRCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030103', 'APURIMAC', 'ABANCAY', 'CURAHUASI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030104', 'APURIMAC', 'ABANCAY', 'CHACOCHE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030105', 'APURIMAC', 'ABANCAY', 'HUANIPACA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030106', 'APURIMAC', 'ABANCAY', 'LAMBRAMA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030107', 'APURIMAC', 'ABANCAY', 'PICHIRHUA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030108', 'APURIMAC', 'ABANCAY', 'SAN PEDRO DE CACHORA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030109', 'APURIMAC', 'ABANCAY', 'TAMBURCO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030201', 'APURIMAC', 'AYMARAES', 'CHALHUANCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030202', 'APURIMAC', 'AYMARAES', 'CAPAYA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030203', 'APURIMAC', 'AYMARAES', 'CARAYBAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030204', 'APURIMAC', 'AYMARAES', 'COLCABAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030205', 'APURIMAC', 'AYMARAES', 'COTARUSE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030206', 'APURIMAC', 'AYMARAES', 'CHAPIMARCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030207', 'APURIMAC', 'AYMARAES', 'HUAYLLO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030208', 'APURIMAC', 'AYMARAES', 'LUCRE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030209', 'APURIMAC', 'AYMARAES', 'POCOHUANCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030210', 'APURIMAC', 'AYMARAES', 'SAÑAYCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030211', 'APURIMAC', 'AYMARAES', 'SORAYA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030212', 'APURIMAC', 'AYMARAES', 'TAPAIRIHUA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030213', 'APURIMAC', 'AYMARAES', 'TINTAY', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030214', 'APURIMAC', 'AYMARAES', 'TORAYA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030215', 'APURIMAC', 'AYMARAES', 'YANACA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030216', 'APURIMAC', 'AYMARAES', 'SAN JUAN DE CHACÑA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030217', 'APURIMAC', 'AYMARAES', 'JUSTO APU SAHUARAURA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030301', 'APURIMAC', 'ANDAHUAYLAS', 'ANDAHUAYLAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030302', 'APURIMAC', 'ANDAHUAYLAS', 'ANDARAPA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030303', 'APURIMAC', 'ANDAHUAYLAS', 'CHIARA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030304', 'APURIMAC', 'ANDAHUAYLAS', 'HUANCARAMA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030305', 'APURIMAC', 'ANDAHUAYLAS', 'HUANCARAY', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030306', 'APURIMAC', 'ANDAHUAYLAS', 'KISHUARA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030307', 'APURIMAC', 'ANDAHUAYLAS', 'PACOBAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030308', 'APURIMAC', 'ANDAHUAYLAS', 'PAMPACHIRI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030309', 'APURIMAC', 'ANDAHUAYLAS', 'SAN ANTONIO DE CACHI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030310', 'APURIMAC', 'ANDAHUAYLAS', 'SAN JERONIMO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030311', 'APURIMAC', 'ANDAHUAYLAS', 'TALAVERA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030312', 'APURIMAC', 'ANDAHUAYLAS', 'TURPO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030313', 'APURIMAC', 'ANDAHUAYLAS', 'PACUCHA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030314', 'APURIMAC', 'ANDAHUAYLAS', 'POMACOCHA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030315', 'APURIMAC', 'ANDAHUAYLAS', 'SANTA MARIA DE CHICMO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030316', 'APURIMAC', 'ANDAHUAYLAS', 'TUMAY HUARACA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030317', 'APURIMAC', 'ANDAHUAYLAS', 'HUAYANA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030318', 'APURIMAC', 'ANDAHUAYLAS', 'SAN MIGUEL DE CHACCRAMPA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030319', 'APURIMAC', 'ANDAHUAYLAS', 'KAQUIABAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030401', 'APURIMAC', 'ANTABAMBA', 'ANTABAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030402', 'APURIMAC', 'ANTABAMBA', 'EL ORO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030403', 'APURIMAC', 'ANTABAMBA', 'HUAQUIRCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030404', 'APURIMAC', 'ANTABAMBA', 'JUAN ESPINOZA MEDRANO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030405', 'APURIMAC', 'ANTABAMBA', 'OROPESA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030406', 'APURIMAC', 'ANTABAMBA', 'PACHACONAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030407', 'APURIMAC', 'ANTABAMBA', 'SABAINO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030501', 'APURIMAC', 'COTABAMBAS', 'TAMBOBAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030502', 'APURIMAC', 'COTABAMBAS', 'COYLLURQUI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030503', 'APURIMAC', 'COTABAMBAS', 'COTABAMBAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030504', 'APURIMAC', 'COTABAMBAS', 'HAQUIRA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030505', 'APURIMAC', 'COTABAMBAS', 'MARA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030506', 'APURIMAC', 'COTABAMBAS', 'CHALLHUAHUACHO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030601', 'APURIMAC', 'GRAU', 'CHUQUIBAMBILLA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030602', 'APURIMAC', 'GRAU', 'CURPAHUASI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030603', 'APURIMAC', 'GRAU', 'HUAILLATI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030604', 'APURIMAC', 'GRAU', 'MAMARA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030605', 'APURIMAC', 'GRAU', 'MARISCAL GAMARRA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030606', 'APURIMAC', 'GRAU', 'MICAELA BASTIDAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030607', 'APURIMAC', 'GRAU', 'PROGRESO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030608', 'APURIMAC', 'GRAU', 'PATAYPAMPA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030609', 'APURIMAC', 'GRAU', 'SAN ANTONIO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030610', 'APURIMAC', 'GRAU', 'TURPAY', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030611', 'APURIMAC', 'GRAU', 'VILCABAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030612', 'APURIMAC', 'GRAU', 'VIRUNDO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030613', 'APURIMAC', 'GRAU', 'SANTA ROSA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030614', 'APURIMAC', 'GRAU', 'CURASCO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030701', 'APURIMAC', 'CHINCHEROS', 'CHINCHEROS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030702', 'APURIMAC', 'CHINCHEROS', 'ONGOY', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030703', 'APURIMAC', 'CHINCHEROS', 'OCOBAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030704', 'APURIMAC', 'CHINCHEROS', 'COCHARCAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030705', 'APURIMAC', 'CHINCHEROS', 'ANCO HUALLO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030706', 'APURIMAC', 'CHINCHEROS', 'HUACCANA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030707', 'APURIMAC', 'CHINCHEROS', 'URANMARCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('030708', 'APURIMAC', 'CHINCHEROS', 'RANRACANCHA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040101', 'AREQUIPA', 'AREQUIPA', 'AREQUIPA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040102', 'AREQUIPA', 'AREQUIPA', 'CAYMA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040103', 'AREQUIPA', 'AREQUIPA', 'CERRO COLORADO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040104', 'AREQUIPA', 'AREQUIPA', 'CHARACATO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040105', 'AREQUIPA', 'AREQUIPA', 'CHIGUATA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040106', 'AREQUIPA', 'AREQUIPA', 'LA JOYA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040107', 'AREQUIPA', 'AREQUIPA', 'MIRAFLORES', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040108', 'AREQUIPA', 'AREQUIPA', 'MOLLEBAYA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040109', 'AREQUIPA', 'AREQUIPA', 'PAUCARPATA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040110', 'AREQUIPA', 'AREQUIPA', 'POCSI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040111', 'AREQUIPA', 'AREQUIPA', 'POLOBAYA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040112', 'AREQUIPA', 'AREQUIPA', 'QUEQUEÑA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040113', 'AREQUIPA', 'AREQUIPA', 'SABANDIA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040114', 'AREQUIPA', 'AREQUIPA', 'SACHACA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040115', 'AREQUIPA', 'AREQUIPA', 'SAN JUAN DE SIGUAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040116', 'AREQUIPA', 'AREQUIPA', 'SAN JUAN DE TARUCANI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040117', 'AREQUIPA', 'AREQUIPA', 'SANTA ISABEL DE SIGUAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040118', 'AREQUIPA', 'AREQUIPA', 'SANTA RITA DE SIHUAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040119', 'AREQUIPA', 'AREQUIPA', 'SOCABAYA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040120', 'AREQUIPA', 'AREQUIPA', 'TIABAYA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040121', 'AREQUIPA', 'AREQUIPA', 'UCHUMAYO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040122', 'AREQUIPA', 'AREQUIPA', 'VITOR', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040123', 'AREQUIPA', 'AREQUIPA', 'YANAHUARA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040124', 'AREQUIPA', 'AREQUIPA', 'YARABAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040125', 'AREQUIPA', 'AREQUIPA', 'YURA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040126', 'AREQUIPA', 'AREQUIPA', 'MARIANO MELGAR', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040127', 'AREQUIPA', 'AREQUIPA', 'JACOBO HUNTER', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040128', 'AREQUIPA', 'AREQUIPA', 'ALTO SELVA ALEGRE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040129', 'AREQUIPA', 'AREQUIPA', 'JOSE LUIS BUSTAMANTE Y RIVERO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040201', 'AREQUIPA', 'CAYLLOMA', 'CHIVAY', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040202', 'AREQUIPA', 'CAYLLOMA', 'ACHOMA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040203', 'AREQUIPA', 'CAYLLOMA', 'CABANACONDE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040204', 'AREQUIPA', 'CAYLLOMA', 'CAYLLOMA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040205', 'AREQUIPA', 'CAYLLOMA', 'CALLALLI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040206', 'AREQUIPA', 'CAYLLOMA', 'COPORAQUE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040207', 'AREQUIPA', 'CAYLLOMA', 'HUAMBO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040208', 'AREQUIPA', 'CAYLLOMA', 'HUANCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040209', 'AREQUIPA', 'CAYLLOMA', 'ICHUPAMPA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040210', 'AREQUIPA', 'CAYLLOMA', 'LARI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040211', 'AREQUIPA', 'CAYLLOMA', 'LLUTA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040212', 'AREQUIPA', 'CAYLLOMA', 'MACA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040213', 'AREQUIPA', 'CAYLLOMA', 'MADRIGAL', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040214', 'AREQUIPA', 'CAYLLOMA', 'SAN ANTONIO DE CHUCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040215', 'AREQUIPA', 'CAYLLOMA', 'SIBAYO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040216', 'AREQUIPA', 'CAYLLOMA', 'TAPAY', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040217', 'AREQUIPA', 'CAYLLOMA', 'TISCO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040218', 'AREQUIPA', 'CAYLLOMA', 'TUTI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040219', 'AREQUIPA', 'CAYLLOMA', 'YANQUE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040220', 'AREQUIPA', 'CAYLLOMA', 'MAJES', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040301', 'AREQUIPA', 'CAMANA', 'CAMANA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040302', 'AREQUIPA', 'CAMANA', 'JOSE MARIA QUIMPER', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040303', 'AREQUIPA', 'CAMANA', 'MARIANO NICOLAS VALCARCEL', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040304', 'AREQUIPA', 'CAMANA', 'MARISCAL CACERES', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040305', 'AREQUIPA', 'CAMANA', 'NICOLAS DE PIEROLA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040306', 'AREQUIPA', 'CAMANA', 'OCOÑA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040307', 'AREQUIPA', 'CAMANA', 'QUILCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040308', 'AREQUIPA', 'CAMANA', 'SAMUEL PASTOR', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040401', 'AREQUIPA', 'CARAVELI', 'CARAVELI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040402', 'AREQUIPA', 'CARAVELI', 'ACARI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040403', 'AREQUIPA', 'CARAVELI', 'ATICO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040404', 'AREQUIPA', 'CARAVELI', 'ATIQUIPA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040405', 'AREQUIPA', 'CARAVELI', 'BELLA UNION', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040406', 'AREQUIPA', 'CARAVELI', 'CAHUACHO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040407', 'AREQUIPA', 'CARAVELI', 'CHALA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040408', 'AREQUIPA', 'CARAVELI', 'CHAPARRA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040409', 'AREQUIPA', 'CARAVELI', 'HUANUHUANU', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040410', 'AREQUIPA', 'CARAVELI', 'JAQUI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040411', 'AREQUIPA', 'CARAVELI', 'LOMAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040412', 'AREQUIPA', 'CARAVELI', 'QUICACHA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040413', 'AREQUIPA', 'CARAVELI', 'YAUCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040501', 'AREQUIPA', 'CASTILLA', 'APLAO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040502', 'AREQUIPA', 'CASTILLA', 'ANDAGUA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040503', 'AREQUIPA', 'CASTILLA', 'AYO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040504', 'AREQUIPA', 'CASTILLA', 'CHACHAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040505', 'AREQUIPA', 'CASTILLA', 'CHILCAYMARCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040506', 'AREQUIPA', 'CASTILLA', 'CHOCO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040507', 'AREQUIPA', 'CASTILLA', 'HUANCARQUI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040508', 'AREQUIPA', 'CASTILLA', 'MACHAGUAY', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040509', 'AREQUIPA', 'CASTILLA', 'ORCOPAMPA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040510', 'AREQUIPA', 'CASTILLA', 'PAMPACOLCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040511', 'AREQUIPA', 'CASTILLA', 'TIPAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040512', 'AREQUIPA', 'CASTILLA', 'URACA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040513', 'AREQUIPA', 'CASTILLA', 'UÑON', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040514', 'AREQUIPA', 'CASTILLA', 'VIRACO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040601', 'AREQUIPA', 'CONDESUYOS', 'CHUQUIBAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040602', 'AREQUIPA', 'CONDESUYOS', 'ANDARAY', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040603', 'AREQUIPA', 'CONDESUYOS', 'CAYARANI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040604', 'AREQUIPA', 'CONDESUYOS', 'CHICHAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040605', 'AREQUIPA', 'CONDESUYOS', 'IRAY', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040606', 'AREQUIPA', 'CONDESUYOS', 'SALAMANCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040607', 'AREQUIPA', 'CONDESUYOS', 'YANAQUIHUA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040608', 'AREQUIPA', 'CONDESUYOS', 'RIO GRANDE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040701', 'AREQUIPA', 'ISLAY', 'MOLLENDO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040702', 'AREQUIPA', 'ISLAY', 'COCACHACRA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040703', 'AREQUIPA', 'ISLAY', 'DEAN VALDIVIA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040704', 'AREQUIPA', 'ISLAY', 'ISLAY', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040705', 'AREQUIPA', 'ISLAY', 'MEJIA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040706', 'AREQUIPA', 'ISLAY', 'PUNTA DE BOMBON', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040801', 'AREQUIPA', 'LA UNION', 'COTAHUASI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040802', 'AREQUIPA', 'LA UNION', 'ALCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040803', 'AREQUIPA', 'LA UNION', 'CHARCANA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040804', 'AREQUIPA', 'LA UNION', 'HUAYNACOTAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040805', 'AREQUIPA', 'LA UNION', 'PAMPAMARCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040806', 'AREQUIPA', 'LA UNION', 'PUYCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040807', 'AREQUIPA', 'LA UNION', 'QUECHUALLA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040808', 'AREQUIPA', 'LA UNION', 'SAYLA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040809', 'AREQUIPA', 'LA UNION', 'TAURIA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040810', 'AREQUIPA', 'LA UNION', 'TOMEPAMPA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('040811', 'AREQUIPA', 'LA UNION', 'TORO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050101', 'AYACUCHO', 'HUAMANGA', 'AYACUCHO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050102', 'AYACUCHO', 'HUAMANGA', 'ACOS VINCHOS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050103', 'AYACUCHO', 'HUAMANGA', 'CARMEN ALTO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050104', 'AYACUCHO', 'HUAMANGA', 'CHIARA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050105', 'AYACUCHO', 'HUAMANGA', 'QUINUA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050106', 'AYACUCHO', 'HUAMANGA', 'SAN JOSE DE TICLLAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050107', 'AYACUCHO', 'HUAMANGA', 'SAN JUAN BAUTISTA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050108', 'AYACUCHO', 'HUAMANGA', 'SANTIAGO DE PISCHA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050109', 'AYACUCHO', 'HUAMANGA', 'VINCHOS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050110', 'AYACUCHO', 'HUAMANGA', 'TAMBILLO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050111', 'AYACUCHO', 'HUAMANGA', 'ACOCRO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050112', 'AYACUCHO', 'HUAMANGA', 'SOCOS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050113', 'AYACUCHO', 'HUAMANGA', 'OCROS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050114', 'AYACUCHO', 'HUAMANGA', 'PACAYCASA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050115', 'AYACUCHO', 'HUAMANGA', 'JESUS NAZARENO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050201', 'AYACUCHO', 'CANGALLO', 'CANGALLO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050204', 'AYACUCHO', 'CANGALLO', 'CHUSCHI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050206', 'AYACUCHO', 'CANGALLO', 'LOS MOROCHUCOS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050207', 'AYACUCHO', 'CANGALLO', 'PARAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050208', 'AYACUCHO', 'CANGALLO', 'TOTOS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050211', 'AYACUCHO', 'CANGALLO', 'MARIA PARADO DE BELLIDO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050301', 'AYACUCHO', 'HUANTA', 'HUANTA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050302', 'AYACUCHO', 'HUANTA', 'AYAHUANCO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050303', 'AYACUCHO', 'HUANTA', 'HUAMANGUILLA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050304', 'AYACUCHO', 'HUANTA', 'IGUAIN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050305', 'AYACUCHO', 'HUANTA', 'LURICOCHA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050307', 'AYACUCHO', 'HUANTA', 'SANTILLANA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050308', 'AYACUCHO', 'HUANTA', 'SIVIA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050309', 'AYACUCHO', 'HUANTA', 'LLOCHEGUA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050401', 'AYACUCHO', 'LA MAR', 'SAN MIGUEL', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050402', 'AYACUCHO', 'LA MAR', 'ANCO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050403', 'AYACUCHO', 'LA MAR', 'AYNA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050404', 'AYACUCHO', 'LA MAR', 'CHILCAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050405', 'AYACUCHO', 'LA MAR', 'CHUNGUI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050406', 'AYACUCHO', 'LA MAR', 'TAMBO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050407', 'AYACUCHO', 'LA MAR', 'LUIS CARRANZA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050408', 'AYACUCHO', 'LA MAR', 'SANTA ROSA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050409', 'AYACUCHO', 'LA MAR', 'SAMUGARI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050501', 'AYACUCHO', 'LUCANAS', 'PUQUIO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050502', 'AYACUCHO', 'LUCANAS', 'AUCARA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050503', 'AYACUCHO', 'LUCANAS', 'CABANA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050504', 'AYACUCHO', 'LUCANAS', 'CARMEN SALCEDO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050506', 'AYACUCHO', 'LUCANAS', 'CHAVIÑA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050508', 'AYACUCHO', 'LUCANAS', 'CHIPAO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050510', 'AYACUCHO', 'LUCANAS', 'HUAC-HUAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050511', 'AYACUCHO', 'LUCANAS', 'LARAMATE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050512', 'AYACUCHO', 'LUCANAS', 'LEONCIO PRADO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050513', 'AYACUCHO', 'LUCANAS', 'LUCANAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050514', 'AYACUCHO', 'LUCANAS', 'LLAUTA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050516', 'AYACUCHO', 'LUCANAS', 'OCAÑA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050517', 'AYACUCHO', 'LUCANAS', 'OTOCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050520', 'AYACUCHO', 'LUCANAS', 'SANCOS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050521', 'AYACUCHO', 'LUCANAS', 'SAN JUAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050522', 'AYACUCHO', 'LUCANAS', 'SAN PEDRO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050524', 'AYACUCHO', 'LUCANAS', 'SANTA ANA DE HUAYCAHUACHO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050525', 'AYACUCHO', 'LUCANAS', 'SANTA LUCIA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050529', 'AYACUCHO', 'LUCANAS', 'SAISA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050531', 'AYACUCHO', 'LUCANAS', 'SAN PEDRO DE PALCO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050532', 'AYACUCHO', 'LUCANAS', 'SAN CRISTOBAL', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050601', 'AYACUCHO', 'PARINACOCHAS', 'CORACORA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050604', 'AYACUCHO', 'PARINACOCHAS', 'CORONEL CASTAÑEDA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050605', 'AYACUCHO', 'PARINACOCHAS', 'CHUMPI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050608', 'AYACUCHO', 'PARINACOCHAS', 'PACAPAUSA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050611', 'AYACUCHO', 'PARINACOCHAS', 'PULLO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050612', 'AYACUCHO', 'PARINACOCHAS', 'PUYUSCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050615', 'AYACUCHO', 'PARINACOCHAS', 'SAN FRANCISCO DE RAVACAYCO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050616', 'AYACUCHO', 'PARINACOCHAS', 'UPAHUACHO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050701', 'AYACUCHO', 'VICTOR FAJARDO', 'HUANCAPI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050702', 'AYACUCHO', 'VICTOR FAJARDO', 'ALCAMENCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050703', 'AYACUCHO', 'VICTOR FAJARDO', 'APONGO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050704', 'AYACUCHO', 'VICTOR FAJARDO', 'CANARIA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050706', 'AYACUCHO', 'VICTOR FAJARDO', 'CAYARA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050707', 'AYACUCHO', 'VICTOR FAJARDO', 'COLCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050708', 'AYACUCHO', 'VICTOR FAJARDO', 'HUALLA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050709', 'AYACUCHO', 'VICTOR FAJARDO', 'HUAMANQUIQUIA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050710', 'AYACUCHO', 'VICTOR FAJARDO', 'HUANCARAYLLA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050713', 'AYACUCHO', 'VICTOR FAJARDO', 'SARHUA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050714', 'AYACUCHO', 'VICTOR FAJARDO', 'VILCANCHOS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050715', 'AYACUCHO', 'VICTOR FAJARDO', 'ASQUIPATA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050801', 'AYACUCHO', 'HUANCA SANCOS', 'SANCOS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050802', 'AYACUCHO', 'HUANCA SANCOS', 'SACSAMARCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050803', 'AYACUCHO', 'HUANCA SANCOS', 'SANTIAGO DE LUCANAMARCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050804', 'AYACUCHO', 'HUANCA SANCOS', 'CARAPO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050901', 'AYACUCHO', 'VILCAS HUAMAN', 'VILCAS HUAMAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050902', 'AYACUCHO', 'VILCAS HUAMAN', 'VISCHONGO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050903', 'AYACUCHO', 'VILCAS HUAMAN', 'ACCOMARCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050904', 'AYACUCHO', 'VILCAS HUAMAN', 'CARHUANCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050905', 'AYACUCHO', 'VILCAS HUAMAN', 'CONCEPCION', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050906', 'AYACUCHO', 'VILCAS HUAMAN', 'HUAMBALPA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050907', 'AYACUCHO', 'VILCAS HUAMAN', 'SAURAMA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('050908', 'AYACUCHO', 'VILCAS HUAMAN', 'INDEPENDENCIA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('051001', 'AYACUCHO', 'PAUCAR DEL SARA SARA', 'PAUSA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('051002', 'AYACUCHO', 'PAUCAR DEL SARA SARA', 'COLTA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('051003', 'AYACUCHO', 'PAUCAR DEL SARA SARA', 'CORCULLA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('051004', 'AYACUCHO', 'PAUCAR DEL SARA SARA', 'LAMPA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('051005', 'AYACUCHO', 'PAUCAR DEL SARA SARA', 'MARCABAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('051006', 'AYACUCHO', 'PAUCAR DEL SARA SARA', 'OYOLO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('051007', 'AYACUCHO', 'PAUCAR DEL SARA SARA', 'PARARCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('051008', 'AYACUCHO', 'PAUCAR DEL SARA SARA', 'SAN JAVIER DE ALPABAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('051009', 'AYACUCHO', 'PAUCAR DEL SARA SARA', 'SAN JOSE DE USHUA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('051010', 'AYACUCHO', 'PAUCAR DEL SARA SARA', 'SARA SARA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('051101', 'AYACUCHO', 'SUCRE', 'QUEROBAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('051102', 'AYACUCHO', 'SUCRE', 'BELEN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('051103', 'AYACUCHO', 'SUCRE', 'CHALCOS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('051104', 'AYACUCHO', 'SUCRE', 'SAN SALVADOR DE QUIJE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('051105', 'AYACUCHO', 'SUCRE', 'PAICO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('051106', 'AYACUCHO', 'SUCRE', 'SANTIAGO DE PAUCARAY', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('051107', 'AYACUCHO', 'SUCRE', 'SAN PEDRO DE LARCAY', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('051108', 'AYACUCHO', 'SUCRE', 'SORAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('051109', 'AYACUCHO', 'SUCRE', 'HUACAÑA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('051110', 'AYACUCHO', 'SUCRE', 'CHILCAYOC', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('051111', 'AYACUCHO', 'SUCRE', 'MORCOLLA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060101', 'CAJAMARCA', 'CAJAMARCA', 'CAJAMARCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060102', 'CAJAMARCA', 'CAJAMARCA', 'ASUNCION', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060103', 'CAJAMARCA', 'CAJAMARCA', 'COSPAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060104', 'CAJAMARCA', 'CAJAMARCA', 'CHETILLA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060105', 'CAJAMARCA', 'CAJAMARCA', 'ENCAÑADA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060106', 'CAJAMARCA', 'CAJAMARCA', 'JESUS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060107', 'CAJAMARCA', 'CAJAMARCA', 'LOS BAÑOS DEL INCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060108', 'CAJAMARCA', 'CAJAMARCA', 'LLACANORA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060109', 'CAJAMARCA', 'CAJAMARCA', 'MAGDALENA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060110', 'CAJAMARCA', 'CAJAMARCA', 'MATARA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060111', 'CAJAMARCA', 'CAJAMARCA', 'NAMORA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060112', 'CAJAMARCA', 'CAJAMARCA', 'SAN JUAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060201', 'CAJAMARCA', 'CAJABAMBA', 'CAJABAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060202', 'CAJAMARCA', 'CAJABAMBA', 'CACHACHI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060203', 'CAJAMARCA', 'CAJABAMBA', 'CONDEBAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060205', 'CAJAMARCA', 'CAJABAMBA', 'SITACOCHA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060301', 'CAJAMARCA', 'CELENDIN', 'CELENDIN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060302', 'CAJAMARCA', 'CELENDIN', 'CORTEGANA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060303', 'CAJAMARCA', 'CELENDIN', 'CHUMUCH', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060304', 'CAJAMARCA', 'CELENDIN', 'HUASMIN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060305', 'CAJAMARCA', 'CELENDIN', 'JORGE CHAVEZ', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060306', 'CAJAMARCA', 'CELENDIN', 'JOSE GALVEZ', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060307', 'CAJAMARCA', 'CELENDIN', 'MIGUEL IGLESIAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060308', 'CAJAMARCA', 'CELENDIN', 'OXAMARCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060309', 'CAJAMARCA', 'CELENDIN', 'SOROCHUCO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060310', 'CAJAMARCA', 'CELENDIN', 'SUCRE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060311', 'CAJAMARCA', 'CELENDIN', 'UTCO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060312', 'CAJAMARCA', 'CELENDIN', 'LA LIBERTAD DE PALLAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060401', 'CAJAMARCA', 'CONTUMAZA', 'CONTUMAZA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060403', 'CAJAMARCA', 'CONTUMAZA', 'CHILETE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060404', 'CAJAMARCA', 'CONTUMAZA', 'GUZMANGO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060405', 'CAJAMARCA', 'CONTUMAZA', 'SAN BENITO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060406', 'CAJAMARCA', 'CONTUMAZA', 'CUPISNIQUE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060407', 'CAJAMARCA', 'CONTUMAZA', 'TANTARICA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060408', 'CAJAMARCA', 'CONTUMAZA', 'YONAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060409', 'CAJAMARCA', 'CONTUMAZA', 'SANTA CRUZ DE TOLED', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060501', 'CAJAMARCA', 'CUTERVO', 'CUTERVO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060502', 'CAJAMARCA', 'CUTERVO', 'CALLAYUC', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060503', 'CAJAMARCA', 'CUTERVO', 'CUJILLO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060504', 'CAJAMARCA', 'CUTERVO', 'CHOROS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060505', 'CAJAMARCA', 'CUTERVO', 'LA RAMADA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060506', 'CAJAMARCA', 'CUTERVO', 'PIMPINGOS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060507', 'CAJAMARCA', 'CUTERVO', 'QUEROCOTILLO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060508', 'CAJAMARCA', 'CUTERVO', 'SAN ANDRES DE CUTERVO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060509', 'CAJAMARCA', 'CUTERVO', 'SAN JUAN DE CUTERVO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060510', 'CAJAMARCA', 'CUTERVO', 'SAN LUIS DE LUCMA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060511', 'CAJAMARCA', 'CUTERVO', 'SANTA CRUZ', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060512', 'CAJAMARCA', 'CUTERVO', 'SANTO DOMINGO DE LA CAPILLA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060513', 'CAJAMARCA', 'CUTERVO', 'SANTO TOMAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060514', 'CAJAMARCA', 'CUTERVO', 'SOCOTA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060515', 'CAJAMARCA', 'CUTERVO', 'TORIBIO CASANOVA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060601', 'CAJAMARCA', 'CHOTA', 'CHOTA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060602', 'CAJAMARCA', 'CHOTA', 'ANGUIA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060603', 'CAJAMARCA', 'CHOTA', 'COCHABAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060604', 'CAJAMARCA', 'CHOTA', 'CONCHAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060605', 'CAJAMARCA', 'CHOTA', 'CHADIN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060606', 'CAJAMARCA', 'CHOTA', 'CHIGUIRIP', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060607', 'CAJAMARCA', 'CHOTA', 'CHIMBAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060608', 'CAJAMARCA', 'CHOTA', 'HUAMBOS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060609', 'CAJAMARCA', 'CHOTA', 'LAJAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060610', 'CAJAMARCA', 'CHOTA', 'LLAMA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060611', 'CAJAMARCA', 'CHOTA', 'MIRACOSTA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060612', 'CAJAMARCA', 'CHOTA', 'PACCHA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060613', 'CAJAMARCA', 'CHOTA', 'PION', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060614', 'CAJAMARCA', 'CHOTA', 'QUEROCOTO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060615', 'CAJAMARCA', 'CHOTA', 'TACABAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060616', 'CAJAMARCA', 'CHOTA', 'TOCMOCHE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060617', 'CAJAMARCA', 'CHOTA', 'SAN JUAN DE LICUPIS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060618', 'CAJAMARCA', 'CHOTA', 'CHOROPAMPA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060619', 'CAJAMARCA', 'CHOTA', 'CHALAMARCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060701', 'CAJAMARCA', 'HUALGAYOC', 'BAMBAMARCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060702', 'CAJAMARCA', 'HUALGAYOC', 'CHUGUR', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060703', 'CAJAMARCA', 'HUALGAYOC', 'HUALGAYOC', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060801', 'CAJAMARCA', 'JAEN', 'JAEN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060802', 'CAJAMARCA', 'JAEN', 'BELLAVISTA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060803', 'CAJAMARCA', 'JAEN', 'COLASAY', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060804', 'CAJAMARCA', 'JAEN', 'CHONTALI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060805', 'CAJAMARCA', 'JAEN', 'POMAHUACA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060806', 'CAJAMARCA', 'JAEN', 'PUCARA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060807', 'CAJAMARCA', 'JAEN', 'SALLIQUE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060808', 'CAJAMARCA', 'JAEN', 'SAN FELIPE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060809', 'CAJAMARCA', 'JAEN', 'SAN JOSE DEL ALTO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060810', 'CAJAMARCA', 'JAEN', 'SANTA ROSA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060811', 'CAJAMARCA', 'JAEN', 'LAS PIRIAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060812', 'CAJAMARCA', 'JAEN', 'HUABAL', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060901', 'CAJAMARCA', 'SANTA CRUZ', 'SANTA CRUZ', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060902', 'CAJAMARCA', 'SANTA CRUZ', 'CATACHE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060903', 'CAJAMARCA', 'SANTA CRUZ', 'CHANCAYBAÑOS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060904', 'CAJAMARCA', 'SANTA CRUZ', 'LA ESPERANZA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060905', 'CAJAMARCA', 'SANTA CRUZ', 'NINABAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060906', 'CAJAMARCA', 'SANTA CRUZ', 'PULAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060907', 'CAJAMARCA', 'SANTA CRUZ', 'SEXI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060908', 'CAJAMARCA', 'SANTA CRUZ', 'UTICYACU', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060909', 'CAJAMARCA', 'SANTA CRUZ', 'YAUYUCAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060910', 'CAJAMARCA', 'SANTA CRUZ', 'ANDABAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('060911', 'CAJAMARCA', 'SANTA CRUZ', 'SAUCEPAMPA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('061001', 'CAJAMARCA', 'SAN MIGUEL', 'SAN MIGUEL', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('061002', 'CAJAMARCA', 'SAN MIGUEL', 'CALQUIS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('061003', 'CAJAMARCA', 'SAN MIGUEL', 'LA FLORIDA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('061004', 'CAJAMARCA', 'SAN MIGUEL', 'LLAPA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('061005', 'CAJAMARCA', 'SAN MIGUEL', 'NANCHOC', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('061006', 'CAJAMARCA', 'SAN MIGUEL', 'NIEPOS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('061007', 'CAJAMARCA', 'SAN MIGUEL', 'SAN GREGORIO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('061008', 'CAJAMARCA', 'SAN MIGUEL', 'SAN SILVESTRE DE COCHAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('061009', 'CAJAMARCA', 'SAN MIGUEL', 'EL PRADO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('061010', 'CAJAMARCA', 'SAN MIGUEL', 'UNION AGUA BLANCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('061011', 'CAJAMARCA', 'SAN MIGUEL', 'TONGOD', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('061012', 'CAJAMARCA', 'SAN MIGUEL', 'CATILLUC', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('061013', 'CAJAMARCA', 'SAN MIGUEL', 'BOLIVAR', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('061101', 'CAJAMARCA', 'SAN IGNACIO', 'SAN IGNACIO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('061102', 'CAJAMARCA', 'SAN IGNACIO', 'CHIRINOS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('061103', 'CAJAMARCA', 'SAN IGNACIO', 'HUARANGO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('061104', 'CAJAMARCA', 'SAN IGNACIO', 'NAMBALLE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('061105', 'CAJAMARCA', 'SAN IGNACIO', 'LA COIPA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('061106', 'CAJAMARCA', 'SAN IGNACIO', 'SAN JOSE DE LOURDES', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('061107', 'CAJAMARCA', 'SAN IGNACIO', 'TABACONAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('061201', 'CAJAMARCA', 'SAN MARCOS', 'PEDRO GALVEZ', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('061202', 'CAJAMARCA', 'SAN MARCOS', 'ICHOCAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('061203', 'CAJAMARCA', 'SAN MARCOS', 'GREGORIO PITA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('061204', 'CAJAMARCA', 'SAN MARCOS', 'JOSE MANUEL QUIROZ', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('061205', 'CAJAMARCA', 'SAN MARCOS', 'EDUARDO VILLANUEVA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('061206', 'CAJAMARCA', 'SAN MARCOS', 'JOSE SABOGAL', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('061207', 'CAJAMARCA', 'SAN MARCOS', 'CHANCAY', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('061301', 'CAJAMARCA', 'SAN PABLO', 'SAN PABLO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('061302', 'CAJAMARCA', 'SAN PABLO', 'SAN BERNARDINO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('061303', 'CAJAMARCA', 'SAN PABLO', 'SAN LUIS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('061304', 'CAJAMARCA', 'SAN PABLO', 'TUMBADEN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070101', 'CUSCO', 'CUSCO', 'CUSCO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070102', 'CUSCO', 'CUSCO', 'CCORCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070103', 'CUSCO', 'CUSCO', 'POROY', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070104', 'CUSCO', 'CUSCO', 'SAN JERONIMO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070105', 'CUSCO', 'CUSCO', 'SAN SEBASTIAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070106', 'CUSCO', 'CUSCO', 'SANTIAGO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070107', 'CUSCO', 'CUSCO', 'SAYLLA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070108', 'CUSCO', 'CUSCO', 'WANCHAQ', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070201', 'CUSCO', 'ACOMAYO', 'ACOMAYO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070202', 'CUSCO', 'ACOMAYO', 'ACOPIA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070203', 'CUSCO', 'ACOMAYO', 'ACOS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070204', 'CUSCO', 'ACOMAYO', 'POMACANCHI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070205', 'CUSCO', 'ACOMAYO', 'RONDOCAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070206', 'CUSCO', 'ACOMAYO', 'SANGARARA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070207', 'CUSCO', 'ACOMAYO', 'MOSOC LLACTA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070301', 'CUSCO', 'ANTA', 'ANTA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070302', 'CUSCO', 'ANTA', 'CHINCHAYPUJIO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070303', 'CUSCO', 'ANTA', 'HUAROCONDO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070304', 'CUSCO', 'ANTA', 'LIMATAMBO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070305', 'CUSCO', 'ANTA', 'MOLLEPATA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070306', 'CUSCO', 'ANTA', 'PUCYURA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070307', 'CUSCO', 'ANTA', 'ZURITE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070308', 'CUSCO', 'ANTA', 'CACHIMAYO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070309', 'CUSCO', 'ANTA', 'ANCAHUASI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070401', 'CUSCO', 'CALCA', 'CALCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070402', 'CUSCO', 'CALCA', 'COYA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070403', 'CUSCO', 'CALCA', 'LAMAY', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070404', 'CUSCO', 'CALCA', 'LARES', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070405', 'CUSCO', 'CALCA', 'PISAC', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070406', 'CUSCO', 'CALCA', 'SAN SALVADOR', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070407', 'CUSCO', 'CALCA', 'TARAY', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070408', 'CUSCO', 'CALCA', 'YANATILE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070501', 'CUSCO', 'CANAS', 'YANAOCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070502', 'CUSCO', 'CANAS', 'CHECCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070503', 'CUSCO', 'CANAS', 'KUNTURKANKI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070504', 'CUSCO', 'CANAS', 'LANGUI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070505', 'CUSCO', 'CANAS', 'LAYO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070506', 'CUSCO', 'CANAS', 'PAMPAMARCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070507', 'CUSCO', 'CANAS', 'QUEHUE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070508', 'CUSCO', 'CANAS', 'TUPAC AMARU', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070601', 'CUSCO', 'CANCHIS', 'SICUANI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070602', 'CUSCO', 'CANCHIS', 'COMBAPATA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070603', 'CUSCO', 'CANCHIS', 'CHECACUPE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070604', 'CUSCO', 'CANCHIS', 'MARANGANI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070605', 'CUSCO', 'CANCHIS', 'PITUMARCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070606', 'CUSCO', 'CANCHIS', 'SAN PABLO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070607', 'CUSCO', 'CANCHIS', 'SAN PEDRO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070608', 'CUSCO', 'CANCHIS', 'TINTA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070701', 'CUSCO', 'CHUMBIVILCAS', 'SANTO TOMAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070702', 'CUSCO', 'CHUMBIVILCAS', 'CAPACMARCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070703', 'CUSCO', 'CHUMBIVILCAS', 'COLQUEMARCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070704', 'CUSCO', 'CHUMBIVILCAS', 'CHAMACA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070705', 'CUSCO', 'CHUMBIVILCAS', 'LIVITACA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070706', 'CUSCO', 'CHUMBIVILCAS', 'LLUSCO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070707', 'CUSCO', 'CHUMBIVILCAS', 'QUIÑOTA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070708', 'CUSCO', 'CHUMBIVILCAS', 'VELILLE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070801', 'CUSCO', 'ESPINAR', 'ESPINAR', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070802', 'CUSCO', 'ESPINAR', 'CONDOROMA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070803', 'CUSCO', 'ESPINAR', 'COPORAQUE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070804', 'CUSCO', 'ESPINAR', 'OCORURO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070805', 'CUSCO', 'ESPINAR', 'PALLPATA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070806', 'CUSCO', 'ESPINAR', 'PICHIGUA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070807', 'CUSCO', 'ESPINAR', 'SUYCKUTAMBO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070808', 'CUSCO', 'ESPINAR', 'ALTO PICHIGUA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070901', 'CUSCO', 'LA CONVENCION', 'SANTA ANA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070902', 'CUSCO', 'LA CONVENCION', 'ECHARATE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070903', 'CUSCO', 'LA CONVENCION', 'HUAYOPATA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070904', 'CUSCO', 'LA CONVENCION', 'MARANURA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070905', 'CUSCO', 'LA CONVENCION', 'OCOBAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070906', 'CUSCO', 'LA CONVENCION', 'SANTA TERESA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070907', 'CUSCO', 'LA CONVENCION', 'VILCABAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070908', 'CUSCO', 'LA CONVENCION', 'QUELLOUNO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070909', 'CUSCO', 'LA CONVENCION', 'KIMBIRI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('070910', 'CUSCO', 'LA CONVENCION', 'PICHARI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('071001', 'CUSCO', 'PARURO', 'PARURO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('071002', 'CUSCO', 'PARURO', 'ACCHA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('071003', 'CUSCO', 'PARURO', 'CCAPI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('071004', 'CUSCO', 'PARURO', 'COLCHA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('071005', 'CUSCO', 'PARURO', 'HUANOQUITE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('071006', 'CUSCO', 'PARURO', 'OMACHA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('071007', 'CUSCO', 'PARURO', 'YAURISQUE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('071008', 'CUSCO', 'PARURO', 'PACCARITAMBO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('071009', 'CUSCO', 'PARURO', 'PILLPINTO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('071101', 'CUSCO', 'PAUCARTAMBO', 'PAUCARTAMBO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('071102', 'CUSCO', 'PAUCARTAMBO', 'CAICAY', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('071103', 'CUSCO', 'PAUCARTAMBO', 'COLQUEPATA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('071104', 'CUSCO', 'PAUCARTAMBO', 'CHALLABAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('071105', 'CUSCO', 'PAUCARTAMBO', 'KOSÑIPATA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('071106', 'CUSCO', 'PAUCARTAMBO', 'HUANCARANI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('071201', 'CUSCO', 'QUISPICANCHI', 'URCOS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('071202', 'CUSCO', 'QUISPICANCHI', 'ANDAHUAYLILLAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('071203', 'CUSCO', 'QUISPICANCHI', 'CAMANTI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('071204', 'CUSCO', 'QUISPICANCHI', 'CCARHUAYO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('071205', 'CUSCO', 'QUISPICANCHI', 'CCATCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('071206', 'CUSCO', 'QUISPICANCHI', 'CUSIPATA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('071207', 'CUSCO', 'QUISPICANCHI', 'HUARO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('071208', 'CUSCO', 'QUISPICANCHI', 'LUCRE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('071209', 'CUSCO', 'QUISPICANCHI', 'MARCAPATA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('071210', 'CUSCO', 'QUISPICANCHI', 'OCONGATE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('071211', 'CUSCO', 'QUISPICANCHI', 'OROPESA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('071212', 'CUSCO', 'QUISPICANCHI', 'QUIQUIJANA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('071301', 'CUSCO', 'URUBAMBA', 'URUBAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('071302', 'CUSCO', 'URUBAMBA', 'CHINCHERO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('071303', 'CUSCO', 'URUBAMBA', 'HUAYLLABAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('071304', 'CUSCO', 'URUBAMBA', 'MACHUPICCHU', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('071305', 'CUSCO', 'URUBAMBA', 'MARAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('071306', 'CUSCO', 'URUBAMBA', 'OLLANTAYTAMBO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('071307', 'CUSCO', 'URUBAMBA', 'YUCAY', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080101', 'HUANCAVELICA', 'HUANCAVELICA', 'HUANCAVELICA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080102', 'HUANCAVELICA', 'HUANCAVELICA', 'ACOBAMBILLA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080103', 'HUANCAVELICA', 'HUANCAVELICA', 'ACORIA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080104', 'HUANCAVELICA', 'HUANCAVELICA', 'CONAYCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080105', 'HUANCAVELICA', 'HUANCAVELICA', 'CUENCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080106', 'HUANCAVELICA', 'HUANCAVELICA', 'HUACHOCOLPA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080108', 'HUANCAVELICA', 'HUANCAVELICA', 'HUAYLLAHUARA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080109', 'HUANCAVELICA', 'HUANCAVELICA', 'IZCUCHACA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080110', 'HUANCAVELICA', 'HUANCAVELICA', 'LARIA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080111', 'HUANCAVELICA', 'HUANCAVELICA', 'MANTA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080112', 'HUANCAVELICA', 'HUANCAVELICA', 'MARISCAL CACERES', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080113', 'HUANCAVELICA', 'HUANCAVELICA', 'MOYA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080114', 'HUANCAVELICA', 'HUANCAVELICA', 'NUEVO OCCORO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080115', 'HUANCAVELICA', 'HUANCAVELICA', 'PALCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080116', 'HUANCAVELICA', 'HUANCAVELICA', 'PILCHACA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080117', 'HUANCAVELICA', 'HUANCAVELICA', 'VILCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080118', 'HUANCAVELICA', 'HUANCAVELICA', 'YAULI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080119', 'HUANCAVELICA', 'HUANCAVELICA', 'ASCENSION', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080120', 'HUANCAVELICA', 'HUANCAVELICA', 'HUANDO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080201', 'HUANCAVELICA', 'ACOBAMBA', 'ACOBAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080202', 'HUANCAVELICA', 'ACOBAMBA', 'ANTA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080203', 'HUANCAVELICA', 'ACOBAMBA', 'ANDABAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080204', 'HUANCAVELICA', 'ACOBAMBA', 'CAJA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080205', 'HUANCAVELICA', 'ACOBAMBA', 'MARCAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080206', 'HUANCAVELICA', 'ACOBAMBA', 'PAUCARA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080207', 'HUANCAVELICA', 'ACOBAMBA', 'POMACOCHA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080208', 'HUANCAVELICA', 'ACOBAMBA', 'ROSARIO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080301', 'HUANCAVELICA', 'ANGARAES', 'LIRCAY', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080302', 'HUANCAVELICA', 'ANGARAES', 'ANCHONGA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080303', 'HUANCAVELICA', 'ANGARAES', 'CALLANMARCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080304', 'HUANCAVELICA', 'ANGARAES', 'CONGALLA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080305', 'HUANCAVELICA', 'ANGARAES', 'CHINCHO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080306', 'HUANCAVELICA', 'ANGARAES', 'HUALLAY-GRANDE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080307', 'HUANCAVELICA', 'ANGARAES', 'HUANCA-HUANCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080308', 'HUANCAVELICA', 'ANGARAES', 'JULCAMARCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080309', 'HUANCAVELICA', 'ANGARAES', 'SAN ANTONIO DE ANTAPARCO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080310', 'HUANCAVELICA', 'ANGARAES', 'SANTO TOMAS DE PATA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080311', 'HUANCAVELICA', 'ANGARAES', 'SECCLLA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080312', 'HUANCAVELICA', 'ANGARAES', 'CCOCHACCASA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080401', 'HUANCAVELICA', 'CASTROVIRREYNA', 'CASTROVIRREYNA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080402', 'HUANCAVELICA', 'CASTROVIRREYNA', 'ARMA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080403', 'HUANCAVELICA', 'CASTROVIRREYNA', 'AURAHUA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080405', 'HUANCAVELICA', 'CASTROVIRREYNA', 'CAPILLAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080406', 'HUANCAVELICA', 'CASTROVIRREYNA', 'COCAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080408', 'HUANCAVELICA', 'CASTROVIRREYNA', 'CHUPAMARCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080409', 'HUANCAVELICA', 'CASTROVIRREYNA', 'HUACHOS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080410', 'HUANCAVELICA', 'CASTROVIRREYNA', 'HUAMATAMBO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080414', 'HUANCAVELICA', 'CASTROVIRREYNA', 'MOLLEPAMPA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080422', 'HUANCAVELICA', 'CASTROVIRREYNA', 'SAN JUAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080427', 'HUANCAVELICA', 'CASTROVIRREYNA', 'TANTARA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080428', 'HUANCAVELICA', 'CASTROVIRREYNA', 'TICRAPO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080429', 'HUANCAVELICA', 'CASTROVIRREYNA', 'SANTA ANA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080501', 'HUANCAVELICA', 'TAYACAJA', 'PAMPAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080502', 'HUANCAVELICA', 'TAYACAJA', 'ACOSTAMBO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080503', 'HUANCAVELICA', 'TAYACAJA', 'ACRAQUIA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080504', 'HUANCAVELICA', 'TAYACAJA', 'AHUAYCHA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080506', 'HUANCAVELICA', 'TAYACAJA', 'COLCABAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080509', 'HUANCAVELICA', 'TAYACAJA', 'DANIEL HERNANDEZ', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080511', 'HUANCAVELICA', 'TAYACAJA', 'HUACHOCOLPA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080512', 'HUANCAVELICA', 'TAYACAJA', 'HUARIBAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080515', 'HUANCAVELICA', 'TAYACAJA', 'ÑAHUIMPUQUIO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080517', 'HUANCAVELICA', 'TAYACAJA', 'PAZOS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080518', 'HUANCAVELICA', 'TAYACAJA', 'QUISHUAR', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080519', 'HUANCAVELICA', 'TAYACAJA', 'SALCABAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080520', 'HUANCAVELICA', 'TAYACAJA', 'SAN MARCOS DE ROCCHAC', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080523', 'HUANCAVELICA', 'TAYACAJA', 'SURCUBAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080525', 'HUANCAVELICA', 'TAYACAJA', 'TINTAY PUNCU', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080526', 'HUANCAVELICA', 'TAYACAJA', 'SALCAHUASI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080601', 'HUANCAVELICA', 'HUAYTARA', 'AYAVI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080602', 'HUANCAVELICA', 'HUAYTARA', 'CORDOVA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080603', 'HUANCAVELICA', 'HUAYTARA', 'HUAYACUNDO ARMA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080604', 'HUANCAVELICA', 'HUAYTARA', 'HUAYTARA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080605', 'HUANCAVELICA', 'HUAYTARA', 'LARAMARCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080606', 'HUANCAVELICA', 'HUAYTARA', 'OCOYO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080607', 'HUANCAVELICA', 'HUAYTARA', 'PILPICHACA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080608', 'HUANCAVELICA', 'HUAYTARA', 'QUERCO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080609', 'HUANCAVELICA', 'HUAYTARA', 'QUITO ARMA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080610', 'HUANCAVELICA', 'HUAYTARA', 'SAN ANTONIO DE CUSICANCHA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080611', 'HUANCAVELICA', 'HUAYTARA', 'SAN FRANCISCO DE SANGAYAICO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080612', 'HUANCAVELICA', 'HUAYTARA', 'SAN ISIDRO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080613', 'HUANCAVELICA', 'HUAYTARA', 'SANTIAGO DE CHOCORVOS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080614', 'HUANCAVELICA', 'HUAYTARA', 'SANTIAGO DE QUIRAHUARA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080615', 'HUANCAVELICA', 'HUAYTARA', 'SANTO DOMINGO DE CAPILLAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080616', 'HUANCAVELICA', 'HUAYTARA', 'TAMBO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080701', 'HUANCAVELICA', 'CHURCAMPA', 'CHURCAMPA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080702', 'HUANCAVELICA', 'CHURCAMPA', 'ANCO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080703', 'HUANCAVELICA', 'CHURCAMPA', 'CHINCHIHUASI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080704', 'HUANCAVELICA', 'CHURCAMPA', 'EL CARMEN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080705', 'HUANCAVELICA', 'CHURCAMPA', 'LA MERCED', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080706', 'HUANCAVELICA', 'CHURCAMPA', 'LOCROJA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080707', 'HUANCAVELICA', 'CHURCAMPA', 'PAUCARBAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080708', 'HUANCAVELICA', 'CHURCAMPA', 'SAN MIGUEL DE MAYOCC', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080709', 'HUANCAVELICA', 'CHURCAMPA', 'SAN PEDRO DE CORIS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080710', 'HUANCAVELICA', 'CHURCAMPA', 'PACHAMARCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('080711', 'HUANCAVELICA', 'CHURCAMPA', 'COSME', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090101', 'HUANUCO', 'HUANUCO', 'HUANUCO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090102', 'HUANUCO', 'HUANUCO', 'CHINCHAO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090103', 'HUANUCO', 'HUANUCO', 'CHURUBAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090104', 'HUANUCO', 'HUANUCO', 'MARGOS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090105', 'HUANUCO', 'HUANUCO', 'QUISQUI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090106', 'HUANUCO', 'HUANUCO', 'SAN FRANCISCO DE CAYRAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090107', 'HUANUCO', 'HUANUCO', 'SAN PEDRO DE CHAULAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090108', 'HUANUCO', 'HUANUCO', 'SANTA MARIA DEL VALLE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090109', 'HUANUCO', 'HUANUCO', 'YARUMAYO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090110', 'HUANUCO', 'HUANUCO', 'AMARILIS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090111', 'HUANUCO', 'HUANUCO', 'PILLCO MARCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090112', 'HUANUCO', 'HUANUCO', 'YACUS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090201', 'HUANUCO', 'AMBO', 'AMBO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090202', 'HUANUCO', 'AMBO', 'CAYNA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090203', 'HUANUCO', 'AMBO', 'COLPAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090204', 'HUANUCO', 'AMBO', 'CONCHAMARCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090205', 'HUANUCO', 'AMBO', 'HUACAR', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090206', 'HUANUCO', 'AMBO', 'SAN FRANCISCO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090207', 'HUANUCO', 'AMBO', 'SAN RAFAEL', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090208', 'HUANUCO', 'AMBO', 'TOMAY-KICHWA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090301', 'HUANUCO', 'DOS DE MAYO', 'LA UNION', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090307', 'HUANUCO', 'DOS DE MAYO', 'CHUQUIS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090312', 'HUANUCO', 'DOS DE MAYO', 'MARIAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090314', 'HUANUCO', 'DOS DE MAYO', 'PACHAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090316', 'HUANUCO', 'DOS DE MAYO', 'QUIVILLA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090317', 'HUANUCO', 'DOS DE MAYO', 'RIPAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090321', 'HUANUCO', 'DOS DE MAYO', 'SHUNQUI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090322', 'HUANUCO', 'DOS DE MAYO', 'SILLAPATA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090323', 'HUANUCO', 'DOS DE MAYO', 'YANAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090401', 'HUANUCO', 'HUAMALIES', 'LLATA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090402', 'HUANUCO', 'HUAMALIES', 'ARANCAY', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090403', 'HUANUCO', 'HUAMALIES', 'CHAVIN DE PARIARCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090404', 'HUANUCO', 'HUAMALIES', 'JACAS GRANDE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090405', 'HUANUCO', 'HUAMALIES', 'JIRCAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090406', 'HUANUCO', 'HUAMALIES', 'MIRAFLORES', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090407', 'HUANUCO', 'HUAMALIES', 'MONZON', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090408', 'HUANUCO', 'HUAMALIES', 'PUNCHAO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090409', 'HUANUCO', 'HUAMALIES', 'PUÑOS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090410', 'HUANUCO', 'HUAMALIES', 'SINGA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090411', 'HUANUCO', 'HUAMALIES', 'TANTAMAYO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090501', 'HUANUCO', 'MARAÑON', 'HUACRACHUCO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090502', 'HUANUCO', 'MARAÑON', 'CHOLON', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090505', 'HUANUCO', 'MARAÑON', 'SAN BUENAVENTURA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090601', 'HUANUCO', 'LEONCIO PRADO', 'RUPA-RUPA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090602', 'HUANUCO', 'LEONCIO PRADO', 'DANIEL ALOMIA ROBLES', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090603', 'HUANUCO', 'LEONCIO PRADO', 'HERMILIO VALDIZAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090604', 'HUANUCO', 'LEONCIO PRADO', 'LUYANDO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090605', 'HUANUCO', 'LEONCIO PRADO', 'MARIANO DAMASO BERAUN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090606', 'HUANUCO', 'LEONCIO PRADO', 'JOSE CRESPO Y CASTILLO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090701', 'HUANUCO', 'PACHITEA', 'PANAO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090702', 'HUANUCO', 'PACHITEA', 'CHAGLLA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090704', 'HUANUCO', 'PACHITEA', 'MOLINO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090706', 'HUANUCO', 'PACHITEA', 'UMARI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090801', 'HUANUCO', 'PUERTO INCA', 'HONORIA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090802', 'HUANUCO', 'PUERTO INCA', 'PUERTO INCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090803', 'HUANUCO', 'PUERTO INCA', 'CODO DEL POZUZO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090804', 'HUANUCO', 'PUERTO INCA', 'TOURNAVISTA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090805', 'HUANUCO', 'PUERTO INCA', 'YUYAPICHIS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090901', 'HUANUCO', 'HUACAYBAMBA', 'HUACAYBAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090902', 'HUANUCO', 'HUACAYBAMBA', 'PINRA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090903', 'HUANUCO', 'HUACAYBAMBA', 'CANCHABAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('090904', 'HUANUCO', 'HUACAYBAMBA', 'COCHABAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('091001', 'HUANUCO', 'LAURICOCHA', 'JESUS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('091002', 'HUANUCO', 'LAURICOCHA', 'BAÑOS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('091003', 'HUANUCO', 'LAURICOCHA', 'SAN FRANCISCO DE ASIS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('091004', 'HUANUCO', 'LAURICOCHA', 'QUEROPALCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('091005', 'HUANUCO', 'LAURICOCHA', 'SAN MIGUEL DE CAURI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('091006', 'HUANUCO', 'LAURICOCHA', 'RONDOS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('091007', 'HUANUCO', 'LAURICOCHA', 'JIVIA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('091101', 'HUANUCO', 'YAROWILCA', 'CHAVINILLO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('091102', 'HUANUCO', 'YAROWILCA', 'APARICIO POMARES', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('091103', 'HUANUCO', 'YAROWILCA', 'CAHUAC', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('091104', 'HUANUCO', 'YAROWILCA', 'CHACABAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('091105', 'HUANUCO', 'YAROWILCA', 'JACAS CHICO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('091106', 'HUANUCO', 'YAROWILCA', 'OBAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('091107', 'HUANUCO', 'YAROWILCA', 'PAMPAMARCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('091108', 'HUANUCO', 'YAROWILCA', 'CHORAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('100101', 'ICA', 'ICA', 'ICA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('100102', 'ICA', 'ICA', 'LA TINGUIÑA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('100103', 'ICA', 'ICA', 'LOS AQUIJES', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('100104', 'ICA', 'ICA', 'PARCONA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('100105', 'ICA', 'ICA', 'PUEBLO NUEVO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('100106', 'ICA', 'ICA', 'SALAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('100107', 'ICA', 'ICA', 'SAN JOSE DE LOS MOLINOS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('100108', 'ICA', 'ICA', 'SAN JUAN BAUTISTA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('100109', 'ICA', 'ICA', 'SANTIAGO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('100110', 'ICA', 'ICA', 'SUBTANJALLA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('100111', 'ICA', 'ICA', 'YAUCA DEL ROSARIO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('100112', 'ICA', 'ICA', 'TATE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('100113', 'ICA', 'ICA', 'PACHACUTEC', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('100114', 'ICA', 'ICA', 'OCUCAJE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('100201', 'ICA', 'CHINCHA', 'CHINCHA ALTA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('100202', 'ICA', 'CHINCHA', 'CHAVIN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('100203', 'ICA', 'CHINCHA', 'CHINCHA BAJA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('100204', 'ICA', 'CHINCHA', 'EL CARMEN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('100205', 'ICA', 'CHINCHA', 'GROCIO PRADO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('100206', 'ICA', 'CHINCHA', 'SAN PEDRO DE HUACARPANA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('100207', 'ICA', 'CHINCHA', 'SUNAMPE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('100208', 'ICA', 'CHINCHA', 'TAMBO DE MORA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('100209', 'ICA', 'CHINCHA', 'ALTO LARAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('100210', 'ICA', 'CHINCHA', 'PUEBLO NUEVO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('100211', 'ICA', 'CHINCHA', 'SAN JUAN DE YANAC', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('100301', 'ICA', 'NAZCA', 'NAZCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('100302', 'ICA', 'NAZCA', 'CHANGUILLO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('100303', 'ICA', 'NAZCA', 'EL INGENIO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('100304', 'ICA', 'NAZCA', 'MARCONA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('100305', 'ICA', 'NAZCA', 'VISTA ALEGRE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('100401', 'ICA', 'PISCO', 'PISCO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('100402', 'ICA', 'PISCO', 'HUANCANO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('100403', 'ICA', 'PISCO', 'HUMAY', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('100404', 'ICA', 'PISCO', 'INDEPENDENCIA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('100405', 'ICA', 'PISCO', 'PARACAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('100406', 'ICA', 'PISCO', 'SAN ANDRES', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('100407', 'ICA', 'PISCO', 'SAN CLEMENTE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('100408', 'ICA', 'PISCO', 'TUPAC AMARU INCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('100501', 'ICA', 'PALPA', 'PALPA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('100502', 'ICA', 'PALPA', 'LLIPATA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('100503', 'ICA', 'PALPA', 'RIO GRANDE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('100504', 'ICA', 'PALPA', 'SANTA CRUZ', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('100505', 'ICA', 'PALPA', 'TIBILLO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110101', 'JUNIN', 'HUANCAYO', 'HUANCAYO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110103', 'JUNIN', 'HUANCAYO', 'CARHUACALLANGA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110104', 'JUNIN', 'HUANCAYO', 'COLCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110105', 'JUNIN', 'HUANCAYO', 'CULLHUAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110106', 'JUNIN', 'HUANCAYO', 'CHACAPAMPA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110107', 'JUNIN', 'HUANCAYO', 'CHICCHE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110108', 'JUNIN', 'HUANCAYO', 'CHILCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110109', 'JUNIN', 'HUANCAYO', 'CHONGOS ALTO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110112', 'JUNIN', 'HUANCAYO', 'CHUPURO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110113', 'JUNIN', 'HUANCAYO', 'EL TAMBO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110114', 'JUNIN', 'HUANCAYO', 'HUACRAPUQUIO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110116', 'JUNIN', 'HUANCAYO', 'HUALHUAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110118', 'JUNIN', 'HUANCAYO', 'HUANCAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110119', 'JUNIN', 'HUANCAYO', 'HUASICANCHA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110120', 'JUNIN', 'HUANCAYO', 'HUAYUCACHI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110121', 'JUNIN', 'HUANCAYO', 'INGENIO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110122', 'JUNIN', 'HUANCAYO', 'PARIAHUANCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110123', 'JUNIN', 'HUANCAYO', 'PILCOMAYO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110124', 'JUNIN', 'HUANCAYO', 'PUCARA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110125', 'JUNIN', 'HUANCAYO', 'QUICHUAY', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110126', 'JUNIN', 'HUANCAYO', 'QUILCAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110127', 'JUNIN', 'HUANCAYO', 'SAN AGUSTIN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110128', 'JUNIN', 'HUANCAYO', 'SAN JERONIMO DE TUNAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110131', 'JUNIN', 'HUANCAYO', 'SANTO DOMINGO DE ACOBAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110132', 'JUNIN', 'HUANCAYO', 'SAÑO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110133', 'JUNIN', 'HUANCAYO', 'SAPALLANGA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110134', 'JUNIN', 'HUANCAYO', 'SICAYA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110136', 'JUNIN', 'HUANCAYO', 'VIQUES', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110201', 'JUNIN', 'CONCEPCION', 'CONCEPCION', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110202', 'JUNIN', 'CONCEPCION', 'ACO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110203', 'JUNIN', 'CONCEPCION', 'ANDAMARCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110204', 'JUNIN', 'CONCEPCION', 'COMAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110205', 'JUNIN', 'CONCEPCION', 'COCHAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110206', 'JUNIN', 'CONCEPCION', 'CHAMBARA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110207', 'JUNIN', 'CONCEPCION', 'HEROINAS TOLEDO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110208', 'JUNIN', 'CONCEPCION', 'MANZANARES', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110209', 'JUNIN', 'CONCEPCION', 'MARISCAL CASTILLA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110210', 'JUNIN', 'CONCEPCION', 'MATAHUASI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110211', 'JUNIN', 'CONCEPCION', 'MITO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110212', 'JUNIN', 'CONCEPCION', 'NUEVE DE JULIO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110213', 'JUNIN', 'CONCEPCION', 'ORCOTUNA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110214', 'JUNIN', 'CONCEPCION', 'SANTA ROSA DE OCOPA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110215', 'JUNIN', 'CONCEPCION', 'SAN JOSE DE QUERO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110301', 'JUNIN', 'JAUJA', 'JAUJA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110302', 'JUNIN', 'JAUJA', 'ACOLLA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110303', 'JUNIN', 'JAUJA', 'APATA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110304', 'JUNIN', 'JAUJA', 'ATAURA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110305', 'JUNIN', 'JAUJA', 'CANCHAYLLO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110306', 'JUNIN', 'JAUJA', 'EL MANTARO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110307', 'JUNIN', 'JAUJA', 'HUAMALI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110308', 'JUNIN', 'JAUJA', 'HUARIPAMPA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110309', 'JUNIN', 'JAUJA', 'HUERTAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110310', 'JUNIN', 'JAUJA', 'JANJAILLO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110311', 'JUNIN', 'JAUJA', 'JULCAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110312', 'JUNIN', 'JAUJA', 'LEONOR ORDOÑEZ', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110313', 'JUNIN', 'JAUJA', 'LLOCLLAPAMPA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110314', 'JUNIN', 'JAUJA', 'MARCO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110315', 'JUNIN', 'JAUJA', 'MASMA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110316', 'JUNIN', 'JAUJA', 'MOLINOS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110317', 'JUNIN', 'JAUJA', 'MONOBAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110318', 'JUNIN', 'JAUJA', 'MUQUI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110319', 'JUNIN', 'JAUJA', 'MUQUIYAUYO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110320', 'JUNIN', 'JAUJA', 'PACA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110321', 'JUNIN', 'JAUJA', 'PACCHA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110322', 'JUNIN', 'JAUJA', 'PANCAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110323', 'JUNIN', 'JAUJA', 'PARCO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110324', 'JUNIN', 'JAUJA', 'POMACANCHA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110325', 'JUNIN', 'JAUJA', 'RICRAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110326', 'JUNIN', 'JAUJA', 'SAN LORENZO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110327', 'JUNIN', 'JAUJA', 'SAN PEDRO DE CHUNAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110328', 'JUNIN', 'JAUJA', 'SINCOS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110329', 'JUNIN', 'JAUJA', 'TUNAN MARCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110330', 'JUNIN', 'JAUJA', 'YAULI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110331', 'JUNIN', 'JAUJA', 'CURICACA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110332', 'JUNIN', 'JAUJA', 'MASMA CHICCHE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110333', 'JUNIN', 'JAUJA', 'SAUSA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110334', 'JUNIN', 'JAUJA', 'YAUYOS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110401', 'JUNIN', 'JUNIN', 'JUNIN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110402', 'JUNIN', 'JUNIN', 'CARHUAMAYO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110403', 'JUNIN', 'JUNIN', 'ONDORES', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110404', 'JUNIN', 'JUNIN', 'ULCUMAYO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110501', 'JUNIN', 'TARMA', 'TARMA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110502', 'JUNIN', 'TARMA', 'ACOBAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110503', 'JUNIN', 'TARMA', 'HUARICOLCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110504', 'JUNIN', 'TARMA', 'HUASAHUASI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110505', 'JUNIN', 'TARMA', 'LA UNION', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110506', 'JUNIN', 'TARMA', 'PALCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110507', 'JUNIN', 'TARMA', 'PALCAMAYO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110508', 'JUNIN', 'TARMA', 'SAN PEDRO DE CAJAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110509', 'JUNIN', 'TARMA', 'TAPO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110601', 'JUNIN', 'YAULI', 'LA OROYA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110602', 'JUNIN', 'YAULI', 'CHACAPALPA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110603', 'JUNIN', 'YAULI', 'HUAY HUAY', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110604', 'JUNIN', 'YAULI', 'MARCAPOMACOCHA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110605', 'JUNIN', 'YAULI', 'MOROCOCHA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110606', 'JUNIN', 'YAULI', 'PACCHA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110607', 'JUNIN', 'YAULI', 'SANTA BARBARA DE CARHUACAYAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110608', 'JUNIN', 'YAULI', 'SUITUCANCHA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110609', 'JUNIN', 'YAULI', 'YAULI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110610', 'JUNIN', 'YAULI', 'SANTA ROSA DE SACCO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110701', 'JUNIN', 'SATIPO', 'SATIPO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110702', 'JUNIN', 'SATIPO', 'COVIRIALI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110703', 'JUNIN', 'SATIPO', 'LLAYLLA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110704', 'JUNIN', 'SATIPO', 'MAZAMARI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110705', 'JUNIN', 'SATIPO', 'PAMPA HERMOSA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110706', 'JUNIN', 'SATIPO', 'PANGOA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110707', 'JUNIN', 'SATIPO', 'RIO NEGRO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110708', 'JUNIN', 'SATIPO', 'RIO TAMBO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110801', 'JUNIN', 'CHANCHAMAYO', 'CHANCHAMAYO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110802', 'JUNIN', 'CHANCHAMAYO', 'SAN RAMON', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110803', 'JUNIN', 'CHANCHAMAYO', 'VITOC', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110804', 'JUNIN', 'CHANCHAMAYO', 'SAN LUIS DE SHUARO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110805', 'JUNIN', 'CHANCHAMAYO', 'PICHANAQUI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110806', 'JUNIN', 'CHANCHAMAYO', 'PERENE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110901', 'JUNIN', 'CHUPACA', 'CHUPACA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110902', 'JUNIN', 'CHUPACA', 'AHUAC', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110903', 'JUNIN', 'CHUPACA', 'CHONGOS BAJO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110904', 'JUNIN', 'CHUPACA', 'HUACHAC', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110905', 'JUNIN', 'CHUPACA', 'HUAMANCACA CHICO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110906', 'JUNIN', 'CHUPACA', 'SAN JUAN DE YSCOS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110907', 'JUNIN', 'CHUPACA', 'SAN JUAN DE JARPA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110908', 'JUNIN', 'CHUPACA', 'TRES DE DICIEMBRE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('110909', 'JUNIN', 'CHUPACA', 'YANACANCHA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120101', 'LA LIBERTAD', 'TRUJILLO', 'TRUJILLO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120102', 'LA LIBERTAD', 'TRUJILLO', 'HUANCHACO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120103', 'LA LIBERTAD', 'TRUJILLO', 'LAREDO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120104', 'LA LIBERTAD', 'TRUJILLO', 'MOCHE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120105', 'LA LIBERTAD', 'TRUJILLO', 'SALAVERRY', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120106', 'LA LIBERTAD', 'TRUJILLO', 'SIMBAL', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120107', 'LA LIBERTAD', 'TRUJILLO', 'VICTOR LARCO HERRERA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120109', 'LA LIBERTAD', 'TRUJILLO', 'POROTO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120110', 'LA LIBERTAD', 'TRUJILLO', 'EL PORVENIR', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120111', 'LA LIBERTAD', 'TRUJILLO', 'LA ESPERANZA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120112', 'LA LIBERTAD', 'TRUJILLO', 'FLORENCIA DE MORA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120201', 'LA LIBERTAD', 'BOLIVAR', 'BOLIVAR', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120202', 'LA LIBERTAD', 'BOLIVAR', 'BAMBAMARCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120203', 'LA LIBERTAD', 'BOLIVAR', 'CONDORMARCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120204', 'LA LIBERTAD', 'BOLIVAR', 'LONGOTEA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120205', 'LA LIBERTAD', 'BOLIVAR', 'UCUNCHA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120206', 'LA LIBERTAD', 'BOLIVAR', 'UCHUMARCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120301', 'LA LIBERTAD', 'SANCHEZ CARRION', 'HUAMACHUCO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120302', 'LA LIBERTAD', 'SANCHEZ CARRION', 'COCHORCO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120303', 'LA LIBERTAD', 'SANCHEZ CARRION', 'CURGOS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120304', 'LA LIBERTAD', 'SANCHEZ CARRION', 'CHUGAY', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120305', 'LA LIBERTAD', 'SANCHEZ CARRION', 'MARCABAL', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120306', 'LA LIBERTAD', 'SANCHEZ CARRION', 'SANAGORAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120307', 'LA LIBERTAD', 'SANCHEZ CARRION', 'SARIN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120308', 'LA LIBERTAD', 'SANCHEZ CARRION', 'SARTIMBAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120401', 'LA LIBERTAD', 'OTUZCO', 'OTUZCO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120402', 'LA LIBERTAD', 'OTUZCO', 'AGALLPAMPA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120403', 'LA LIBERTAD', 'OTUZCO', 'CHARAT', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120404', 'LA LIBERTAD', 'OTUZCO', 'HUARANCHAL', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120405', 'LA LIBERTAD', 'OTUZCO', 'LA CUESTA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120408', 'LA LIBERTAD', 'OTUZCO', 'PARANDAY', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120409', 'LA LIBERTAD', 'OTUZCO', 'SALPO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120410', 'LA LIBERTAD', 'OTUZCO', 'SINSICAP', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120411', 'LA LIBERTAD', 'OTUZCO', 'USQUIL', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120413', 'LA LIBERTAD', 'OTUZCO', 'MACHE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120501', 'LA LIBERTAD', 'PACASMAYO', 'SAN PEDRO DE LLOC', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120503', 'LA LIBERTAD', 'PACASMAYO', 'GUADALUPE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120504', 'LA LIBERTAD', 'PACASMAYO', 'JEQUETEPEQUE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120506', 'LA LIBERTAD', 'PACASMAYO', 'PACASMAYO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120508', 'LA LIBERTAD', 'PACASMAYO', 'SAN JOSE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120601', 'LA LIBERTAD', 'PATAZ', 'TAYABAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120602', 'LA LIBERTAD', 'PATAZ', 'BULDIBUYO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120603', 'LA LIBERTAD', 'PATAZ', 'CHILLIA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120604', 'LA LIBERTAD', 'PATAZ', 'HUAYLILLAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120605', 'LA LIBERTAD', 'PATAZ', 'HUANCASPATA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120606', 'LA LIBERTAD', 'PATAZ', 'HUAYO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120607', 'LA LIBERTAD', 'PATAZ', 'ONGON', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120608', 'LA LIBERTAD', 'PATAZ', 'PARCOY', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120609', 'LA LIBERTAD', 'PATAZ', 'PATAZ', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120610', 'LA LIBERTAD', 'PATAZ', 'PIAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120611', 'LA LIBERTAD', 'PATAZ', 'TAURIJA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120612', 'LA LIBERTAD', 'PATAZ', 'URPAY', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120613', 'LA LIBERTAD', 'PATAZ', 'SANTIAGO DE CHALLAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120701', 'LA LIBERTAD', 'SANTIAGO DE CHUCO', 'SANTIAGO DE CHUCO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120702', 'LA LIBERTAD', 'SANTIAGO DE CHUCO', 'CACHICADAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120703', 'LA LIBERTAD', 'SANTIAGO DE CHUCO', 'MOLLEBAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120704', 'LA LIBERTAD', 'SANTIAGO DE CHUCO', 'MOLLEPATA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120705', 'LA LIBERTAD', 'SANTIAGO DE CHUCO', 'QUIRUVILCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120706', 'LA LIBERTAD', 'SANTIAGO DE CHUCO', 'SANTA CRUZ DE CHUCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120707', 'LA LIBERTAD', 'SANTIAGO DE CHUCO', 'SITABAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120708', 'LA LIBERTAD', 'SANTIAGO DE CHUCO', 'ANGASMARCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120801', 'LA LIBERTAD', 'ASCOPE', 'ASCOPE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120802', 'LA LIBERTAD', 'ASCOPE', 'CHICAMA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120803', 'LA LIBERTAD', 'ASCOPE', 'CHOCOPE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120804', 'LA LIBERTAD', 'ASCOPE', 'SANTIAGO DE CAO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120805', 'LA LIBERTAD', 'ASCOPE', 'MAGDALENA DE CAO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120806', 'LA LIBERTAD', 'ASCOPE', 'PAIJAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120807', 'LA LIBERTAD', 'ASCOPE', 'RAZURI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120808', 'LA LIBERTAD', 'ASCOPE', 'CASA GRANDE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120901', 'LA LIBERTAD', 'CHEPEN', 'CHEPEN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120902', 'LA LIBERTAD', 'CHEPEN', 'PACANGA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('120903', 'LA LIBERTAD', 'CHEPEN', 'PUEBLO NUEVO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('121001', 'LA LIBERTAD', 'JULCAN', 'JULCAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('121002', 'LA LIBERTAD', 'JULCAN', 'CARABAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('121003', 'LA LIBERTAD', 'JULCAN', 'CALAMARCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('121004', 'LA LIBERTAD', 'JULCAN', 'HUASO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('121101', 'LA LIBERTAD', 'GRAN CHIMU', 'CASCAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('121102', 'LA LIBERTAD', 'GRAN CHIMU', 'LUCMA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('121103', 'LA LIBERTAD', 'GRAN CHIMU', 'MARMOT', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('121104', 'LA LIBERTAD', 'GRAN CHIMU', 'SAYAPULLO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('121201', 'LA LIBERTAD', 'VIRU', 'VIRU', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('121202', 'LA LIBERTAD', 'VIRU', 'CHAO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('121203', 'LA LIBERTAD', 'VIRU', 'GUADALUPITO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('130101', 'LAMBAYEQUE', 'CHICLAYO', 'CHICLAYO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('130102', 'LAMBAYEQUE', 'CHICLAYO', 'CHONGOYAPE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('130103', 'LAMBAYEQUE', 'CHICLAYO', 'ETEN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('130104', 'LAMBAYEQUE', 'CHICLAYO', 'ETEN PUERTO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('130105', 'LAMBAYEQUE', 'CHICLAYO', 'LAGUNAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('130106', 'LAMBAYEQUE', 'CHICLAYO', 'MONSEFU', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('130107', 'LAMBAYEQUE', 'CHICLAYO', 'NUEVA ARICA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('130108', 'LAMBAYEQUE', 'CHICLAYO', 'OYOTUN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('130109', 'LAMBAYEQUE', 'CHICLAYO', 'PICSI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('130110', 'LAMBAYEQUE', 'CHICLAYO', 'PIMENTEL', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('130111', 'LAMBAYEQUE', 'CHICLAYO', 'REQUE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('130112', 'LAMBAYEQUE', 'CHICLAYO', 'JOSE LEONARDO ORTIZ', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('130113', 'LAMBAYEQUE', 'CHICLAYO', 'SANTA ROSA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('130114', 'LAMBAYEQUE', 'CHICLAYO', 'SAÑA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('130115', 'LAMBAYEQUE', 'CHICLAYO', 'LA VICTORIA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('130116', 'LAMBAYEQUE', 'CHICLAYO', 'CAYALTI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('130117', 'LAMBAYEQUE', 'CHICLAYO', 'PATAPO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('130118', 'LAMBAYEQUE', 'CHICLAYO', 'POMALCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('130119', 'LAMBAYEQUE', 'CHICLAYO', 'PUCALA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('130120', 'LAMBAYEQUE', 'CHICLAYO', 'TUMAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('130201', 'LAMBAYEQUE', 'FERREÑAFE', 'FERREÑAFE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('130202', 'LAMBAYEQUE', 'FERREÑAFE', 'INCAHUASI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('130203', 'LAMBAYEQUE', 'FERREÑAFE', 'CAÑARIS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('130204', 'LAMBAYEQUE', 'FERREÑAFE', 'PITIPO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('130205', 'LAMBAYEQUE', 'FERREÑAFE', 'PUEBLO NUEVO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('130206', 'LAMBAYEQUE', 'FERREÑAFE', 'MANUEL ANTONIO MESONES MURO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('130301', 'LAMBAYEQUE', 'LAMBAYEQUE', 'LAMBAYEQUE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('130302', 'LAMBAYEQUE', 'LAMBAYEQUE', 'CHOCHOPE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('130303', 'LAMBAYEQUE', 'LAMBAYEQUE', 'ILLIMO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('130304', 'LAMBAYEQUE', 'LAMBAYEQUE', 'JAYANCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('130305', 'LAMBAYEQUE', 'LAMBAYEQUE', 'MOCHUMI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('130306', 'LAMBAYEQUE', 'LAMBAYEQUE', 'MORROPE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('130307', 'LAMBAYEQUE', 'LAMBAYEQUE', 'MOTUPE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('130308', 'LAMBAYEQUE', 'LAMBAYEQUE', 'OLMOS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('130309', 'LAMBAYEQUE', 'LAMBAYEQUE', 'PACORA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('130310', 'LAMBAYEQUE', 'LAMBAYEQUE', 'SALAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('130311', 'LAMBAYEQUE', 'LAMBAYEQUE', 'SAN JOSE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('130312', 'LAMBAYEQUE', 'LAMBAYEQUE', 'TUCUME', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140101', 'LIMA', 'LIMA', 'LIMA', 'PER', 1, -12.0463731000, -77.0427540000, 1);
INSERT INTO `tbl_ubigeo` VALUES ('140102', 'LIMA', 'LIMA', 'ANCON', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140103', 'LIMA', 'LIMA', 'ATE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140104', 'LIMA', 'LIMA', 'BREÑA', 'PER', 1, -12.0591600000, -77.0505900000, 6);
INSERT INTO `tbl_ubigeo` VALUES ('140105', 'LIMA', 'LIMA', 'CARABAYLLO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140106', 'LIMA', 'LIMA', 'COMAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140107', 'LIMA', 'LIMA', 'CHACLACAYO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140108', 'LIMA', 'LIMA', 'CHORRILLOS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140109', 'LIMA', 'LIMA', 'LA VICTORIA', 'PER', 1, -12.0741362000, -77.0246291000, 2);
INSERT INTO `tbl_ubigeo` VALUES ('140110', 'LIMA', 'LIMA', 'LA MOLINA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140111', 'LIMA', 'LIMA', 'LINCE', 'PER', 1, -12.0781693000, -77.0445096000, 12);
INSERT INTO `tbl_ubigeo` VALUES ('140112', 'LIMA', 'LIMA', 'LURIGANCHO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140113', 'LIMA', 'LIMA', 'LURIN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140114', 'LIMA', 'LIMA', 'MAGDALENA DEL MAR', 'PER', 1, -12.0951590000, -77.0756703000, 11);
INSERT INTO `tbl_ubigeo` VALUES ('140115', 'LIMA', 'LIMA', 'MIRAFLORES', 'PER', 1, -12.1110620000, -77.0315913000, 9);
INSERT INTO `tbl_ubigeo` VALUES ('140116', 'LIMA', 'LIMA', 'PACHACAMAC', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140117', 'LIMA', 'LIMA', 'PUEBLO LIBRE', 'PER', 1, -12.0765784000, -77.0743252000, 10);
INSERT INTO `tbl_ubigeo` VALUES ('140118', 'LIMA', 'LIMA', 'PUCUSANA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140119', 'LIMA', 'LIMA', 'PUENTE PIEDRA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140120', 'LIMA', 'LIMA', 'PUNTA HERMOSA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140121', 'LIMA', 'LIMA', 'PUNTA NEGRA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140122', 'LIMA', 'LIMA', 'RIMAC', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140123', 'LIMA', 'LIMA', 'SAN BARTOLO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140124', 'LIMA', 'LIMA', 'SAN ISIDRO', 'PER', 1, -12.0979021000, -77.0353666300, 13);
INSERT INTO `tbl_ubigeo` VALUES ('140125', 'LIMA', 'LIMA', 'BARRANCO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140126', 'LIMA', 'LIMA', 'SAN MARTIN DE PORRES', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140127', 'LIMA', 'LIMA', 'SAN MIGUEL', 'PER', 1, -12.0787675000, -77.1002948000, 3);
INSERT INTO `tbl_ubigeo` VALUES ('140128', 'LIMA', 'LIMA', 'SANTA MARIA DEL MAR', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140129', 'LIMA', 'LIMA', 'SANTA ROSA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140130', 'LIMA', 'LIMA', 'SANTIAGO DE SURCO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140131', 'LIMA', 'LIMA', 'SURQUILLO', 'PER', 1, -12.1134400000, -77.0129900000, 5);
INSERT INTO `tbl_ubigeo` VALUES ('140132', 'LIMA', 'LIMA', 'VILLA MARIA DEL TRIUNFO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140133', 'LIMA', 'LIMA', 'JESUS MARIA', 'PER', 1, -12.0895885000, -77.0539246000, 4);
INSERT INTO `tbl_ubigeo` VALUES ('140134', 'LIMA', 'LIMA', 'INDEPENDENCIA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140135', 'LIMA', 'LIMA', 'EL AGUSTINO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140136', 'LIMA', 'LIMA', 'SAN JUAN DE MIRAFLORES', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140137', 'LIMA', 'LIMA', 'SAN JUAN DE LURIGANCHO', 'PER', 1, -12.0017252000, -77.0084106000, 0);
INSERT INTO `tbl_ubigeo` VALUES ('140138', 'LIMA', 'LIMA', 'SAN LUIS', 'PER', 1, -12.0737421000, -77.0075226000, 7);
INSERT INTO `tbl_ubigeo` VALUES ('140139', 'LIMA', 'LIMA', 'CIENEGUILLA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140140', 'LIMA', 'LIMA', 'SAN BORJA', 'PER', 1, -12.0964515500, -76.9956898700, 8);
INSERT INTO `tbl_ubigeo` VALUES ('140141', 'LIMA', 'LIMA', 'VILLA EL SALVADOR', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140142', 'LIMA', 'LIMA', 'LOS OLIVOS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140143', 'LIMA', 'LIMA', 'SANTA ANITA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140201', 'LIMA', 'CAJATAMBO', 'CAJATAMBO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140205', 'LIMA', 'CAJATAMBO', 'COPA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140206', 'LIMA', 'CAJATAMBO', 'GORGOR', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140207', 'LIMA', 'CAJATAMBO', 'HUANCAPON', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140208', 'LIMA', 'CAJATAMBO', 'MANAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140301', 'LIMA', 'CANTA', 'CANTA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140302', 'LIMA', 'CANTA', 'ARAHUAY', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140303', 'LIMA', 'CANTA', 'HUAMANTANGA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140304', 'LIMA', 'CANTA', 'HUAROS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140305', 'LIMA', 'CANTA', 'LACHAQUI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140306', 'LIMA', 'CANTA', 'SAN BUENAVENTURA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140307', 'LIMA', 'CANTA', 'SANTA ROSA DE QUIVES', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140401', 'LIMA', 'CAÑETE', 'SAN VICENTE DE CAÑETE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140402', 'LIMA', 'CAÑETE', 'CALANGO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140403', 'LIMA', 'CAÑETE', 'CERRO AZUL', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140404', 'LIMA', 'CAÑETE', 'COAYLLO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140405', 'LIMA', 'CAÑETE', 'CHILCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140406', 'LIMA', 'CAÑETE', 'IMPERIAL', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140407', 'LIMA', 'CAÑETE', 'LUNAHUANA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140408', 'LIMA', 'CAÑETE', 'MALA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140409', 'LIMA', 'CAÑETE', 'NUEVO IMPERIAL', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140410', 'LIMA', 'CAÑETE', 'PACARAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140411', 'LIMA', 'CAÑETE', 'QUILMANA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140412', 'LIMA', 'CAÑETE', 'SAN ANTONIO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140413', 'LIMA', 'CAÑETE', 'SAN LUIS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140414', 'LIMA', 'CAÑETE', 'SANTA CRUZ DE FLORES', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140415', 'LIMA', 'CAÑETE', 'ZUÑIGA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140416', 'LIMA', 'CAÑETE', 'ASIA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140501', 'LIMA', 'HUAURA', 'HUACHO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140502', 'LIMA', 'HUAURA', 'AMBAR', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140504', 'LIMA', 'HUAURA', 'CALETA DE CARQUIN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140505', 'LIMA', 'HUAURA', 'CHECRAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140506', 'LIMA', 'HUAURA', 'HUALMAY', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140507', 'LIMA', 'HUAURA', 'HUAURA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140508', 'LIMA', 'HUAURA', 'LEONCIO PRADO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140509', 'LIMA', 'HUAURA', 'PACCHO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140511', 'LIMA', 'HUAURA', 'SANTA LEONOR', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140512', 'LIMA', 'HUAURA', 'SANTA MARIA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140513', 'LIMA', 'HUAURA', 'SAYAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140516', 'LIMA', 'HUAURA', 'VEGUETA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140601', 'LIMA', 'HUAROCHIRI', 'MATUCANA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140602', 'LIMA', 'HUAROCHIRI', 'ANTIOQUIA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140603', 'LIMA', 'HUAROCHIRI', 'CALLAHUANCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140604', 'LIMA', 'HUAROCHIRI', 'CARAMPOMA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140605', 'LIMA', 'HUAROCHIRI', 'CASTA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140606', 'LIMA', 'HUAROCHIRI', 'SAN JOSE DE LOS CHORRILLOS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140607', 'LIMA', 'HUAROCHIRI', 'CHICLA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140608', 'LIMA', 'HUAROCHIRI', 'HUANZA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140609', 'LIMA', 'HUAROCHIRI', 'HUAROCHIRI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140610', 'LIMA', 'HUAROCHIRI', 'LAHUAYTAMBO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140611', 'LIMA', 'HUAROCHIRI', 'LANGA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140612', 'LIMA', 'HUAROCHIRI', 'MARIATANA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140613', 'LIMA', 'HUAROCHIRI', 'RICARDO PALMA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140614', 'LIMA', 'HUAROCHIRI', 'SAN ANDRES DE TUPICOCHA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140615', 'LIMA', 'HUAROCHIRI', 'SAN ANTONIO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140616', 'LIMA', 'HUAROCHIRI', 'SAN BARTOLOME', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140617', 'LIMA', 'HUAROCHIRI', 'SAN DAMIAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140618', 'LIMA', 'HUAROCHIRI', 'SANGALLAYA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140619', 'LIMA', 'HUAROCHIRI', 'SAN JUAN DE TANTARANCHE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140620', 'LIMA', 'HUAROCHIRI', 'SAN LORENZO DE QUINTI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140621', 'LIMA', 'HUAROCHIRI', 'SAN MATEO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140622', 'LIMA', 'HUAROCHIRI', 'SAN MATEO DE OTAO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140623', 'LIMA', 'HUAROCHIRI', 'SAN PEDRO DE HUANCAYRE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140624', 'LIMA', 'HUAROCHIRI', 'SANTA CRUZ DE COCACHACRA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140625', 'LIMA', 'HUAROCHIRI', 'SANTA EULALIA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140626', 'LIMA', 'HUAROCHIRI', 'SANTIAGO DE ANCHUCAYA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140627', 'LIMA', 'HUAROCHIRI', 'SANTIAGO DE TUNA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140628', 'LIMA', 'HUAROCHIRI', 'SANTO DOMINGO DE LOS OLLEROS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140629', 'LIMA', 'HUAROCHIRI', 'SURCO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140630', 'LIMA', 'HUAROCHIRI', 'HUACHUPAMPA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140631', 'LIMA', 'HUAROCHIRI', 'LARAOS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140632', 'LIMA', 'HUAROCHIRI', 'SAN JUAN DE IRIS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140701', 'LIMA', 'YAUYOS', 'YAUYOS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140702', 'LIMA', 'YAUYOS', 'ALIS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140703', 'LIMA', 'YAUYOS', 'ALLAUCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140704', 'LIMA', 'YAUYOS', 'AYAVIRI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140705', 'LIMA', 'YAUYOS', 'AZANGARO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140706', 'LIMA', 'YAUYOS', 'CACRA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140707', 'LIMA', 'YAUYOS', 'CARANIA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140708', 'LIMA', 'YAUYOS', 'COCHAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140709', 'LIMA', 'YAUYOS', 'COLONIA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140710', 'LIMA', 'YAUYOS', 'CHOCOS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140711', 'LIMA', 'YAUYOS', 'HUAMPARA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140712', 'LIMA', 'YAUYOS', 'HUANCAYA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140713', 'LIMA', 'YAUYOS', 'HUANGASCAR', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140714', 'LIMA', 'YAUYOS', 'HUANTAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140715', 'LIMA', 'YAUYOS', 'HUAÑEC', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140716', 'LIMA', 'YAUYOS', 'LARAOS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140717', 'LIMA', 'YAUYOS', 'LINCHA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140718', 'LIMA', 'YAUYOS', 'MIRAFLORES', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140719', 'LIMA', 'YAUYOS', 'OMAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140720', 'LIMA', 'YAUYOS', 'QUINCHES', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140721', 'LIMA', 'YAUYOS', 'QUINOCAY', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140722', 'LIMA', 'YAUYOS', 'SAN JOAQUIN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140723', 'LIMA', 'YAUYOS', 'SAN PEDRO DE PILAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140724', 'LIMA', 'YAUYOS', 'TANTA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140725', 'LIMA', 'YAUYOS', 'TAURIPAMPA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140726', 'LIMA', 'YAUYOS', 'TUPE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140727', 'LIMA', 'YAUYOS', 'TOMAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140728', 'LIMA', 'YAUYOS', 'VIÑAC', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140729', 'LIMA', 'YAUYOS', 'VITIS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140730', 'LIMA', 'YAUYOS', 'HONGOS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140731', 'LIMA', 'YAUYOS', 'MADEAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140732', 'LIMA', 'YAUYOS', 'PUTINZA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140733', 'LIMA', 'YAUYOS', 'CATAHUASI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140801', 'LIMA', 'HUARAL', 'HUARAL', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140802', 'LIMA', 'HUARAL', 'ATAVILLOS ALTO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140803', 'LIMA', 'HUARAL', 'ATAVILLOS BAJO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140804', 'LIMA', 'HUARAL', 'AUCALLAMA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140805', 'LIMA', 'HUARAL', 'CHANCAY', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140806', 'LIMA', 'HUARAL', 'IHUARI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140807', 'LIMA', 'HUARAL', 'LAMPIAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140808', 'LIMA', 'HUARAL', 'PACARAOS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140809', 'LIMA', 'HUARAL', 'SAN MIGUEL DE ACOS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140810', 'LIMA', 'HUARAL', 'VEINTISIETE DE NOVIEMBRE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140811', 'LIMA', 'HUARAL', 'SANTA CRUZ DE ANDAMARCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140812', 'LIMA', 'HUARAL', 'SUMBILCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140901', 'LIMA', 'BARRANCA', 'BARRANCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140902', 'LIMA', 'BARRANCA', 'PARAMONGA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140903', 'LIMA', 'BARRANCA', 'PATIVILCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140904', 'LIMA', 'BARRANCA', 'SUPE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('140905', 'LIMA', 'BARRANCA', 'SUPE PUERTO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('141001', 'LIMA', 'OYON', 'OYON', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('141002', 'LIMA', 'OYON', 'NAVAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('141003', 'LIMA', 'OYON', 'CAUJUL', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('141004', 'LIMA', 'OYON', 'ANDAJES', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('141005', 'LIMA', 'OYON', 'PACHANGARA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('141006', 'LIMA', 'OYON', 'COCHAMARCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('150101', 'LORETO', 'MAYNAS', 'IQUITOS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('150102', 'LORETO', 'MAYNAS', 'ALTO NANAY', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('150103', 'LORETO', 'MAYNAS', 'FERNANDO LORES', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('150104', 'LORETO', 'MAYNAS', 'LAS AMAZONAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('150105', 'LORETO', 'MAYNAS', 'MAZAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('150106', 'LORETO', 'MAYNAS', 'NAPO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('150107', 'LORETO', 'MAYNAS', 'PUTUMAYO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('150108', 'LORETO', 'MAYNAS', 'TORRES CAUSANA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('150110', 'LORETO', 'MAYNAS', 'INDIANA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('150111', 'LORETO', 'MAYNAS', 'PUNCHANA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('150112', 'LORETO', 'MAYNAS', 'BELEN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('150113', 'LORETO', 'MAYNAS', 'SAN JUAN BAUTISTA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('150114', 'LORETO', 'MAYNAS', 'TENIENTE MANUEL CLAVERO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('150201', 'LORETO', 'ALTO AMAZONAS', 'YURIMAGUAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('150202', 'LORETO', 'ALTO AMAZONAS', 'BALSAPUERTO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('150205', 'LORETO', 'ALTO AMAZONAS', 'JEBEROS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('150206', 'LORETO', 'ALTO AMAZONAS', 'LAGUNAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('150210', 'LORETO', 'ALTO AMAZONAS', 'SANTA CRUZ', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('150211', 'LORETO', 'ALTO AMAZONAS', 'TENIENTE CESAR LOPEZ ROJAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('150301', 'LORETO', 'LORETO', 'NAUTA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('150302', 'LORETO', 'LORETO', 'PARINARI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('150303', 'LORETO', 'LORETO', 'TIGRE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('150304', 'LORETO', 'LORETO', 'URARINAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('150305', 'LORETO', 'LORETO', 'TROMPETEROS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('150401', 'LORETO', 'REQUENA', 'REQUENA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('150402', 'LORETO', 'REQUENA', 'ALTO TAPICHE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('150403', 'LORETO', 'REQUENA', 'CAPELO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('150404', 'LORETO', 'REQUENA', 'EMILIO SAN MARTIN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('150405', 'LORETO', 'REQUENA', 'MAQUIA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('150406', 'LORETO', 'REQUENA', 'PUINAHUA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('150407', 'LORETO', 'REQUENA', 'SAQUENA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('150408', 'LORETO', 'REQUENA', 'SOPLIN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('150409', 'LORETO', 'REQUENA', 'TAPICHE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('150410', 'LORETO', 'REQUENA', 'JENARO HERRERA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('150411', 'LORETO', 'REQUENA', 'YAQUERANA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('150501', 'LORETO', 'UCAYALI', 'CONTAMANA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('150502', 'LORETO', 'UCAYALI', 'VARGAS GUERRA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('150503', 'LORETO', 'UCAYALI', 'PADRE MARQUEZ', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('150504', 'LORETO', 'UCAYALI', 'PAMPA HERMOSA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('150505', 'LORETO', 'UCAYALI', 'SARAYACU', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('150506', 'LORETO', 'UCAYALI', 'INAHUAYA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('150601', 'LORETO', 'MARISCAL RAMON CASTILLA', 'RAMON CASTILLA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('150602', 'LORETO', 'MARISCAL RAMON CASTILLA', 'PEBAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('150603', 'LORETO', 'MARISCAL RAMON CASTILLA', 'YAVARI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('150604', 'LORETO', 'MARISCAL RAMON CASTILLA', 'SAN PABLO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('150701', 'LORETO', 'DATEM DEL MARAÑON', 'BARRANCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('150702', 'LORETO', 'DATEM DEL MARAÑON', 'ANDOAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('150703', 'LORETO', 'DATEM DEL MARAÑON', 'CAHUAPANAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('150704', 'LORETO', 'DATEM DEL MARAÑON', 'MANSERICHE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('150705', 'LORETO', 'DATEM DEL MARAÑON', 'MORONA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('150706', 'LORETO', 'DATEM DEL MARAÑON', 'PASTAZA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('160101', 'MADRE DE DIOS', 'TAMBOPATA', 'TAMBOPATA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('160102', 'MADRE DE DIOS', 'TAMBOPATA', 'INAMBARI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('160103', 'MADRE DE DIOS', 'TAMBOPATA', 'LAS PIEDRAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('160104', 'MADRE DE DIOS', 'TAMBOPATA', 'LABERINTO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('160201', 'MADRE DE DIOS', 'MANU', 'MANU', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('160202', 'MADRE DE DIOS', 'MANU', 'FITZCARRALD', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('160203', 'MADRE DE DIOS', 'MANU', 'MADRE DE DIOS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('160204', 'MADRE DE DIOS', 'MANU', 'HUEPETUHE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('160301', 'MADRE DE DIOS', 'TAHUAMANU', 'IÑAPARI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('160302', 'MADRE DE DIOS', 'TAHUAMANU', 'IBERIA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('160303', 'MADRE DE DIOS', 'TAHUAMANU', 'TAHUAMANU', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('170101', 'MOQUEGUA', 'MARISCAL NIETO', 'MOQUEGUA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('170102', 'MOQUEGUA', 'MARISCAL NIETO', 'CARUMAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('170103', 'MOQUEGUA', 'MARISCAL NIETO', 'CUCHUMBAYA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('170104', 'MOQUEGUA', 'MARISCAL NIETO', 'SAN CRISTOBAL', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('170105', 'MOQUEGUA', 'MARISCAL NIETO', 'TORATA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('170106', 'MOQUEGUA', 'MARISCAL NIETO', 'SAMEGUA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('170201', 'MOQUEGUA', 'GENERAL SANCHEZ CERRO', 'OMATE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('170202', 'MOQUEGUA', 'GENERAL SANCHEZ CERRO', 'COALAQUE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('170203', 'MOQUEGUA', 'GENERAL SANCHEZ CERRO', 'CHOJATA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('170204', 'MOQUEGUA', 'GENERAL SANCHEZ CERRO', 'ICHUÑA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('170205', 'MOQUEGUA', 'GENERAL SANCHEZ CERRO', 'LA CAPILLA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('170206', 'MOQUEGUA', 'GENERAL SANCHEZ CERRO', 'LLOQUE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('170207', 'MOQUEGUA', 'GENERAL SANCHEZ CERRO', 'MATALAQUE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('170208', 'MOQUEGUA', 'GENERAL SANCHEZ CERRO', 'PUQUINA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('170209', 'MOQUEGUA', 'GENERAL SANCHEZ CERRO', 'QUINISTAQUILLAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('170210', 'MOQUEGUA', 'GENERAL SANCHEZ CERRO', 'UBINAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('170211', 'MOQUEGUA', 'GENERAL SANCHEZ CERRO', 'YUNGA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('170301', 'MOQUEGUA', 'ILO', 'ILO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('170302', 'MOQUEGUA', 'ILO', 'EL ALGARROBAL', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('170303', 'MOQUEGUA', 'ILO', 'PACOCHA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('180101', 'PASCO', 'PASCO', 'CHAUPIMARCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('180103', 'PASCO', 'PASCO', 'HUACHON', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('180104', 'PASCO', 'PASCO', 'HUARIACA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('180105', 'PASCO', 'PASCO', 'HUAYLLAY', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('180106', 'PASCO', 'PASCO', 'NINACACA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('180107', 'PASCO', 'PASCO', 'PALLANCHACRA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('180108', 'PASCO', 'PASCO', 'PAUCARTAMBO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('180109', 'PASCO', 'PASCO', 'SAN FCO DE ASIS DE YARUSYACAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('180110', 'PASCO', 'PASCO', 'SIMON BOLIVAR', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('180111', 'PASCO', 'PASCO', 'TICLACAYAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('180112', 'PASCO', 'PASCO', 'TINYAHUARCO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('180113', 'PASCO', 'PASCO', 'VICCO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('180114', 'PASCO', 'PASCO', 'YANACANCHA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('180201', 'PASCO', 'DANIEL ALCIDES CARRION', 'YANAHUANCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('180202', 'PASCO', 'DANIEL ALCIDES CARRION', 'CHACAYAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('180203', 'PASCO', 'DANIEL ALCIDES CARRION', 'GOYLLARISQUIZGA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('180204', 'PASCO', 'DANIEL ALCIDES CARRION', 'PAUCAR', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('180205', 'PASCO', 'DANIEL ALCIDES CARRION', 'SAN PEDRO DE PILLAO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('180206', 'PASCO', 'DANIEL ALCIDES CARRION', 'SANTA ANA DE TUSI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('180207', 'PASCO', 'DANIEL ALCIDES CARRION', 'TAPUC', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('180208', 'PASCO', 'DANIEL ALCIDES CARRION', 'VILCABAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('180301', 'PASCO', 'OXAPAMPA', 'OXAPAMPA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('180302', 'PASCO', 'OXAPAMPA', 'CHONTABAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('180303', 'PASCO', 'OXAPAMPA', 'HUANCABAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('180304', 'PASCO', 'OXAPAMPA', 'PUERTO BERMUDEZ', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('180305', 'PASCO', 'OXAPAMPA', 'VILLA RICA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('180306', 'PASCO', 'OXAPAMPA', 'POZUZO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('180307', 'PASCO', 'OXAPAMPA', 'PALCAZU', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('180308', 'PASCO', 'OXAPAMPA', 'CONSTITUCION', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190101', 'PIURA', 'PIURA', 'PIURA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190103', 'PIURA', 'PIURA', 'CASTILLA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190104', 'PIURA', 'PIURA', 'CATACAOS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190105', 'PIURA', 'PIURA', 'LA ARENA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190106', 'PIURA', 'PIURA', 'LA UNION', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190107', 'PIURA', 'PIURA', 'LAS LOMAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190109', 'PIURA', 'PIURA', 'TAMBO GRANDE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190113', 'PIURA', 'PIURA', 'CURA MORI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190114', 'PIURA', 'PIURA', 'EL TALLAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190201', 'PIURA', 'AYABACA', 'AYABACA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190202', 'PIURA', 'AYABACA', 'FRIAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190203', 'PIURA', 'AYABACA', 'LAGUNAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190204', 'PIURA', 'AYABACA', 'MONTERO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190205', 'PIURA', 'AYABACA', 'PACAIPAMPA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190206', 'PIURA', 'AYABACA', 'SAPILLICA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190207', 'PIURA', 'AYABACA', 'SICCHEZ', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190208', 'PIURA', 'AYABACA', 'SUYO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190209', 'PIURA', 'AYABACA', 'JILILI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190210', 'PIURA', 'AYABACA', 'PAIMAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190301', 'PIURA', 'HUANCABAMBA', 'HUANCABAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190302', 'PIURA', 'HUANCABAMBA', 'CANCHAQUE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190303', 'PIURA', 'HUANCABAMBA', 'HUARMACA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190304', 'PIURA', 'HUANCABAMBA', 'SONDOR', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190305', 'PIURA', 'HUANCABAMBA', 'SONDORILLO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190306', 'PIURA', 'HUANCABAMBA', 'EL CARMEN DE LA FRONTERA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190307', 'PIURA', 'HUANCABAMBA', 'SAN MIGUEL DE EL FAIQUE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190308', 'PIURA', 'HUANCABAMBA', 'LALAQUIZ', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190401', 'PIURA', 'MORROPON', 'CHULUCANAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190402', 'PIURA', 'MORROPON', 'BUENOS AIRES', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190403', 'PIURA', 'MORROPON', 'CHALACO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190404', 'PIURA', 'MORROPON', 'MORROPON', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190405', 'PIURA', 'MORROPON', 'SALITRAL', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190406', 'PIURA', 'MORROPON', 'SANTA CATALINA DE MOSSA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190407', 'PIURA', 'MORROPON', 'SANTO DOMINGO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190408', 'PIURA', 'MORROPON', 'LA MATANZA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190409', 'PIURA', 'MORROPON', 'YAMANGO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190410', 'PIURA', 'MORROPON', 'SAN JUAN DE BIGOTE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190501', 'PIURA', 'PAITA', 'PAITA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190502', 'PIURA', 'PAITA', 'AMOTAPE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190503', 'PIURA', 'PAITA', 'ARENAL', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190504', 'PIURA', 'PAITA', 'LA HUACA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190505', 'PIURA', 'PAITA', 'COLAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190506', 'PIURA', 'PAITA', 'TAMARINDO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190507', 'PIURA', 'PAITA', 'VICHAYAL', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190601', 'PIURA', 'SULLANA', 'SULLANA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190602', 'PIURA', 'SULLANA', 'BELLAVISTA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190603', 'PIURA', 'SULLANA', 'LANCONES', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190604', 'PIURA', 'SULLANA', 'MARCAVELICA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190605', 'PIURA', 'SULLANA', 'MIGUEL CHECA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190606', 'PIURA', 'SULLANA', 'QUERECOTILLO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190607', 'PIURA', 'SULLANA', 'SALITRAL', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190608', 'PIURA', 'SULLANA', 'IGNACIO ESCUDERO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190701', 'PIURA', 'TALARA', 'PARIÑAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190702', 'PIURA', 'TALARA', 'EL ALTO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190703', 'PIURA', 'TALARA', 'LA BREA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190704', 'PIURA', 'TALARA', 'LOBITOS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190705', 'PIURA', 'TALARA', 'MANCORA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190706', 'PIURA', 'TALARA', 'LOS ORGANOS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190801', 'PIURA', 'SECHURA', 'SECHURA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190802', 'PIURA', 'SECHURA', 'VICE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190803', 'PIURA', 'SECHURA', 'BERNAL', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190804', 'PIURA', 'SECHURA', 'BELLAVISTA DE LA UNION', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190805', 'PIURA', 'SECHURA', 'CRISTO NOS VALGA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('190806', 'PIURA', 'SECHURA', 'RINCONADA-LLICUAR', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200101', 'PUNO', 'PUNO', 'PUNO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200102', 'PUNO', 'PUNO', 'ACORA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200103', 'PUNO', 'PUNO', 'ATUNCOLLA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200104', 'PUNO', 'PUNO', 'CAPACHICA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200105', 'PUNO', 'PUNO', 'COATA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200106', 'PUNO', 'PUNO', 'CHUCUITO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200107', 'PUNO', 'PUNO', 'HUATA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200108', 'PUNO', 'PUNO', 'MAÑAZO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200109', 'PUNO', 'PUNO', 'PAUCARCOLLA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200110', 'PUNO', 'PUNO', 'PICHACANI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200111', 'PUNO', 'PUNO', 'SAN ANTONIO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200112', 'PUNO', 'PUNO', 'TIQUILLACA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200113', 'PUNO', 'PUNO', 'VILQUE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200114', 'PUNO', 'PUNO', 'PLATERIA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200115', 'PUNO', 'PUNO', 'AMANTANI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200201', 'PUNO', 'AZANGARO', 'AZANGARO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200202', 'PUNO', 'AZANGARO', 'ACHAYA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200203', 'PUNO', 'AZANGARO', 'ARAPA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200204', 'PUNO', 'AZANGARO', 'ASILLO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200205', 'PUNO', 'AZANGARO', 'CAMINACA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200206', 'PUNO', 'AZANGARO', 'CHUPA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200207', 'PUNO', 'AZANGARO', 'JOSE DOMINGO CHOQUEHUANCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200208', 'PUNO', 'AZANGARO', 'MUÑANI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200210', 'PUNO', 'AZANGARO', 'POTONI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200212', 'PUNO', 'AZANGARO', 'SAMAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200213', 'PUNO', 'AZANGARO', 'SAN ANTON', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200214', 'PUNO', 'AZANGARO', 'SAN JOSE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200215', 'PUNO', 'AZANGARO', 'SAN JUAN DE SALINAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200216', 'PUNO', 'AZANGARO', 'SANTIAGO DE PUPUJA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200217', 'PUNO', 'AZANGARO', 'TIRAPATA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200301', 'PUNO', 'CARABAYA', 'MACUSANI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200302', 'PUNO', 'CARABAYA', 'AJOYANI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200303', 'PUNO', 'CARABAYA', 'AYAPATA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200304', 'PUNO', 'CARABAYA', 'COASA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200305', 'PUNO', 'CARABAYA', 'CORANI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200306', 'PUNO', 'CARABAYA', 'CRUCERO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200307', 'PUNO', 'CARABAYA', 'ITUATA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200308', 'PUNO', 'CARABAYA', 'OLLACHEA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200309', 'PUNO', 'CARABAYA', 'SAN GABAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200310', 'PUNO', 'CARABAYA', 'USICAYOS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200401', 'PUNO', 'CHUCUITO', 'JULI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200402', 'PUNO', 'CHUCUITO', 'DESAGUADERO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200403', 'PUNO', 'CHUCUITO', 'HUACULLANI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200406', 'PUNO', 'CHUCUITO', 'PISACOMA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200407', 'PUNO', 'CHUCUITO', 'POMATA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200410', 'PUNO', 'CHUCUITO', 'ZEPITA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200412', 'PUNO', 'CHUCUITO', 'KELLUYO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200501', 'PUNO', 'HUANCANE', 'HUANCANE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200502', 'PUNO', 'HUANCANE', 'COJATA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200504', 'PUNO', 'HUANCANE', 'INCHUPALLA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200506', 'PUNO', 'HUANCANE', 'PUSI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200507', 'PUNO', 'HUANCANE', 'ROSASPATA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200508', 'PUNO', 'HUANCANE', 'TARACO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200509', 'PUNO', 'HUANCANE', 'VILQUE CHICO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200511', 'PUNO', 'HUANCANE', 'HUATASANI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200601', 'PUNO', 'LAMPA', 'LAMPA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200602', 'PUNO', 'LAMPA', 'CABANILLA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200603', 'PUNO', 'LAMPA', 'CALAPUJA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200604', 'PUNO', 'LAMPA', 'NICASIO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200605', 'PUNO', 'LAMPA', 'OCUVIRI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200606', 'PUNO', 'LAMPA', 'PALCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200607', 'PUNO', 'LAMPA', 'PARATIA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200608', 'PUNO', 'LAMPA', 'PUCARA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200609', 'PUNO', 'LAMPA', 'SANTA LUCIA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200610', 'PUNO', 'LAMPA', 'VILAVILA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200701', 'PUNO', 'MELGAR', 'AYAVIRI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200702', 'PUNO', 'MELGAR', 'ANTAUTA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200703', 'PUNO', 'MELGAR', 'CUPI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200704', 'PUNO', 'MELGAR', 'LLALLI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200705', 'PUNO', 'MELGAR', 'MACARI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200706', 'PUNO', 'MELGAR', 'NUÑOA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200707', 'PUNO', 'MELGAR', 'ORURILLO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200708', 'PUNO', 'MELGAR', 'SANTA ROSA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200709', 'PUNO', 'MELGAR', 'UMACHIRI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200801', 'PUNO', 'SANDIA', 'SANDIA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200803', 'PUNO', 'SANDIA', 'CUYOCUYO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200804', 'PUNO', 'SANDIA', 'LIMBANI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200805', 'PUNO', 'SANDIA', 'PHARA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200806', 'PUNO', 'SANDIA', 'PATAMBUCO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200807', 'PUNO', 'SANDIA', 'QUIACA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200808', 'PUNO', 'SANDIA', 'SAN JUAN DEL ORO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200810', 'PUNO', 'SANDIA', 'YANAHUAYA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200811', 'PUNO', 'SANDIA', 'ALTO INAMBARI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200812', 'PUNO', 'SANDIA', 'SAN PEDRO DE PUTINA PUNCO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200901', 'PUNO', 'SAN ROMAN', 'JULIACA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200902', 'PUNO', 'SAN ROMAN', 'CABANA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200903', 'PUNO', 'SAN ROMAN', 'CABANILLAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('200904', 'PUNO', 'SAN ROMAN', 'CARACOTO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('201001', 'PUNO', 'YUNGUYO', 'YUNGUYO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('201002', 'PUNO', 'YUNGUYO', 'UNICACHI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('201003', 'PUNO', 'YUNGUYO', 'ANAPIA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('201004', 'PUNO', 'YUNGUYO', 'COPANI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('201005', 'PUNO', 'YUNGUYO', 'CUTURAPI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('201006', 'PUNO', 'YUNGUYO', 'OLLARAYA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('201007', 'PUNO', 'YUNGUYO', 'TINICACHI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('201101', 'PUNO', 'SAN ANTONIO DE PUTINA', 'PUTINA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('201102', 'PUNO', 'SAN ANTONIO DE PUTINA', 'PEDRO VILCA APAZA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('201103', 'PUNO', 'SAN ANTONIO DE PUTINA', 'QUILCAPUNCU', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('201104', 'PUNO', 'SAN ANTONIO DE PUTINA', 'ANANEA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('201105', 'PUNO', 'SAN ANTONIO DE PUTINA', 'SINA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('201201', 'PUNO', 'EL COLLAO', 'ILAVE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('201202', 'PUNO', 'EL COLLAO', 'PILCUYO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('201203', 'PUNO', 'EL COLLAO', 'SANTA ROSA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('201204', 'PUNO', 'EL COLLAO', 'CAPASO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('201205', 'PUNO', 'EL COLLAO', 'CONDURIRI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('201301', 'PUNO', 'MOHO', 'MOHO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('201302', 'PUNO', 'MOHO', 'CONIMA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('201303', 'PUNO', 'MOHO', 'TILALI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('201304', 'PUNO', 'MOHO', 'HUAYRAPATA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210101', 'SAN MARTIN', 'MOYOBAMBA', 'MOYOBAMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210102', 'SAN MARTIN', 'MOYOBAMBA', 'CALZADA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210103', 'SAN MARTIN', 'MOYOBAMBA', 'HABANA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210104', 'SAN MARTIN', 'MOYOBAMBA', 'JEPELACIO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210105', 'SAN MARTIN', 'MOYOBAMBA', 'SORITOR', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210106', 'SAN MARTIN', 'MOYOBAMBA', 'YANTALO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210201', 'SAN MARTIN', 'HUALLAGA', 'SAPOSOA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210202', 'SAN MARTIN', 'HUALLAGA', 'PISCOYACU', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210203', 'SAN MARTIN', 'HUALLAGA', 'SACANCHE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210204', 'SAN MARTIN', 'HUALLAGA', 'TINGO DE SAPOSOA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210205', 'SAN MARTIN', 'HUALLAGA', 'ALTO SAPOSOA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210206', 'SAN MARTIN', 'HUALLAGA', 'EL ESLABON', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210301', 'SAN MARTIN', 'LAMAS', 'LAMAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210303', 'SAN MARTIN', 'LAMAS', 'BARRANQUITA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210304', 'SAN MARTIN', 'LAMAS', 'CAYNARACHI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210305', 'SAN MARTIN', 'LAMAS', 'CUÑUMBUQUI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210306', 'SAN MARTIN', 'LAMAS', 'PINTO RECODO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210307', 'SAN MARTIN', 'LAMAS', 'RUMISAPA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210311', 'SAN MARTIN', 'LAMAS', 'SHANAO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210313', 'SAN MARTIN', 'LAMAS', 'TABALOSOS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210314', 'SAN MARTIN', 'LAMAS', 'ZAPATERO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210315', 'SAN MARTIN', 'LAMAS', 'ALONSO DE ALVARADO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210316', 'SAN MARTIN', 'LAMAS', 'SAN ROQUE DE CUMBAZA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210401', 'SAN MARTIN', 'MARISCAL CACERES', 'JUANJUI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210402', 'SAN MARTIN', 'MARISCAL CACERES', 'CAMPANILLA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210403', 'SAN MARTIN', 'MARISCAL CACERES', 'HUICUNGO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210404', 'SAN MARTIN', 'MARISCAL CACERES', 'PACHIZA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210405', 'SAN MARTIN', 'MARISCAL CACERES', 'PAJARILLO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210501', 'SAN MARTIN', 'RIOJA', 'RIOJA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210502', 'SAN MARTIN', 'RIOJA', 'POSIC', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210503', 'SAN MARTIN', 'RIOJA', 'YORONGOS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210504', 'SAN MARTIN', 'RIOJA', 'YURACYACU', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210505', 'SAN MARTIN', 'RIOJA', 'NUEVA CAJAMARCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210506', 'SAN MARTIN', 'RIOJA', 'ELIAS SOPLIN VARGAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210507', 'SAN MARTIN', 'RIOJA', 'SAN FERNANDO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210508', 'SAN MARTIN', 'RIOJA', 'PARDO MIGUEL', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210509', 'SAN MARTIN', 'RIOJA', 'AWAJUN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210601', 'SAN MARTIN', 'SAN MARTIN', 'TARAPOTO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210602', 'SAN MARTIN', 'SAN MARTIN', 'ALBERTO LEVEAU', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210604', 'SAN MARTIN', 'SAN MARTIN', 'CACATACHI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210606', 'SAN MARTIN', 'SAN MARTIN', 'CHAZUTA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210607', 'SAN MARTIN', 'SAN MARTIN', 'CHIPURANA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210608', 'SAN MARTIN', 'SAN MARTIN', 'EL PORVENIR', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210609', 'SAN MARTIN', 'SAN MARTIN', 'HUIMBAYOC', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210610', 'SAN MARTIN', 'SAN MARTIN', 'JUAN GUERRA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210611', 'SAN MARTIN', 'SAN MARTIN', 'MORALES', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210612', 'SAN MARTIN', 'SAN MARTIN', 'PAPAPLAYA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210616', 'SAN MARTIN', 'SAN MARTIN', 'SAN ANTONIO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210619', 'SAN MARTIN', 'SAN MARTIN', 'SAUCE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210620', 'SAN MARTIN', 'SAN MARTIN', 'SHAPAJA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210621', 'SAN MARTIN', 'SAN MARTIN', 'LA BANDA DE SHILCAYO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210701', 'SAN MARTIN', 'BELLAVISTA', 'BELLAVISTA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210702', 'SAN MARTIN', 'BELLAVISTA', 'SAN RAFAEL', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210703', 'SAN MARTIN', 'BELLAVISTA', 'SAN PABLO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210704', 'SAN MARTIN', 'BELLAVISTA', 'ALTO BIAVO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210705', 'SAN MARTIN', 'BELLAVISTA', 'HUALLAGA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210706', 'SAN MARTIN', 'BELLAVISTA', 'BAJO BIAVO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210801', 'SAN MARTIN', 'TOCACHE', 'TOCACHE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210802', 'SAN MARTIN', 'TOCACHE', 'NUEVO PROGRESO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210803', 'SAN MARTIN', 'TOCACHE', 'POLVORA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210804', 'SAN MARTIN', 'TOCACHE', 'SHUNTE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210805', 'SAN MARTIN', 'TOCACHE', 'UCHIZA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210901', 'SAN MARTIN', 'PICOTA', 'PICOTA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210902', 'SAN MARTIN', 'PICOTA', 'BUENOS AIRES', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210903', 'SAN MARTIN', 'PICOTA', 'CASPIZAPA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210904', 'SAN MARTIN', 'PICOTA', 'PILLUANA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210905', 'SAN MARTIN', 'PICOTA', 'PUCACACA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210906', 'SAN MARTIN', 'PICOTA', 'SAN CRISTOBAL', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210907', 'SAN MARTIN', 'PICOTA', 'SAN HILARION', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210908', 'SAN MARTIN', 'PICOTA', 'TINGO DE PONASA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210909', 'SAN MARTIN', 'PICOTA', 'TRES UNIDOS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('210910', 'SAN MARTIN', 'PICOTA', 'SHAMBOYACU', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('211001', 'SAN MARTIN', 'EL DORADO', 'SAN JOSE DE SISA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('211002', 'SAN MARTIN', 'EL DORADO', 'AGUA BLANCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('211003', 'SAN MARTIN', 'EL DORADO', 'SHATOJA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('211004', 'SAN MARTIN', 'EL DORADO', 'SAN MARTIN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('211005', 'SAN MARTIN', 'EL DORADO', 'SANTA ROSA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('220101', 'TACNA', 'TACNA', 'TACNA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('220102', 'TACNA', 'TACNA', 'CALANA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('220104', 'TACNA', 'TACNA', 'INCLAN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('220107', 'TACNA', 'TACNA', 'PACHIA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('220108', 'TACNA', 'TACNA', 'PALCA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('220109', 'TACNA', 'TACNA', 'POCOLLAY', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('220110', 'TACNA', 'TACNA', 'SAMA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('220111', 'TACNA', 'TACNA', 'ALTO DE LA ALIANZA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('220112', 'TACNA', 'TACNA', 'CIUDAD NUEVA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('220113', 'TACNA', 'TACNA', 'CORONEL GREGORIO ALBARRACIN L.', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('220201', 'TACNA', 'TARATA', 'TARATA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('220205', 'TACNA', 'TARATA', 'HEROES ALBARRACIN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('220206', 'TACNA', 'TARATA', 'ESTIQUE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('220207', 'TACNA', 'TARATA', 'ESTIQUE PAMPA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('220210', 'TACNA', 'TARATA', 'SITAJARA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('220211', 'TACNA', 'TARATA', 'SUSAPAYA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('220212', 'TACNA', 'TARATA', 'TARUCACHI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('220213', 'TACNA', 'TARATA', 'TICACO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('220301', 'TACNA', 'JORGE BASADRE', 'LOCUMBA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('220302', 'TACNA', 'JORGE BASADRE', 'ITE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('220303', 'TACNA', 'JORGE BASADRE', 'ILABAYA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('220401', 'TACNA', 'CANDARAVE', 'CANDARAVE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('220402', 'TACNA', 'CANDARAVE', 'CAIRANI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('220403', 'TACNA', 'CANDARAVE', 'CURIBAYA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('220404', 'TACNA', 'CANDARAVE', 'HUANUARA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('220405', 'TACNA', 'CANDARAVE', 'QUILAHUANI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('220406', 'TACNA', 'CANDARAVE', 'CAMILACA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('230101', 'TUMBES', 'TUMBES', 'TUMBES', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('230102', 'TUMBES', 'TUMBES', 'CORRALES', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('230103', 'TUMBES', 'TUMBES', 'LA CRUZ', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('230104', 'TUMBES', 'TUMBES', 'PAMPAS DE HOSPITAL', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('230105', 'TUMBES', 'TUMBES', 'SAN JACINTO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('230106', 'TUMBES', 'TUMBES', 'SAN JUAN DE LA VIRGEN', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('230201', 'TUMBES', 'CONTRALMIRANTE VILLAR', 'ZORRITOS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('230202', 'TUMBES', 'CONTRALMIRANTE VILLAR', 'CASITAS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('230203', 'TUMBES', 'CONTRALMIRANTE VILLAR', 'CANOAS DE PUNTA SAL', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('230301', 'TUMBES', 'ZARUMILLA', 'ZARUMILLA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('230302', 'TUMBES', 'ZARUMILLA', 'MATAPALO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('230303', 'TUMBES', 'ZARUMILLA', 'PAPAYAL', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('230304', 'TUMBES', 'ZARUMILLA', 'AGUAS VERDES', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('240101', 'CALLAO', 'CALLAO', 'CALLAO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('240102', 'CALLAO', 'CALLAO', 'BELLAVISTA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('240103', 'CALLAO', 'CALLAO', 'LA PUNTA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('240104', 'CALLAO', 'CALLAO', 'CARMEN DE LA LEGUA-REYNOSO', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('240105', 'CALLAO', 'CALLAO', 'LA PERLA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('240106', 'CALLAO', 'CALLAO', 'VENTANILLA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('250101', 'UCAYALI', 'CORONEL PORTILLO', 'CALLERIA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('250102', 'UCAYALI', 'CORONEL PORTILLO', 'YARINACOCHA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('250103', 'UCAYALI', 'CORONEL PORTILLO', 'MASISEA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('250104', 'UCAYALI', 'CORONEL PORTILLO', 'CAMPOVERDE', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('250105', 'UCAYALI', 'CORONEL PORTILLO', 'IPARIA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('250106', 'UCAYALI', 'CORONEL PORTILLO', 'NUEVA REQUENA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('250107', 'UCAYALI', 'CORONEL PORTILLO', 'MANANTAY', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('250201', 'UCAYALI', 'PADRE ABAD', 'PADRE ABAD', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('250202', 'UCAYALI', 'PADRE ABAD', 'IRAZOLA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('250203', 'UCAYALI', 'PADRE ABAD', 'CURIMANA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('250301', 'UCAYALI', 'ATALAYA', 'RAIMONDI', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('250302', 'UCAYALI', 'ATALAYA', 'TAHUANIA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('250303', 'UCAYALI', 'ATALAYA', 'YURUA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('250304', 'UCAYALI', 'ATALAYA', 'SEPAHUA', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('250401', 'UCAYALI', 'PURUS', 'PURUS', 'PER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('910101', 'AFRICA', 'ARGELIA', 'ARGEL', 'DZA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('910102', 'AFRICA', 'ARGELIA', 'ORAN', 'DZA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('910103', 'AFRICA', 'ARGELIA', 'CONSTANTINA', 'DZA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('910104', 'AFRICA', 'ARGELIA', 'BATNA', 'DZA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('910105', 'AFRICA', 'ARGELIA', 'LAGHOUAT', 'DZA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('910106', 'AFRICA', 'ARGELIA', 'RELIZANE', 'DZA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('910107', 'AFRICA', 'ARGELIA', 'RELIZANE', 'DZA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('910201', 'AFRICA', 'COSTA DE MARFIL', 'ABYDJAN', 'CIV', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('910301', 'AFRICA', 'EGIPTO', 'ALEJANDRIA', 'EGY', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('910302', 'AFRICA', 'EGIPTO', 'EL CAIRO', 'EGY', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('910303', 'AFRICA', 'EGIPTO', 'AL-MINYA', 'EGY', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('910304', 'AFRICA', 'EGIPTO', 'PORT SAID', 'EGY', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('910305', 'AFRICA', 'EGIPTO', 'MENUFIA', 'EGY', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('910401', 'AFRICA', 'KENIA', 'NAIROBI', 'KEN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('910501', 'AFRICA', 'MARRUECOS', 'AGADIE', 'MAR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('910502', 'AFRICA', 'MARRUECOS', 'RABAT', 'MAR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('910503', 'AFRICA', 'MARRUECOS', 'AGADIR', 'MAR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('910504', 'AFRICA', 'MARRUECOS', 'CASABLANCA', 'MAR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('910505', 'AFRICA', 'MARRUECOS', 'SAFI', 'MAR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('910506', 'AFRICA', 'MARRUECOS', 'TETOUAN', 'MAR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('910507', 'AFRICA', 'MARRUECOS', 'TANGER', 'MAR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('910509', 'AFRICA', 'MARRUECOS', 'BENI MELLAL', 'MAR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('910510', 'AFRICA', 'MARRUECOS', 'CHAUIA UARDIGA', 'MAR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('910511', 'AFRICA', 'MARRUECOS', 'MEQUINEZ', 'MAR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('910512', 'AFRICA', 'MARRUECOS', 'FEZ', 'MAR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('910601', 'AFRICA', 'SUDAFRICA', 'CIUDAD DEL CABO', 'ZAF', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('910602', 'AFRICA', 'SUDAFRICA', 'EAST LONDON', 'ZAF', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('910603', 'AFRICA', 'SUDAFRICA', 'PRETORIA', 'ZAF', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('910604', 'AFRICA', 'SUDAFRICA', 'JOHANNESBURGO', 'ZAF', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('910605', 'AFRICA', 'SUDAFRICA', 'DURBAN', 'ZAF', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('910606', 'AFRICA', 'SUDAFRICA', 'EL CABO ORIENTAL', 'ZAF', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('910607', 'AFRICA', 'SUDAFRICA', 'MPUMALANGA', 'ZAF', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('910608', 'AFRICA', 'SUDAFRICA', 'ESTADO LIBRE', 'ZAF', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('910701', 'AFRICA', 'ZAMBIA', 'LUSAKA', 'ZMB', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('910702', 'AFRICA', 'ZAMBIA', 'COPPERBELT', 'ZMB', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('910703', 'AFRICA', 'ZAMBIA', 'KITWE', 'ZMB', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('910801', 'AFRICA', 'ZIMBABWE', 'HARARE', 'ZWE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('910901', 'AFRICA', 'TUNEZ', 'TUNEZ', 'TUN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('911001', 'AFRICA', 'SOMALIA', 'MOGADISCIO', 'SOM', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('911101', 'AFRICA', 'NIGERIA', 'ABUJA', 'NGA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('911102', 'AFRICA', 'NIGERIA', 'LAGOS', 'NGA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('911103', 'AFRICA', 'NIGERIA', 'ENUGU', 'NGA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('911104', 'AFRICA', 'NIGERIA', 'NIAMEY', 'NGA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('911201', 'AFRICA', 'GHANA', 'ACCRA', 'GHA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('911202', 'AFRICA', 'GHANA', 'WEST', 'GHA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('911301', 'AFRICA', 'ANGOLA', 'LUANDA', 'AGO', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('911302', 'AFRICA', 'ANGOLA', 'BENGUELA', 'AGO', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('911401', 'AFRICA', 'BURKINA FASO', 'UAGADUGU', 'BFA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('911501', 'AFRICA', 'REP. DEMOCRATICA DEL CONGO', 'BOMA', 'COD', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('911601', 'AFRICA', 'LIBIA', 'SIRTE', 'LBY', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('911602', 'AFRICA', 'LIBIA', 'TRIPOLI', 'LBY', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('911603', 'AFRICA', 'LIBIA', 'BENGASI', 'LBY', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('911701', 'AFRICA', 'MOZAMBIQUE', 'MAPUTO', 'MOZ', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('911702', 'AFRICA', 'MOZAMBIQUE', 'NAMPULA', 'MOZ', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('911703', 'AFRICA', 'MOZAMBIQUE', 'TETE', 'MOZ', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('911801', 'AFRICA', 'SUAZILANDIA', 'MBABANE', 'SWZ', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('911901', 'AFRICA', 'MADAGASCAR', 'ANTANANARIVO', 'MDG', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('912001', 'AFRICA', 'ETIOPIA', 'GONDER', 'ETH', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('912002', 'AFRICA', 'ETIOPIA', 'ADDIS ABEBA', 'ETH', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('912003', 'AFRICA', 'ETIOPIA', 'TIGRAY', 'ETH', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('912101', 'AFRICA', 'SENEGAL', 'DAKAR', 'SEN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('912112', 'AMERICA', 'PANAMA', 'SAN BLAS', 'PAN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('912201', 'AFRICA', 'GUINEA ECUATORIAL', 'BIOKO', 'GNQ', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('912202', 'AFRICA', 'GUINEA ECUATORIAL', 'BATA', 'GNQ', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('912301', 'AFRICA', 'CAMERUN', 'YAUNDE', 'CMR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('912302', 'AFRICA', 'CAMERUN', 'DOUALA', 'CMR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('912303', 'AFRICA', 'CAMERUN', 'BAFOUSSAM', 'CMR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('912401', 'AFRICA', 'REP. DEMOCRATICA DEL CONGO', 'KINSHASA', 'COD', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('912402', 'AFRICA', 'REP. DEMOCRATICA DEL CONGO', 'BRAZZAVILLE', 'COD', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('912403', 'AFRICA', 'REP. DEMOCRATICA DEL CONGO', 'KIVU SEPTENTRIONAL', 'COD', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('912404', 'AFRICA', 'REP. DEMOCRATICA DEL CONGO', 'LUBUMBASHI', 'COD', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('912501', 'AFRICA', 'BURUNDI', 'BUJUMBURA', 'BDI', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('912601', 'AFRICA', 'TANZANIA', 'DAR ES-SALAAM', 'TZA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('912602', 'AFRICA', 'TANZANIA', 'ZANZIBAR', 'TZA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('912701', 'AFRICA', 'GUINEA', 'KANKAN', 'GIN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('912702', 'AFRICA', 'GUINEA', 'NZEREKORE', 'GIN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('912801', 'AFRICA', 'SUDAN', 'JARTUM', 'SDN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('912901', 'AFRICA', 'MAURICIO', 'PORT LOUIS', 'MUS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('912902', 'AFRICA', 'MAURICIO', 'CUREPIPE', 'MUS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('912903', 'AFRICA', 'MAURICIO', 'BLACK RIVER', 'MUS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('913001', 'AFRICA', 'BOTSUANA', 'GABORONE', 'BWA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('913101', 'AFRICA', 'GABON', 'LIBREVILLE', 'GAB', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('913201', 'AFRICA', 'NAMIBIA', 'KEETMANSHOOP', 'NAM', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('913202', 'AFRICA', 'NAMIBIA', 'ERONGO', 'NAM', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('913301', 'AFRICA', 'REPUBLICA DEL CONGO', 'BRAZZAVILLE', 'COG', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('913401', 'AFRICA', 'MAURICIO', 'BANJUL', 'MUS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('913402', 'AFRICA', 'GAMBIA', 'BUNDUNG', 'GMB', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('913501', 'AFRICA', 'SIERRA LEONA', 'FREETOWN', 'SLE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('913601', 'AFRICA', 'REPUBLICA DE CABO VERDE', 'PRAIA', 'CPV', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('913602', 'AFRICA', 'REPUBLICA DE CABO VERDE', 'SANTIAGO', 'CPV', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('913603', 'AFRICA', 'REPUBLICA DE CABO VERDE', 'ILHA DO SAL', 'CPV', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('913801', 'AFRICA', 'NIGER', 'NIAMEY', 'NER', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920101', 'AMERICA', 'ANTILLAS HOLANDESAS', 'ARUBA', 'ANT', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920102', 'AMERICA', 'ANTILLAS HOLANDESAS', 'CURAZAO', 'ANT', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920103', 'AMERICA', 'ANTILLAS HOLANDESAS', 'ST MAARTEN', 'ANT', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920104', 'AMERICA', 'ANTILLAS HOLANDESAS', 'BONAIRE', 'ANT', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920201', 'AMERICA', 'ARGENTINA', 'BAHIA BLANCA', 'ARG', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920202', 'AMERICA', 'ARGENTINA', 'BUENOS AIRES', 'ARG', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920203', 'AMERICA', 'ARGENTINA', 'CORDOBA', 'ARG', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920204', 'AMERICA', 'ARGENTINA', 'CORRIENTES', 'ARG', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920205', 'AMERICA', 'ARGENTINA', 'LA PLATA', 'ARG', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920206', 'AMERICA', 'ARGENTINA', 'MENDOZA', 'ARG', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920207', 'AMERICA', 'ARGENTINA', 'ROSARIO DE SANTA FE', 'ARG', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920208', 'AMERICA', 'ARGENTINA', 'SALTA', 'ARG', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920209', 'AMERICA', 'ARGENTINA', 'TUCUMAN', 'ARG', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920210', 'AMERICA', 'ARGENTINA', 'SAN JUAN', 'ARG', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920211', 'AMERICA', 'ARGENTINA', 'CHACO', 'ARG', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920212', 'AMERICA', 'ARGENTINA', 'RIO NEGRO', 'ARG', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920213', 'AMERICA', 'ARGENTINA', 'CHUBUT', 'ARG', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920214', 'AMERICA', 'ARGENTINA', 'SANTA FE', 'ARG', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920215', 'AMERICA', 'ARGENTINA', 'ENTRE RIOS', 'ARG', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920216', 'AMERICA', 'ARGENTINA', 'JUJUY', 'ARG', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920217', 'AMERICA', 'ARGENTINA', 'MISIONES', 'ARG', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920218', 'AMERICA', 'ARGENTINA', 'NEUQUEN', 'ARG', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920219', 'AMERICA', 'ARGENTINA', 'SAN LUIS', 'ARG', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920220', 'AMERICA', 'ARGENTINA', 'LA PAMPA', 'ARG', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920221', 'AMERICA', 'ARGENTINA', 'SANTA CRUZ', 'ARG', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920222', 'AMERICA', 'ARGENTINA', 'SANTIAGO DEL ESTERO', 'ARG', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920223', 'AMERICA', 'ARGENTINA', 'FORMOSA', 'ARG', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920224', 'AMERICA', 'ARGENTINA', 'CATAMARCA', 'ARG', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920225', 'AMERICA', 'ARGENTINA', 'TIERRA DEL FUEGO', 'ARG', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920226', 'AMERICA', 'ARGENTINA', 'LA RIOJA', 'ARG', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920227', 'AMERICA', 'ARGENTINA', 'MAR DEL PLATA', 'ARG', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920301', 'AMERICA', 'BAHAMAS', 'NASSAU', 'BHS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920302', 'AMERICA', 'BAHAMAS', 'GRAN BAHAMA', 'BHS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920401', 'AMERICA', 'BOLIVIA', 'COCHABAMBA', 'BOL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920402', 'AMERICA', 'BOLIVIA', 'GUAQUI', 'BOL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920403', 'AMERICA', 'BOLIVIA', 'LA PAZ', 'BOL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920404', 'AMERICA', 'BOLIVIA', 'ORURO', 'BOL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920405', 'AMERICA', 'BOLIVIA', 'SANTA CRUZ', 'BOL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920406', 'AMERICA', 'BOLIVIA', 'BENI', 'BOL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920407', 'AMERICA', 'BOLIVIA', 'PANDO', 'BOL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920408', 'AMERICA', 'BOLIVIA', 'CHUQUISACA', 'BOL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920409', 'AMERICA', 'BOLIVIA', 'TARIJA', 'BOL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920410', 'AMERICA', 'BOLIVIA', 'POTOSI', 'BOL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920411', 'AMERICA', 'BOLIVIA', 'EL ALTO', 'BOL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920501', 'AMERICA', 'BRASIL', 'BELEN DO PARA', 'BRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920502', 'AMERICA', 'BRASIL', 'BELO HORIZONTE', 'BRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920503', 'AMERICA', 'BRASIL', 'BRASILIA', 'BRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920504', 'AMERICA', 'BRASIL', 'CURITIBA', 'BRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920505', 'AMERICA', 'BRASIL', 'MANAOS', 'BRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920506', 'AMERICA', 'BRASIL', 'PORTO ALEGRE', 'BRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920507', 'AMERICA', 'BRASIL', 'RECIFE', 'BRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920508', 'AMERICA', 'BRASIL', 'RIO BRANCO', 'BRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920509', 'AMERICA', 'BRASIL', 'RIO DE JANEIRO', 'BRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920510', 'AMERICA', 'BRASIL', 'SAO PAULO', 'BRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920511', 'AMERICA', 'BRASIL', 'SALVADOR', 'BRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920512', 'AMERICA', 'BRASIL', 'BAHIA', 'BRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920513', 'AMERICA', 'BRASIL', 'RONDONIA', 'BRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920514', 'AMERICA', 'BRASIL', 'CEARA', 'BRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920515', 'AMERICA', 'BRASIL', 'RIO GRANDE DEL SUR', 'BRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920517', 'AMERICA', 'BRASIL', 'PARAIBA', 'BRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920518', 'AMERICA', 'BRASIL', 'ESPIRITO SANTO', 'BRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920519', 'AMERICA', 'BRASIL', 'ALAGOAS', 'BRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920520', 'AMERICA', 'BRASIL', 'MINAS GERAIS', 'BRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920521', 'AMERICA', 'BRASIL', 'AMAZONAS', 'BRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920522', 'AMERICA', 'BRASIL', 'ACRE', 'BRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920523', 'AMERICA', 'BRASIL', 'PERNAMBUCO', 'BRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920524', 'AMERICA', 'BRASIL', 'RIO GRANDE DEL NORTE', 'BRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920525', 'AMERICA', 'BRASIL', 'RORAIMA', 'BRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920526', 'AMERICA', 'BRASIL', 'PARANA', 'BRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920527', 'AMERICA', 'BRASIL', 'SANTA CATALINA', 'BRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920528', 'AMERICA', 'BRASIL', 'MARANHAO', 'BRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920529', 'AMERICA', 'BRASIL', 'SERGIPE', 'BRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920530', 'AMERICA', 'BRASIL', 'PIAUI', 'BRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920531', 'AMERICA', 'BRASIL', 'TOCANTINS', 'BRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920532', 'AMERICA', 'BRASIL', 'GOIAS', 'BRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920533', 'AMERICA', 'BRASIL', 'PARÁ', 'BRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920534', 'AMERICA', 'BRASIL', 'MATO GROSSO', 'BRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920535', 'AMERICA', 'BRASIL', 'MATO GROSSO DO SUL', 'BRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920536', 'AMERICA', 'BRASIL', 'FORTALEZA', 'BRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920537', 'AMERICA', 'BRASIL', 'AMAPA', 'BRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920601', 'AMERICA', 'CANADA', 'MONTREAL', 'CAN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920602', 'AMERICA', 'CANADA', 'OTTAWA', 'CAN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920603', 'AMERICA', 'CANADA', 'TORONTO', 'CAN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920604', 'AMERICA', 'CANADA', 'VANCOUVER', 'CAN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920605', 'AMERICA', 'CANADA', 'MANITOBA', 'CAN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920606', 'AMERICA', 'CANADA', 'ONTARIO', 'CAN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920607', 'AMERICA', 'CANADA', 'SASKATCHEWAN', 'CAN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920608', 'AMERICA', 'CANADA', 'ALBERTA', 'CAN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920609', 'AMERICA', 'CANADA', 'QUEBEC', 'CAN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920610', 'AMERICA', 'CANADA', 'NUEVA ESCOCIA', 'CAN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920611', 'AMERICA', 'CANADA', 'TERRITORIO DEL NOROESTE', 'CAN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920612', 'AMERICA', 'CANADA', 'COLUMBIA BRITANICA', 'CAN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920613', 'AMERICA', 'CANADA', 'PRINCIPE EDUARDO', 'CAN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920614', 'AMERICA', 'CANADA', 'TERRANOVA', 'CAN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920615', 'AMERICA', 'CANADA', 'NUEVO BRUNSWICK', 'CAN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920701', 'AMERICA', 'COLOMBIA', 'BARRANQUILLA', 'COL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920702', 'AMERICA', 'COLOMBIA', 'BOGOTA', 'COL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920703', 'AMERICA', 'COLOMBIA', 'CALI', 'COL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920704', 'AMERICA', 'COLOMBIA', 'BOLIVAR', 'COL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920705', 'AMERICA', 'COLOMBIA', 'LETICIA', 'COL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920706', 'AMERICA', 'COLOMBIA', 'MEDELLIN', 'COL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920707', 'AMERICA', 'COLOMBIA', 'SANTA MARIA', 'COL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920708', 'AMERICA', 'COLOMBIA', 'MANIZALES', 'COL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920709', 'AMERICA', 'COLOMBIA', 'SANTANDER', 'COL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920710', 'AMERICA', 'COLOMBIA', 'VALLE', 'COL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920711', 'AMERICA', 'COLOMBIA', 'BOYACA', 'COL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920712', 'AMERICA', 'COLOMBIA', 'TOLIMA', 'COL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920713', 'AMERICA', 'COLOMBIA', 'NORTE DE SANTANDER', 'COL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920714', 'AMERICA', 'COLOMBIA', 'CALDAS', 'COL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920715', 'AMERICA', 'COLOMBIA', 'MAGDALENA', 'COL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920716', 'AMERICA', 'COLOMBIA', 'RISARALDA', 'COL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920717', 'AMERICA', 'COLOMBIA', 'NARIÑO', 'COL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920718', 'AMERICA', 'COLOMBIA', 'ANTIOQUIA', 'COL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920719', 'AMERICA', 'COLOMBIA', 'AMAZONAS', 'COL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920720', 'AMERICA', 'COLOMBIA', 'CASANARE', 'COL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920721', 'AMERICA', 'COLOMBIA', 'CUNDINAMARCA', 'COL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920722', 'AMERICA', 'COLOMBIA', 'HUILA', 'COL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920723', 'AMERICA', 'COLOMBIA', 'META', 'COL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920724', 'AMERICA', 'COLOMBIA', 'CORDOBA', 'COL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920725', 'AMERICA', 'COLOMBIA', 'CESAR', 'COL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920726', 'AMERICA', 'COLOMBIA', 'CHOCO', 'COL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920727', 'AMERICA', 'COLOMBIA', 'SUCRE', 'COL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920728', 'AMERICA', 'COLOMBIA', 'VICHADA', 'COL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920729', 'AMERICA', 'COLOMBIA', 'ARAUCA', 'COL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920730', 'AMERICA', 'COLOMBIA', 'POPAYAN', 'COL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920731', 'AMERICA', 'COLOMBIA', 'CAQUETA', 'COL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920732', 'AMERICA', 'COLOMBIA', 'CUCUTA', 'COL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920733', 'AMERICA', 'COLOMBIA', 'QUINDIO', 'COL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920734', 'AMERICA', 'COLOMBIA', 'VAUPES', 'COL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920735', 'AMERICA', 'COLOMBIA', 'GUAINIA', 'COL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920736', 'AMERICA', 'COLOMBIA', 'PUTUMAYO', 'COL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920737', 'AMERICA', 'COLOMBIA', 'CARTAGENA', 'COL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920738', 'AMERICA', 'COLOMBIA', 'GUAVIARE', 'COL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920739', 'AMERICA', 'COLOMBIA', 'LA GUAJIRA', 'COL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920740', 'AMERICA', 'COLOMBIA', 'CAUCA', 'COL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920741', 'AMERICA', 'COLOMBIA', 'SAN ANDRES', 'COL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920801', 'AMERICA', 'COSTA RICA', 'LIMON', 'CRI', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920802', 'AMERICA', 'COSTA RICA', 'PUNTARENAS', 'CRI', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920803', 'AMERICA', 'COSTA RICA', 'SAN JOSE', 'CRI', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920804', 'AMERICA', 'COSTA RICA', 'GUANACASTE', 'CRI', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920805', 'AMERICA', 'COSTA RICA', 'CARTAGO', 'CRI', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920806', 'AMERICA', 'COSTA RICA', 'ALAJUELA', 'CRI', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920807', 'AMERICA', 'COSTA RICA', 'TURRIALBA', 'CRI', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920808', 'AMERICA', 'COSTA RICA', 'HEREDIA', 'CRI', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920901', 'AMERICA', 'CUBA', 'LA HABANA', 'CUB', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920902', 'AMERICA', 'CUBA', 'CAMAGUEY', 'CUB', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920903', 'AMERICA', 'CUBA', 'SANTIAGO DE CUBA', 'CUB', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920904', 'AMERICA', 'CUBA', 'CARDENAS', 'CUB', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920905', 'AMERICA', 'CUBA', 'MATANZAS', 'CUB', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920906', 'AMERICA', 'CUBA', 'VILLA CLARA', 'CUB', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920907', 'AMERICA', 'CUBA', 'GRANMA', 'CUB', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920908', 'AMERICA', 'CUBA', 'PINAR DEL RIO', 'CUB', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920909', 'AMERICA', 'CUBA', 'SANCTI SPIRITUS', 'CUB', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920910', 'AMERICA', 'CUBA', 'CIENFUEGOS', 'CUB', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920911', 'AMERICA', 'CUBA', 'ISLA DE LA JUVENTUD', 'CUB', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920912', 'AMERICA', 'CUBA', 'LAS TUNAS', 'CUB', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920913', 'AMERICA', 'CUBA', 'GUANTANAMO', 'CUB', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920914', 'AMERICA', 'CUBA', 'HOLGUIN', 'CUB', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('920915', 'AMERICA', 'CUBA', 'CIEGO DE AVILA', 'CUB', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921001', 'AMERICA', 'CHILE', 'ANTOFAGASTA', 'CHL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921002', 'AMERICA', 'CHILE', 'ARICA', 'CHL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921003', 'AMERICA', 'CHILE', 'CONCEPCION', 'CHL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921004', 'AMERICA', 'CHILE', 'COQUIMBO', 'CHL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921005', 'AMERICA', 'CHILE', 'IQUIQUE', 'CHL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921006', 'AMERICA', 'CHILE', 'SANTIAGO', 'CHL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921007', 'AMERICA', 'CHILE', 'VALPARAISO', 'CHL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921008', 'AMERICA', 'CHILE', 'LOS LAGOS', 'CHL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921009', 'AMERICA', 'CHILE', 'LA ARAUCANIA', 'CHL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921010', 'AMERICA', 'CHILE', 'O HIGGINS', 'CHL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921011', 'AMERICA', 'CHILE', 'ACONCAGUA', 'CHL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921012', 'AMERICA', 'CHILE', 'MAULE', 'CHL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921013', 'AMERICA', 'CHILE', 'MAGALLANES', 'CHL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921014', 'AMERICA', 'CHILE', 'BIOBIO', 'CHL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921015', 'AMERICA', 'CHILE', 'TARAPACA', 'CHL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921016', 'AMERICA', 'CHILE', 'LONGOTOMA', 'CHL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921017', 'AMERICA', 'CHILE', 'LINARES', 'CHL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921018', 'AMERICA', 'CHILE', 'NUBLE', 'CHL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921019', 'AMERICA', 'CHILE', 'PISAGUA', 'CHL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921020', 'AMERICA', 'CHILE', 'ATACAMA', 'CHL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921021', 'AMERICA', 'CHILE', 'REGION METROPOLITANA', 'CHL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921022', 'AMERICA', 'CHILE', 'MALLECO', 'CHL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921023', 'AMERICA', 'CHILE', 'LOS ANDES', 'CHL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921024', 'AMERICA', 'CHILE', 'AISEN', 'CHL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921025', 'AMERICA', 'CHILE', 'LOS RIOS', 'CHL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921026', 'AMERICA', 'CHILE', 'COPIAPO', 'CHL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921101', 'AMERICA', 'ECUADOR', 'GUAYAQUIL', 'ECU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921102', 'AMERICA', 'ECUADOR', 'LOJA', 'ECU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921103', 'AMERICA', 'ECUADOR', 'MACARA', 'ECU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921104', 'AMERICA', 'ECUADOR', 'MACHALA', 'ECU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921105', 'AMERICA', 'ECUADOR', 'QUITO', 'ECU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921106', 'AMERICA', 'ECUADOR', 'ESMERALDAS', 'ECU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921107', 'AMERICA', 'ECUADOR', 'MANABI', 'ECU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921108', 'AMERICA', 'ECUADOR', 'CHIMBORAZO', 'ECU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921109', 'AMERICA', 'ECUADOR', 'LOS RIOS', 'ECU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921110', 'AMERICA', 'ECUADOR', 'AZUAY', 'ECU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921111', 'AMERICA', 'ECUADOR', 'EL ORO', 'ECU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921112', 'AMERICA', 'ECUADOR', 'GUAYAS', 'ECU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921113', 'AMERICA', 'ECUADOR', 'TUNGURAHUA', 'ECU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921114', 'AMERICA', 'ECUADOR', 'CARCHI', 'ECU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921115', 'AMERICA', 'ECUADOR', 'IMBABURA', 'ECU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921116', 'AMERICA', 'ECUADOR', 'CAÑAR', 'ECU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921117', 'AMERICA', 'ECUADOR', 'PICHINCHA', 'ECU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921118', 'AMERICA', 'ECUADOR', 'ZAMORA CHINCHIPE', 'ECU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921119', 'AMERICA', 'ECUADOR', 'GALAPAGOS', 'ECU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921120', 'AMERICA', 'ECUADOR', 'COTOPAXI', 'ECU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921121', 'AMERICA', 'ECUADOR', 'PASTAZA', 'ECU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921122', 'AMERICA', 'ECUADOR', 'BOLIVAR', 'ECU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921123', 'AMERICA', 'ECUADOR', 'MORONA SANTIAGO', 'ECU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921124', 'AMERICA', 'ECUADOR', 'NAPO', 'ECU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921125', 'AMERICA', 'ECUADOR', 'SUCUMBIOS', 'ECU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921126', 'AMERICA', 'ECUADOR', 'SANTA ELENA', 'ECU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921127', 'AMERICA', 'ECUADOR', 'SANTO DOMINGO DE LOS TSACHILAS', 'ECU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921128', 'AMERICA', 'ECUADOR', 'ORELLANA', 'ECU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921201', 'AMERICA', 'EL SALVADOR', 'SAN SALVADOR', 'SLV', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921202', 'AMERICA', 'EL SALVADOR', 'SANTA ANA', 'SLV', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921203', 'AMERICA', 'EL SALVADOR', 'LA UNION', 'SLV', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921204', 'AMERICA', 'EL SALVADOR', 'CABAÑAS', 'SLV', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921205', 'AMERICA', 'EL SALVADOR', 'SAN MIGUEL', 'SLV', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921206', 'AMERICA', 'EL SALVADOR', 'LA PAZ', 'SLV', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921207', 'AMERICA', 'EL SALVADOR', 'LA LIBERTAD', 'SLV', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921208', 'AMERICA', 'EL SALVADOR', 'AHUACHAPAN', 'SLV', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921209', 'AMERICA', 'EL SALVADOR', 'SONSONATE', 'SLV', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921210', 'AMERICA', 'EL SALVADOR', 'USULTAN', 'SLV', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921211', 'AMERICA', 'EL SALVADOR', 'CHALATENANGO', 'SLV', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921301', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'GEORGIA', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921302', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'BALTIMORE', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921303', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'BOSTON', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921304', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'CHICAGO', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921305', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'CINCINNATI', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921306', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'CORAL GABLES (FLORIDA)', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921307', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'NUEVO MEXICO', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921308', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'DENVER', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921309', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'INDIANA', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921310', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'FORT LAUDERDALE', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921311', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'TENNESSEE', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921312', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'HONOLULU', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921313', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'HOUSTON', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921314', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'ALABAMA', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921315', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'LOS ANGELES', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921316', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'MINNESOTA', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921317', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'MIAMI', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921318', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'NUEVA ORLEANS', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921319', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'NUEVA YORK', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921320', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'ORLANDO', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921321', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'PITTSBURGH', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921322', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'OKLAHOMA', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921323', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'SAN ANTONIO', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921324', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'SAN DIEGO', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921325', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'SAN FRANCISCO', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921326', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'SAN LOUIS', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921327', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'SANTA BARBARA', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921328', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'SEATLE', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921329', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'TUCSON', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921330', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'TULSA', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921331', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'WASHINGTON D. C.', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921332', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'PATERSON', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921333', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'CONNECTICUT', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921334', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'OREGON', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921335', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'NUEVA JERSEY', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921336', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'PENNSYLVANIA', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921337', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'UTAH', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921338', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'KANSAS', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921339', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'CALIFORNIA', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921340', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'OHIO', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921341', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'TEXAS', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921342', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'VIRGINIA', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921343', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'FLORIDA', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921344', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'MARYLAND', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921345', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'WISCONSIN', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921346', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'KENTUCKY', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921347', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'ILLINOIS', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921348', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'MICHIGAN', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921349', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'MISSOURI', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921350', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'CAROLINA DEL NORTE', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921351', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'IOWA', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921352', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'LOUISIANA', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921353', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'DAKOTA DEL SUR', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921354', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'RHODE ISLAND', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921355', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'WASHINGTON', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921356', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'ARIZONA', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921357', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'MASSACHUSETTS', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921358', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'COLORADO', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921359', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'NEBRASKA', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921360', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'WYOMING', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921361', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'DELAWARE', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921362', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'ARKANSAS', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921363', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'MONTANA', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921364', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'TAMPA', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921365', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'LAS VEGAS', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921366', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'VIRGINIA DEL OESTE', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921367', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'CAROLINA DEL SUR', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921368', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'DAKOTA DEL NORTE', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921369', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'MAINE', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921370', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'ALASKA', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921371', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'JACKSONVILLE', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921372', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'PHOENIX', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921373', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'DALLAS', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921374', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'SALT LAKE CITY', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921375', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'SACRAMENTO', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921376', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'AUSTIN', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921377', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'NEW HAMPSHIRE', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921378', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'NEVADA', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921379', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'IDAHO', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921380', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'FILADELFIA', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921381', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'ATLANTA', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921382', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'GUAM', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921383', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'MISSISSIPPI', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921384', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'VERMONT', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921385', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'HARTFORD', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921386', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'ISLAS MARIANAS DEL NORTE', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921387', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'ISLAS VIRGENES', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921388', 'AMERICA', 'ESTADOS UNIDOS DE AMERICA', 'HAWAII', 'USA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921501', 'AMERICA', 'GUATEMALA', 'GUATEMALA', 'GTM', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921502', 'AMERICA', 'GUATEMALA', 'ESCUINTLA', 'GTM', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921503', 'AMERICA', 'GUATEMALA', 'QUETZALTENANGO', 'GTM', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921504', 'AMERICA', 'GUATEMALA', 'SACATEPEQUEZ', 'GTM', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921505', 'AMERICA', 'GUATEMALA', 'IZABAL', 'GTM', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921506', 'AMERICA', 'GUATEMALA', 'JALAPA', 'GTM', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921507', 'AMERICA', 'GUATEMALA', 'SUCHITEPEQUEZ', 'GTM', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921601', 'AMERICA', 'HAITI', 'PUERTO PRINCIPE', 'HTI', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921602', 'AMERICA', 'HAITI', 'ARTIBONITO', 'HTI', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921701', 'AMERICA', 'HONDURAS', 'TEGUCIGALPA', 'HND', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921702', 'AMERICA', 'HONDURAS', 'COPAN', 'HND', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921703', 'AMERICA', 'HONDURAS', 'CORTES', 'HND', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921704', 'AMERICA', 'HONDURAS', 'VALLE', 'HND', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921705', 'AMERICA', 'HONDURAS', 'YORO', 'HND', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921706', 'AMERICA', 'HONDURAS', 'FRANCISCO MORAZAN', 'HND', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921707', 'AMERICA', 'HONDURAS', 'LA CEIBA', 'HND', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921708', 'AMERICA', 'HONDURAS', 'SAN PEDRO DE SULA', 'HND', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921709', 'AMERICA', 'HONDURAS', 'OLANCHO', 'HND', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921710', 'AMERICA', 'HONDURAS', 'ATLANTIDA', 'HND', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921711', 'AMERICA', 'HONDURAS', 'COMAYAGUA', 'HND', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921712', 'AMERICA', 'HONDURAS', 'SANTA BARBARA', 'HND', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921713', 'AMERICA', 'HONDURAS', 'CHOLUTECA', 'HND', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921801', 'AMERICA', 'JAMAICA', 'KINGSTON', 'JAM', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921901', 'AMERICA', 'MEXICO', 'GUADALAJARA', 'MEX', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921902', 'AMERICA', 'MEXICO', 'MEXICO D.F.', 'MEX', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921903', 'AMERICA', 'MEXICO', 'MONTERREY', 'MEX', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921904', 'AMERICA', 'MEXICO', 'COAHUILA', 'MEX', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921905', 'AMERICA', 'MEXICO', 'CHIHUAHUA', 'MEX', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921906', 'AMERICA', 'MEXICO', 'MICHOACAN', 'MEX', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921907', 'AMERICA', 'MEXICO', 'SONORA', 'MEX', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921908', 'AMERICA', 'MEXICO', 'PUEBLA', 'MEX', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921909', 'AMERICA', 'MEXICO', 'SAN LUIS POTOSI', 'MEX', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921910', 'AMERICA', 'MEXICO', 'TABASCO', 'MEX', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921911', 'AMERICA', 'MEXICO', 'VERACRUZ', 'MEX', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921912', 'AMERICA', 'MEXICO', 'NUEVO LEON', 'MEX', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921913', 'AMERICA', 'MEXICO', 'YUCATAN', 'MEX', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921914', 'AMERICA', 'MEXICO', 'GUANAJUATO', 'MEX', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921915', 'AMERICA', 'MEXICO', 'OAXACA', 'MEX', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921916', 'AMERICA', 'MEXICO', 'CHIAPAS', 'MEX', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921917', 'AMERICA', 'MEXICO', 'SINALOA', 'MEX', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921918', 'AMERICA', 'MEXICO', 'TAMAULIPAS', 'MEX', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921919', 'AMERICA', 'MEXICO', 'MORELOS', 'MEX', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921920', 'AMERICA', 'MEXICO', 'BAJA CALIFORNIA NORTE', 'MEX', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921921', 'AMERICA', 'MEXICO', 'HIDALGO', 'MEX', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921922', 'AMERICA', 'MEXICO', 'CAMPECHE', 'MEX', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921923', 'AMERICA', 'MEXICO', 'CANCUN', 'MEX', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921924', 'AMERICA', 'MEXICO', 'BAJA CALIFORNIA SUR', 'MEX', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921925', 'AMERICA', 'MEXICO', 'QUERETARO', 'MEX', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921926', 'AMERICA', 'MEXICO', 'GUERRERO', 'MEX', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921927', 'AMERICA', 'MEXICO', 'AGUASCALIENTES', 'MEX', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921928', 'AMERICA', 'MEXICO', 'NAYARIT', 'MEX', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921929', 'AMERICA', 'MEXICO', 'JALISCO', 'MEX', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921930', 'AMERICA', 'MEXICO', 'MEXICO', 'MEX', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921931', 'AMERICA', 'MEXICO', 'QUINTANA ROO', 'MEX', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921932', 'AMERICA', 'MEXICO', 'ZACATECAS', 'MEX', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921933', 'AMERICA', 'MEXICO', 'COLIMA', 'MEX', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921934', 'AMERICA', 'MEXICO', 'DURANGO', 'MEX', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('921935', 'AMERICA', 'MEXICO', 'TLAXCALA', 'MEX', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922001', 'AMERICA', 'NICARAGUA', 'MANAGUA', 'NIC', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922002', 'AMERICA', 'NICARAGUA', 'CHONTALES', 'NIC', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922003', 'AMERICA', 'NICARAGUA', 'ZELAYA', 'NIC', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922004', 'AMERICA', 'NICARAGUA', 'LEON', 'NIC', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922005', 'AMERICA', 'NICARAGUA', 'RIVAS', 'NIC', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922006', 'AMERICA', 'NICARAGUA', 'ESTELI', 'NIC', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922007', 'AMERICA', 'NICARAGUA', 'CHINANDEGA', 'NIC', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922008', 'AMERICA', 'NICARAGUA', 'JINOTEPE', 'NIC', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922009', 'AMERICA', 'NICARAGUA', 'PUERTO CABEZAS', 'NIC', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922010', 'AMERICA', 'NICARAGUA', 'MATAGALPA', 'NIC', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922011', 'AMERICA', 'NICARAGUA', 'MASAYA', 'NIC', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922012', 'AMERICA', 'NICARAGUA', 'GRANADA', 'NIC', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922013', 'AMERICA', 'NICARAGUA', 'ATLANTICO SUR', 'NIC', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922014', 'AMERICA', 'NICARAGUA', 'CARAZO', 'NIC', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922015', 'AMERICA', 'NICARAGUA', 'JINOTEGA', 'NIC', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922101', 'AMERICA', 'PANAMA', 'PANAMA', 'PAN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922102', 'AMERICA', 'PANAMA', 'DAVID', 'PAN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922103', 'AMERICA', 'PANAMA', 'COLON', 'PAN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922104', 'AMERICA', 'PANAMA', 'CHIRIQUI', 'PAN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922105', 'AMERICA', 'PANAMA', 'HERRERA', 'PAN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922106', 'AMERICA', 'PANAMA', 'SAN MIGUELITO', 'PAN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922107', 'AMERICA', 'PANAMA', 'COCLE', 'PAN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922108', 'AMERICA', 'PANAMA', 'VERAGUAS', 'PAN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922109', 'AMERICA', 'PANAMA', 'LOS SANTOS', 'PAN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922110', 'AMERICA', 'PANAMA', 'DARIEN', 'PAN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922111', 'AMERICA', 'PANAMA', 'BOCAS DEL TORO', 'PAN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922112', 'AMERICA', 'PANAMA', 'SAN BLAS', 'PAN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922201', 'AMERICA', 'PARAGUAY', 'ASUNCION', 'PRY', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922202', 'AMERICA', 'PARAGUAY', 'BOQUERON', 'PRY', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922203', 'AMERICA', 'PARAGUAY', 'CAAZAPA', 'PRY', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922204', 'AMERICA', 'PARAGUAY', 'ITAPUA', 'PRY', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922205', 'AMERICA', 'PARAGUAY', 'CENTRAL', 'PRY', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922206', 'AMERICA', 'PARAGUAY', 'ÑEEMBUCU', 'PRY', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922207', 'AMERICA', 'PARAGUAY', 'PARAGUARI', 'PRY', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922208', 'AMERICA', 'PARAGUAY', 'AMAMBAY', 'PRY', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922209', 'AMERICA', 'PARAGUAY', 'LA CORDILLERA', 'PRY', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922210', 'AMERICA', 'PARAGUAY', 'ALTO PARANA', 'PRY', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922211', 'AMERICA', 'PARAGUAY', 'CAAGUAZU', 'PRY', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922212', 'AMERICA', 'PARAGUAY', 'MISIONES', 'PRY', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922213', 'AMERICA', 'PARAGUAY', 'CANINDEYU', 'PRY', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922214', 'AMERICA', 'PARAGUAY', 'GUAIRA', 'PRY', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922215', 'AMERICA', 'PARAGUAY', 'CONCEPCION', 'PRY', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922216', 'AMERICA', 'PARAGUAY', 'SAN PEDRO', 'PRY', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922301', 'AMERICA', 'PUERTO RICO', 'CAGUAS', 'PRI', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922302', 'AMERICA', 'PUERTO RICO', 'PONCE', 'PRI', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922303', 'AMERICA', 'PUERTO RICO', 'SAN JUAN', 'PRI', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922304', 'AMERICA', 'PUERTO RICO', 'MOCA', 'PRI', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922305', 'AMERICA', 'PUERTO RICO', 'RIO GRANDE', 'PRI', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922306', 'AMERICA', 'PUERTO RICO', 'AIBONITO', 'PRI', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922307', 'AMERICA', 'PUERTO RICO', 'MAYAGÜEZ', 'PRI', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922308', 'AMERICA', 'PUERTO RICO', 'HORMIGUEROS', 'PRI', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922309', 'AMERICA', 'PUERTO RICO', 'ARECIBO', 'PRI', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922310', 'AMERICA', 'PUERTO RICO', 'HUMACAO', 'PRI', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922311', 'AMERICA', 'PUERTO RICO', 'BAYAMON', 'PRI', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922312', 'AMERICA', 'PUERTO RICO', 'MANATI', 'PRI', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922313', 'AMERICA', 'PUERTO RICO', 'AGUADILLA', 'PRI', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922314', 'AMERICA', 'PUERTO RICO', 'GUAYNABO', 'PRI', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922401', 'AMERICA', 'REPUBLICA DOMINICANA', 'SANTO DOMINGO', 'DOM', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922402', 'AMERICA', 'REPUBLICA DOMINICANA', 'SANTIAGO RODRIGUEZ', 'DOM', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922403', 'AMERICA', 'REPUBLICA DOMINICANA', 'SANTIAGO DE LOS CABALLEROS', 'DOM', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922404', 'AMERICA', 'REPUBLICA DOMINICANA', 'SAN PEDRO DE MACORIS', 'DOM', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922405', 'AMERICA', 'REPUBLICA DOMINICANA', 'PUERTO PLATA', 'DOM', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922406', 'AMERICA', 'REPUBLICA DOMINICANA', 'LA ALTAGRACIA', 'DOM', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922407', 'AMERICA', 'REPUBLICA DOMINICANA', 'AZUA', 'DOM', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922408', 'AMERICA', 'REPUBLICA DOMINICANA', 'SAN CRISTOBAL', 'DOM', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922409', 'AMERICA', 'REPUBLICA DOMINICANA', 'LA VEGA', 'DOM', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922410', 'AMERICA', 'REPUBLICA DOMINICANA', 'SAN JOSE DE OCOA', 'DOM', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922411', 'AMERICA', 'REPUBLICA DOMINICANA', 'DAJABON', 'DOM', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922412', 'AMERICA', 'REPUBLICA DOMINICANA', 'SAN JUAN', 'DOM', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922413', 'AMERICA', 'REPUBLICA DOMINICANA', 'SAN FRANCISCO DE MACORIS', 'DOM', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922414', 'AMERICA', 'REPUBLICA DOMINICANA', 'LA ROMANA', 'DOM', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922415', 'AMERICA', 'REPUBLICA DOMINICANA', 'SAMANA', 'DOM', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922416', 'AMERICA', 'REPUBLICA DOMINICANA', 'MARIA TRINIDAD SANCHEZ', 'DOM', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922417', 'AMERICA', 'REPUBLICA DOMINICANA', 'MONSEÑOR NOUEL', 'DOM', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922418', 'AMERICA', 'REPUBLICA DOMINICANA', 'PERAVIA', 'DOM', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922501', 'AMERICA', 'SURINAM', 'PARANARIBO', 'SUR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922601', 'AMERICA', 'TRINIDAD Y TOBAGO', 'PUERTO ESPAÑA', 'TTO', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922602', 'AMERICA', 'TRINIDAD Y TOBAGO', 'SAN FERNANDO', 'TTO', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922603', 'AMERICA', 'TRINIDAD Y TOBAGO', 'TOBAGO', 'TTO', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922701', 'AMERICA', 'URUGUAY', 'MONTEVIDEO', 'URY', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922702', 'AMERICA', 'URUGUAY', 'SAN JOSE', 'URY', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922703', 'AMERICA', 'URUGUAY', 'PAYSANDU', 'URY', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922704', 'AMERICA', 'URUGUAY', 'COLONIA', 'URY', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922705', 'AMERICA', 'URUGUAY', 'TREINTA Y TRES', 'URY', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922706', 'AMERICA', 'URUGUAY', 'RIVERA', 'URY', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922707', 'AMERICA', 'URUGUAY', 'SALTO', 'URY', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922708', 'AMERICA', 'URUGUAY', 'DURAZNO', 'URY', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922709', 'AMERICA', 'URUGUAY', 'ROCHA', 'URY', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922710', 'AMERICA', 'URUGUAY', 'MALDONADO', 'URY', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922711', 'AMERICA', 'URUGUAY', 'RIO NEGRO', 'URY', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922712', 'AMERICA', 'URUGUAY', 'CANELONES', 'URY', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922713', 'AMERICA', 'URUGUAY', 'FLORIDA', 'URY', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922714', 'AMERICA', 'URUGUAY', 'CERRO LARGO', 'URY', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922715', 'AMERICA', 'URUGUAY', 'ARTIGAS', 'URY', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922716', 'AMERICA', 'URUGUAY', 'TACUAREMBO', 'URY', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922717', 'AMERICA', 'URUGUAY', 'FLORES', 'URY', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922718', 'AMERICA', 'URUGUAY', 'SORIANO', 'URY', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922719', 'AMERICA', 'URUGUAY', 'LAVALLEJA', 'URY', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922801', 'AMERICA', 'VENEZUELA', 'BARQUISIMETO', 'VEN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922802', 'AMERICA', 'VENEZUELA', 'CARACAS', 'VEN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922803', 'AMERICA', 'VENEZUELA', 'LA GUAIRA', 'VEN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922804', 'AMERICA', 'VENEZUELA', 'MARACAIBO', 'VEN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922805', 'AMERICA', 'VENEZUELA', 'PUERTO ORDAZ', 'VEN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922806', 'AMERICA', 'VENEZUELA', 'BOLIVAR', 'VEN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922807', 'AMERICA', 'VENEZUELA', 'CARABOBO', 'VEN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922808', 'AMERICA', 'VENEZUELA', 'ARAGUA', 'VEN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922809', 'AMERICA', 'VENEZUELA', 'ANZOATEGUI', 'VEN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922810', 'AMERICA', 'VENEZUELA', 'MERIDA', 'VEN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922811', 'AMERICA', 'VENEZUELA', 'PORTUGUESA', 'VEN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922812', 'AMERICA', 'VENEZUELA', 'BARINAS', 'VEN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922813', 'AMERICA', 'VENEZUELA', 'ZULIA', 'VEN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922814', 'AMERICA', 'VENEZUELA', 'LARA', 'VEN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922815', 'AMERICA', 'VENEZUELA', 'TACHIRA', 'VEN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922816', 'AMERICA', 'VENEZUELA', 'MIRANDA', 'VEN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922817', 'AMERICA', 'VENEZUELA', 'MONAGAS', 'VEN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922818', 'AMERICA', 'VENEZUELA', 'SUCRE', 'VEN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922819', 'AMERICA', 'VENEZUELA', 'NUEVA ESPARTA', 'VEN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922820', 'AMERICA', 'VENEZUELA', 'FALCON', 'VEN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922821', 'AMERICA', 'VENEZUELA', 'APURE', 'VEN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922822', 'AMERICA', 'VENEZUELA', 'YARACUY', 'VEN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922823', 'AMERICA', 'VENEZUELA', 'GUARICO', 'VEN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922824', 'AMERICA', 'VENEZUELA', 'VARGAS', 'VEN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922825', 'AMERICA', 'VENEZUELA', 'TRUJILLO', 'VEN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922826', 'AMERICA', 'VENEZUELA', 'AMAZONAS', 'VEN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922827', 'AMERICA', 'VENEZUELA', 'COJEDES', 'VEN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922828', 'AMERICA', 'VENEZUELA', 'DELTA AMACURO', 'VEN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922901', 'AMERICA', 'BARBADOS', 'BRIDGETOWN', 'BRB', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('922902', 'AMERICA', 'BARBADOS', 'ST. MICHAEL', 'BRB', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('923001', 'AMERICA', 'GUAYANA FRANCESA', 'CAYENA', 'GUF', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('923002', 'AMERICA', 'GUAYANA FRANCESA', 'KURU', 'GUF', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('923003', 'AMERICA', 'GUAYANA FRANCESA', 'ST. LAURENT', 'GUF', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('923101', 'AMERICA', 'GUYANA', 'GEORGETOWN', 'GUY', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('923201', 'AMERICA', 'BELICE', 'BELICE', 'BLZ', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('923501', 'AMERICA', 'SANTA LUCIA', 'CASTRIES', 'LCA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('923601', 'AMERICA', 'ISLAS CAIMAN', 'GEORGE TOWN', 'CYM', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('923701', 'AMERICA', 'ANTIGUA Y BARBUDA', 'SAINT JOHNS', 'ATG', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930101', 'ASIA', 'COREA DEL SUR', 'SEUL', 'KOR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930102', 'ASIA', 'COREA DEL SUR', 'SUNG DONG KU', 'KOR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930103', 'ASIA', 'COREA DEL SUR', 'JUMBOOK', 'KOR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930104', 'ASIA', 'COREA DEL SUR', 'KYONGGI-DO', 'KOR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930105', 'ASIA', 'COREA DEL SUR', 'CHUNGCHONG-NAMDO', 'KOR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930106', 'ASIA', 'COREA DEL SUR', 'TAEGU', 'KOR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930107', 'ASIA', 'COREA DEL SUR', 'TAEJON', 'KOR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930108', 'ASIA', 'COREA DEL SUR', 'BUSAN', 'KOR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930109', 'ASIA', 'COREA DEL SUR', 'INCHEON', 'KOR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930110', 'ASIA', 'COREA DEL SUR', 'ULSAN', 'KOR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930111', 'ASIA', 'COREA DEL SUR', 'GYEONGSANG MERIDIONAL', 'KOR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930112', 'ASIA', 'COREA DEL SUR', 'CHUNGCHEONG SEPTENTRIONAL', 'KOR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930201', 'ASIA', 'CHINA', 'BEIJING (PEKIN)', 'CHN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930202', 'ASIA', 'CHINA', 'CANTON', 'CHN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930203', 'ASIA', 'CHINA', 'GUANCHONG', 'CHN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930204', 'ASIA', 'CHINA', 'GUANGDONG', 'CHN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930205', 'ASIA', 'CHINA', 'JIAN', 'CHN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930206', 'ASIA', 'CHINA', 'SHANGHAI', 'CHN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930207', 'ASIA', 'CHINA', 'JIANGSU', 'CHN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930208', 'ASIA', 'CHINA', 'LIAONING', 'CHN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930209', 'ASIA', 'CHINA', 'FUJIAN', 'CHN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930210', 'ASIA', 'CHINA', 'GUIZHOU', 'CHN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930211', 'ASIA', 'CHINA', 'KUANGTUNG', 'CHN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930212', 'ASIA', 'CHINA', 'SICHUAN', 'CHN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930214', 'ASIA', 'CHINA', 'HUPEI', 'CHN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930215', 'ASIA', 'CHINA', 'HUNAN', 'CHN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930216', 'ASIA', 'CHINA', 'JIANGXI', 'CHN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930217', 'ASIA', 'CHINA', 'CHUNG - SHAN', 'CHN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930218', 'ASIA', 'CHINA', 'HENAN', 'CHN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930219', 'ASIA', 'CHINA', 'GUANGXI ZHUANG', 'CHN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930220', 'ASIA', 'CHINA', 'ZHEJIANG', 'CHN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930221', 'ASIA', 'CHINA', 'SHANDONG', 'CHN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930222', 'ASIA', 'CHINA', 'TIANJIN (TIENTSIN)', 'CHN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930223', 'ASIA', 'CHINA', 'SHAANXI', 'CHN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930224', 'ASIA', 'CHINA', 'HAINAN', 'CHN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930225', 'ASIA', 'CHINA', 'XINJIANG', 'CHN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930226', 'ASIA', 'CHINA', 'HONG KONG', 'CHN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930227', 'ASIA', 'CHINA', 'MACAO', 'CHN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930228', 'ASIA', 'CHINA', 'JILIN', 'CHN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930229', 'ASIA', 'CHINA', 'ANHUI', 'CHN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930230', 'ASIA', 'CHINA', 'HEILONGJIANG', 'CHN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930231', 'ASIA', 'CHINA', 'YUNNAN', 'CHN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930301', 'ASIA', 'HONG KONG', 'HONG KONG (COLONIA BRITANICA) ', 'HKG', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930302', 'ASIA', 'HONG KONG', 'MACAO (COLONIA PORTUGUESA)    ', 'HKG', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930401', 'ASIA', 'INDIA', 'BOMBAY', 'IND', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930402', 'ASIA', 'INDIA', 'NUEVA DELHI', 'IND', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930403', 'ASIA', 'INDIA', 'PAQUISTAN', 'IND', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930404', 'ASIA', 'INDIA', 'CALCUTA', 'IND', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930405', 'ASIA', 'INDIA', 'RAJASTHAN', 'IND', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930406', 'ASIA', 'INDIA', 'PUNJAB', 'IND', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930407', 'ASIA', 'INDIA', 'MADHYA PRADESH', 'IND', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930408', 'ASIA', 'INDIA', 'GUJARAT', 'IND', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930409', 'ASIA', 'INDIA', 'ANDHRA PRADESH', 'IND', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930410', 'ASIA', 'INDIA', 'KARNATAKA', 'IND', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930411', 'ASIA', 'INDIA', 'HARYANA', 'IND', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930412', 'ASIA', 'INDIA', 'UTTAR PRADESH', 'IND', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930413', 'ASIA', 'INDIA', 'UTTARAKHAND', 'IND', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930414', 'ASIA', 'INDIA', 'HIMACHAL PRADESH', 'IND', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930415', 'ASIA', 'INDIA', 'MAHARASHTRA', 'IND', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930416', 'ASIA', 'INDIA', 'BENGALA OCCIDENTAL', 'IND', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930417', 'ASIA', 'INDIA', 'TAMIL NADU', 'IND', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930418', 'ASIA', 'INDIA', 'KERALA', 'IND', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930419', 'ASIA', 'INDIA', 'ORISSA', 'IND', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930501', 'ASIA', 'IRAK', 'BAGDAD', 'IRQ', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930502', 'ASIA', 'IRAK', 'KIR KUK', 'IRQ', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930601', 'ASIA', 'ISRAEL', 'HAIFA', 'ISR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930602', 'ASIA', 'ISRAEL', 'TEL AVIV', 'ISR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930603', 'ASIA', 'ISRAEL', 'JERUSALEN', 'ISR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930604', 'ASIA', 'ISRAEL', 'PATAH - TIQVRA', 'ISR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930605', 'ASIA', 'ISRAEL', 'MERIDIANO', 'ISR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930606', 'ASIA', 'ISRAEL', 'SIGET', 'ISR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930607', 'ASIA', 'ISRAEL', 'CENTRAL', 'ISR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930608', 'ASIA', 'ISRAEL', 'SEPTENTRIONAL', 'ISR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930609', 'ASIA', 'ISRAEL', 'MERIDIONAL', 'ISR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930610', 'ASIA', 'ISRAEL', 'NORTE', 'ISR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930611', 'ASIA', 'ISRAEL', 'EILAT', 'ISR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930701', 'ASIA', 'JAPON', 'KAGOSHIMA', 'JPN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930702', 'ASIA', 'JAPON', 'KYOTO', 'JPN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930703', 'ASIA', 'JAPON', 'TOKIO', 'JPN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930704', 'ASIA', 'JAPON', 'OKINAWA', 'JPN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930705', 'ASIA', 'JAPON', 'FUKUOKA', 'JPN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930706', 'ASIA', 'JAPON', 'OSAKA', 'JPN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930707', 'ASIA', 'JAPON', 'CHUGOKU', 'JPN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930708', 'ASIA', 'JAPON', 'YOKOHAMA', 'JPN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930709', 'ASIA', 'JAPON', 'HIROSHIMA', 'JPN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930710', 'ASIA', 'JAPON', 'KUMAMOTO', 'JPN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930711', 'ASIA', 'JAPON', 'HOKKAIDO', 'JPN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930712', 'ASIA', 'JAPON', 'TOKUSHIMA', 'JPN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930713', 'ASIA', 'JAPON', 'NAGOYA', 'JPN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930714', 'ASIA', 'JAPON', 'NAGASAKI', 'JPN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930715', 'ASIA', 'JAPON', 'TOCHIGI', 'JPN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930716', 'ASIA', 'JAPON', 'EHIME', 'JPN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930717', 'ASIA', 'JAPON', 'YAMAGUCHI', 'JPN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930718', 'ASIA', 'JAPON', 'ISHIKAWA', 'JPN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930719', 'ASIA', 'JAPON', 'KANAGAWA', 'JPN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930720', 'ASIA', 'JAPON', 'SAITAMA', 'JPN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930721', 'ASIA', 'JAPON', 'GUNMA', 'JPN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930722', 'ASIA', 'JAPON', 'YAMANASHI', 'JPN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930723', 'ASIA', 'JAPON', 'AICHI', 'JPN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930724', 'ASIA', 'JAPON', 'IBARAKI', 'JPN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930725', 'ASIA', 'JAPON', 'GIFU', 'JPN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930726', 'ASIA', 'JAPON', 'SHIZUOKA', 'JPN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930727', 'ASIA', 'JAPON', 'MIE', 'JPN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930728', 'ASIA', 'JAPON', 'CHIBA', 'JPN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930729', 'ASIA', 'JAPON', 'NAGANO', 'JPN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930730', 'ASIA', 'JAPON', 'NARA', 'JPN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930731', 'ASIA', 'JAPON', 'HYOGO', 'JPN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930732', 'ASIA', 'JAPON', 'FUKUSHIMA', 'JPN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930733', 'ASIA', 'JAPON', 'NIIGATA', 'JPN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930734', 'ASIA', 'JAPON', 'YAMAGATA', 'JPN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930735', 'ASIA', 'JAPON', 'KAGAWA', 'JPN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930736', 'ASIA', 'JAPON', 'SHIGA', 'JPN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930737', 'ASIA', 'JAPON', 'FUKUI', 'JPN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930738', 'ASIA', 'JAPON', 'AKITA', 'JPN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930739', 'ASIA', 'JAPON', 'OKAYAMA', 'JPN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930740', 'ASIA', 'JAPON', 'OITA', 'JPN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930741', 'ASIA', 'JAPON', 'MIYAGI', 'JPN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930742', 'ASIA', 'JAPON', 'MORIOKA', 'JPN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930743', 'ASIA', 'JAPON', 'TOTTORI', 'JPN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930744', 'ASIA', 'JAPON', 'WAKAYAMA', 'JPN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930745', 'ASIA', 'JAPON', 'TOYAMA', 'JPN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930746', 'ASIA', 'JAPON', 'AOMORI', 'JPN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930747', 'ASIA', 'JAPON', 'IWATE', 'JPN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930748', 'ASIA', 'JAPON', 'KOCHI', 'JPN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930749', 'ASIA', 'JAPON', 'SAGA', 'JPN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930750', 'ASIA', 'JAPON', 'SHIMANE', 'JPN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930751', 'ASIA', 'JAPON', 'MIYAZAKI', 'JPN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930752', 'ASIA', 'JAPON', 'KOBE', 'JPN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930801', 'ASIA', 'LIBANO', 'BEIRUT', 'LBN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930802', 'ASIA', 'LIBANO', 'EL BATROUN', 'LBN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930803', 'ASIA', 'LIBANO', 'ASH - SHAMAL', 'LBN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930804', 'ASIA', 'LIBANO', 'BALBAK', 'LBN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930805', 'ASIA', 'LIBANO', 'SAIDA', 'LBN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930806', 'ASIA', 'LIBANO', 'KOBE', 'LBN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930807', 'ASIA', 'LIBANO', 'DARBECHTAR', 'LBN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930808', 'ASIA', 'LIBANO', 'WADI ANUBI', 'LBN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930809', 'ASIA', 'LIBANO', 'ALEY', 'LBN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930810', 'ASIA', 'LIBANO', 'TIRO', 'LBN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930811', 'ASIA', 'LIBANO', 'CHOUF', 'LBN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930812', 'ASIA', 'LIBANO', 'JBEIL', 'LBN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930901', 'ASIA', 'SRI LANKA', 'COLOMBO', 'LKA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('930902', 'ASIA', 'SRI LANKA', 'KANDY', 'LKA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('931001', 'ASIA', 'TAILANDIA', 'BANGKOK', 'THA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('931002', 'ASIA', 'TAILANDIA', 'SURAT THANI', 'THA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('931003', 'ASIA', 'TAILANDIA', 'NAKHON RATSACHIMA', 'THA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('931004', 'ASIA', 'TAILANDIA', 'CHON BURI', 'THA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('931005', 'ASIA', 'TAILANDIA', 'SURIN', 'THA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('931006', 'ASIA', 'TAILANDIA', 'SISAKET', 'THA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('931007', 'ASIA', 'TAILANDIA', 'CHIANG MAI', 'THA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('931101', 'ASIA', 'INDONESIA', 'JAKARTA', 'IDN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('931102', 'ASIA', 'INDONESIA', 'BALI', 'IDN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('931103', 'ASIA', 'INDONESIA', 'BANDUNG', 'IDN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('931104', 'ASIA', 'INDONESIA', 'MEDAN', 'IDN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('931105', 'ASIA', 'INDONESIA', 'NUSA TENGGARA ORIENTAL', 'IDN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('931201', 'ASIA', 'SIRIA', 'DAMASCO', 'SYR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('931202', 'ASIA', 'SIRIA', 'HASSAKA', 'SYR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('931203', 'ASIA', 'SIRIA', 'KNITRA', 'SYR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('931204', 'ASIA', 'SIRIA', 'LATAKIA', 'SYR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('931205', 'ASIA', 'SIRIA', 'ALEPO', 'SYR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('931301', 'ASIA', 'JORDANIA', 'BEIT JALA', 'JOR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('931302', 'ASIA', 'JORDANIA', 'AMMAN', 'JOR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('931303', 'ASIA', 'JORDANIA', 'RAMALLAH', 'JOR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('931304', 'ASIA', 'JORDANIA', 'JERUSALEN', 'JOR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('931305', 'ASIA', 'JORDANIA', 'JERICO', 'JOR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('931306', 'ASIA', 'JORDANIA', 'KARAK', 'JOR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('931307', 'ASIA', 'JORDANIA', 'ZARQA', 'JOR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('931401', 'ASIA', 'PALESTINA', 'BETHLEHEM', 'PSE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('931402', 'ASIA', 'PALESTINA', 'BELEN', 'PSE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('931403', 'ASIA', 'PALESTINA', 'BETAFOGA', 'PSE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('931404', 'ASIA', 'PALESTINA', 'BEIT-JALA', 'PSE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('931405', 'ASIA', 'PALESTINA', 'GAZA', 'PSE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('931406', 'ASIA', 'PALESTINA', 'OMDURMAN', 'PSE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('931407', 'ASIA', 'PALESTINA', 'RAFAH', 'PSE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('931408', 'ASIA', 'PALESTINA', 'HEBRON', 'PSE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('931409', 'ASIA', 'PALESTINA', 'RAMALLAH', 'PSE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('931410', 'ASIA', 'PALESTINA', 'NABLUS', 'PSE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('931501', 'ASIA', 'TURQUIA', 'ESTAMBUL', 'TUR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('931502', 'ASIA', 'TURQUIA', 'ESMIRNA', 'TUR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('931503', 'ASIA', 'TURQUIA', 'ANKARA', 'TUR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('931601', 'ASIA', 'COREA DEL NORTE', 'PYONGYANG', 'PRK', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('931701', 'ASIA', 'MONGOLIA', 'ULAM BATOR', 'MNG', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('931702', 'ASIA', 'MONGOLIA', 'DARHAN', 'MNG', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('931801', 'ASIA', 'PAKISTAN', 'ISLAMABAD', 'PAK', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('931802', 'ASIA', 'PAKISTAN', 'SINDH', 'PAK', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('931803', 'ASIA', 'PAKISTAN', 'PESHAWAR', 'PAK', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('931804', 'ASIA', 'PAKISTAN', 'FRONTERA NOROESTE', 'PAK', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('931805', 'ASIA', 'PAKISTAN', 'PUNJAB', 'PAK', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('931901', 'ASIA', 'ARABIA SAUDITA', 'JIDDAH', 'SAU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('931902', 'ASIA', 'ARABIA SAUDITA', 'ASH-SHARQIYAH', 'SAU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('931903', 'ASIA', 'ARABIA SAUDITA', 'DAMMAM', 'SAU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('931904', 'ASIA', 'ARABIA SAUDITA', 'RIAD', 'SAU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('932001', 'ASIA', 'VIETNAM', 'SAIGON', 'VNM', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('932002', 'ASIA', 'VIETNAM', 'HANOI', 'VNM', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('932101', 'ASIA', 'KAZAJISTAN', 'ALMATY', 'KAZ', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('932102', 'ASIA', 'KAZAJISTAN', 'DZHEZKAZGAN', 'KAZ', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('932103', 'ASIA', 'KAZAJISTAN', 'KOKCHETAV', 'KAZ', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('932104', 'ASIA', 'KAZAJISTAN', 'ASHCHISAY', 'KAZ', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('932201', 'ASIA', 'YEMEN', 'SANA', 'YEM', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('932301', 'ASIA', 'TAIWAN', 'TAIPEI', 'TWN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('932302', 'ASIA', 'TAIWAN', 'MIAO-LI', 'TWN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('932303', 'ASIA', 'TAIWAN', 'CHIA-I', 'TWN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('932304', 'ASIA', 'TAIWAN', 'I-LAN', 'TWN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('932305', 'ASIA', 'TAIWAN', 'TAICHUNG', 'TWN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('932306', 'ASIA', 'TAIWAN', 'KAOHSIUNG', 'TWN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('932307', 'ASIA', 'TAIWAN', 'PING TUNG', 'TWN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('932401', 'ASIA', 'IRAN', 'TEHERAN', 'IRN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('932402', 'ASIA', 'IRAN', 'TABRIZ', 'IRN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('932403', 'ASIA', 'IRAN', 'MAZANDARAN', 'IRN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('932404', 'ASIA', 'IRAN', 'ABADAN', 'IRN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('932405', 'ASIA', 'IRAN', 'RASHT', 'IRN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('932406', 'ASIA', 'IRAN', 'SISTAN VA BALUCHISTAN', 'IRN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('932407', 'ASIA', 'IRAN', 'ISFAHAN', 'IRN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('932408', 'ASIA', 'IRAN', 'SHIRAZ', 'IRN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('932409', 'ASIA', 'IRAN', 'HAMADAN', 'IRN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('932501', 'ASIA', 'SINGAPUR', 'SINGAPUR', 'SGP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('932601', 'ASIA', 'KIRGUISTAN', 'BISHKEK', 'KGZ', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('932701', 'ASIA', 'AFGANISTAN', 'KABUL', 'AFG', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('932801', 'ASIA', 'KUWAIT', 'AL - KUWAIT', 'KWT', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('932901', 'ASIA', 'TURKMENISTAN', 'ASHKHABAD', 'TKM', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('932902', 'ASIA', 'TURKMENISTAN', 'TASHAUZ', 'TKM', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('933001', 'ASIA', 'MALASIA', 'KUALA LUMPUR', 'MYS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('933002', 'ASIA', 'MALASIA', 'JOHOR', 'MYS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('933003', 'ASIA', 'MALASIA', 'KEDAH', 'MYS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('933004', 'ASIA', 'MALASIA', 'KELANTAN', 'MYS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('933005', 'ASIA', 'MALASIA', 'PAHANG', 'MYS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('933006', 'ASIA', 'MALASIA', 'PERAK', 'MYS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('933007', 'ASIA', 'MALASIA', 'SELANGOR', 'MYS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('933008', 'ASIA', 'MALASIA', 'TERENGGANU', 'MYS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('933009', 'ASIA', 'MALASIA', 'NEGERI SEMBILAN', 'MYS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('933010', 'ASIA', 'MALASIA', 'PERLIS', 'MYS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('933011', 'ASIA', 'MALASIA', 'PENANG', 'MYS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('933012', 'ASIA', 'MALASIA', 'MALACA', 'MYS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('933013', 'ASIA', 'MALASIA', 'SABAH', 'MYS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('933014', 'ASIA', 'MALASIA', 'SARAWAK', 'MYS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('933015', 'ASIA', 'MALASIA', 'PUTRAJAYA', 'MYS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('933016', 'ASIA', 'MALASIA', 'LABUAN', 'MYS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('933017', 'ASIA', 'MALASIA', 'BELAIT', 'MYS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('933018', 'ASIA', 'MALASIA', 'BRUNEI Y MUARA', 'MYS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('933019', 'ASIA', 'MALASIA', 'TEMBURONG', 'MYS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('933020', 'ASIA', 'MALASIA', 'TUTONG', 'MYS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('933101', 'ASIA', 'GEORGIA', 'TBILISI', 'GEO', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('933102', 'ASIA', 'GEORGIA', 'POTY', 'GEO', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('933103', 'ASIA', 'GEORGIA', 'BATUMI', 'GEO', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('933201', 'ASIA', 'FILIPINAS', 'MANILA', 'PHL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('933202', 'ASIA', 'FILIPINAS', 'CEBU', 'PHL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('933203', 'ASIA', 'FILIPINAS', 'BAYBAY', 'PHL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('933204', 'ASIA', 'FILIPINAS', 'BUTUAN', 'PHL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('933205', 'ASIA', 'FILIPINAS', 'PAMPANGA', 'PHL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('933206', 'ASIA', 'FILIPINAS', 'DAVAO', 'PHL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('933207', 'ASIA', 'FILIPINAS', 'QUEZON CITY', 'PHL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('933208', 'ASIA', 'FILIPINAS', 'BULACAN', 'PHL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('933209', 'ASIA', 'FILIPINAS', 'ZAMBALES', 'PHL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('933210', 'ASIA', 'FILIPINAS', 'CALABARZON', 'PHL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('933211', 'ASIA', 'FILIPINAS', 'BATAAN', 'PHL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('933212', 'ASIA', 'FILIPINAS', 'NUEVA ECIJA', 'PHL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('933213', 'ASIA', 'FILIPINAS', 'CAPIZ', 'PHL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('933301', 'ASIA', 'CAMBOYA', 'PHNOM PENH', 'KHM', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('933401', 'ASIA', 'BANGLADESH', 'CHITTAGONG', 'BGD', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('933402', 'ASIA', 'BANGLADESH', 'DHAKA', 'BGD', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('933403', 'ASIA', 'BANGLADESH', 'KHULNA', 'BGD', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('933501', 'ASIA', 'AZERBAIYAN', 'BAKU', 'AZE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('933601', 'ASIA', 'NEPAL', 'KATMANDU', 'NPL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('933701', 'ASIA', 'EMIRATOS ARABES UNIDOS', 'DUBAI', 'ARE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('933702', 'ASIA', 'EMIRATOS ARABES UNIDOS', 'ABU DHABI', 'ARE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('933703', 'ASIA', 'EMIRATOS ARABES UNIDOS', 'AJMAN', 'ARE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('933704', 'ASIA', 'EMIRATOS ARABES UNIDOS', 'SHARJAH', 'ARE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('933705', 'ASIA', 'EMIRATOS ARABES UNIDOS', 'RAS AL JAIMA', 'ARE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('933706', 'ASIA', 'EMIRATOS ARABES UNIDOS', 'FUJAIRAH', 'ARE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('933707', 'ASIA', 'EMIRATOS ARABES UNIDOS', 'RAS AL-KHAIMAH', 'ARE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('933708', 'ASIA', 'EMIRATOS ARABES UNIDOS', 'UMM AL-QUWAIN', 'ARE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('933801', 'ASIA', 'CATAR', 'DOHA', 'QAT', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('933901', 'ASIA', 'OMAN', 'MASCATE', 'OMN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('934001', 'ASIA', 'BIRMANIA', 'CHIN', 'MMR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('934101', 'ASIA', 'BAREIN', 'HAMAD', 'BHR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('934102', 'ASIA', 'BAREIN', 'MANAMA', 'BHR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('934201', 'ASIA', 'TAYIKISTAN', 'SOGD', 'TJK', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('934301', 'ASIA', 'UZBEKISTAN', 'TASHKENT', 'UZB', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('934501', 'ASIA', 'BRUNEI', 'BELAIT', 'BRN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('934502', 'ASIA', 'BRUNEI', 'BRUNEI Y MUARA', 'BRN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('934503', 'ASIA', 'BRUNEI', 'TEMBURONG', 'BRN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('934504', 'ASIA', 'BRUNEI', 'TUTONG', 'BRN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('934601', 'ASIA', 'ARMENIA', 'RAZDAN', 'ARM', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('934602', 'ASIA', 'ARMENIA', 'GYUMRI', 'ARM', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('934701', 'ASIA', 'TIMOR ORIENTAL', 'DILI', 'TLS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940201', 'EUROPA', 'ALEMANIA', 'BERLIN', 'DEU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940202', 'EUROPA', 'ALEMANIA', 'BONN', 'DEU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940203', 'EUROPA', 'ALEMANIA', 'BREMEN', 'DEU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940204', 'EUROPA', 'ALEMANIA', 'ESSEN', 'DEU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940205', 'EUROPA', 'ALEMANIA', 'FRANKFURT', 'DEU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940206', 'EUROPA', 'ALEMANIA', 'HAMBURGO', 'DEU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940207', 'EUROPA', 'ALEMANIA', 'HANNOVER', 'DEU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940208', 'EUROPA', 'ALEMANIA', 'BAVIERA', 'DEU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940209', 'EUROPA', 'ALEMANIA', 'STUTTGART', 'DEU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940210', 'EUROPA', 'ALEMANIA', 'DUSSELDORF', 'DEU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940211', 'EUROPA', 'ALEMANIA', 'HEIDELBERG', 'DEU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940212', 'EUROPA', 'ALEMANIA', 'RAVENSBURGO', 'DEU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940213', 'EUROPA', 'ALEMANIA', 'COLONIA', 'DEU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940214', 'EUROPA', 'ALEMANIA', 'MANNHEIM', 'DEU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940215', 'EUROPA', 'ALEMANIA', 'SAJONIA', 'DEU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940216', 'EUROPA', 'ALEMANIA', 'NEUTITSCHEIN', 'DEU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940217', 'EUROPA', 'ALEMANIA', 'BADEN-WÜRTTEMBERG', 'DEU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940218', 'EUROPA', 'ALEMANIA', 'OLDEMBURGO', 'DEU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940219', 'EUROPA', 'ALEMANIA', 'MÖNCHENGLADBACH', 'DEU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940220', 'EUROPA', 'ALEMANIA', 'BAJA SAJONIA', 'DEU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940221', 'EUROPA', 'ALEMANIA', 'WRESCHEN', 'DEU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940222', 'EUROPA', 'ALEMANIA', 'BIELEFELD', 'DEU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940223', 'EUROPA', 'ALEMANIA', 'RENANIA DEL NORTE-WESTFA', 'DEU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940224', 'EUROPA', 'ALEMANIA', 'TURINGIA', 'DEU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940225', 'EUROPA', 'ALEMANIA', 'GLEIWITZ', 'DEU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940226', 'EUROPA', 'ALEMANIA', 'STETTIN', 'DEU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940227', 'EUROPA', 'ALEMANIA', 'DORTMUND', 'DEU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940228', 'EUROPA', 'ALEMANIA', 'LUBËCK', 'DEU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940229', 'EUROPA', 'ALEMANIA', 'WITTEN', 'DEU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940230', 'EUROPA', 'ALEMANIA', 'SCHLESWIG-HOLSTEIN', 'DEU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940231', 'EUROPA', 'ALEMANIA', 'NORDHAUSEN', 'DEU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940232', 'EUROPA', 'ALEMANIA', 'MECKLEMBURGO-VORPOMMERN', 'DEU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940233', 'EUROPA', 'ALEMANIA', 'KERPEN', 'DEU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940234', 'EUROPA', 'ALEMANIA', 'GÖTTINGEN', 'DEU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940235', 'EUROPA', 'ALEMANIA', 'HESSEN', 'DEU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940236', 'EUROPA', 'ALEMANIA', 'ROSTOCK', 'DEU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940237', 'EUROPA', 'ALEMANIA', 'RENANIA-PALATINADO', 'DEU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940238', 'EUROPA', 'ALEMANIA', 'NUREMBERG', 'DEU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940239', 'EUROPA', 'ALEMANIA', 'MAGDEBURG', 'DEU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940240', 'EUROPA', 'ALEMANIA', 'SILECIA', 'DEU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940241', 'EUROPA', 'ALEMANIA', 'BRANDENBURGO', 'DEU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940242', 'EUROPA', 'ALEMANIA', 'MAGUNCIA', 'DEU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940243', 'EUROPA', 'ALEMANIA', 'DUISBURGO', 'DEU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940244', 'EUROPA', 'ALEMANIA', 'ERFURT', 'DEU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940245', 'EUROPA', 'ALEMANIA', 'MUNICH', 'DEU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940246', 'EUROPA', 'ALEMANIA', 'SARRE', 'DEU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940247', 'EUROPA', 'ALEMANIA', 'VIERSEN', 'DEU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940248', 'EUROPA', 'ALEMANIA', 'ERLANGEN', 'DEU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940249', 'EUROPA', 'ALEMANIA', 'MÜNSTER', 'DEU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940250', 'EUROPA', 'ALEMANIA', 'EICHSFELD', 'DEU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940251', 'EUROPA', 'ALEMANIA', 'SAJONIA ANHALT', 'DEU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940252', 'EUROPA', 'ALEMANIA', 'GELSENKIRCHEN', 'DEU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940301', 'EUROPA', 'AUSTRIA', 'SALZBURGO', 'AUT', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940302', 'EUROPA', 'AUSTRIA', 'VIENA', 'AUT', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940303', 'EUROPA', 'AUSTRIA', 'TIROL', 'AUT', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940304', 'EUROPA', 'AUSTRIA', 'VORALBERG', 'AUT', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940305', 'EUROPA', 'AUSTRIA', 'ALTA AUSTRIA', 'AUT', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940306', 'EUROPA', 'AUSTRIA', 'WIENER NEUSTADT', 'AUT', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940307', 'EUROPA', 'AUSTRIA', 'BAJA AUSTRIA', 'AUT', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940308', 'EUROPA', 'AUSTRIA', 'TULLN', 'AUT', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940309', 'EUROPA', 'AUSTRIA', 'LINZ', 'AUT', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940310', 'EUROPA', 'AUSTRIA', 'KLAGENFURT', 'AUT', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940311', 'EUROPA', 'AUSTRIA', 'CARINTHIA', 'AUT', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940312', 'EUROPA', 'AUSTRIA', 'ESTIRIA', 'AUT', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940313', 'EUROPA', 'AUSTRIA', 'BURGENLAND', 'AUT', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940314', 'EUROPA', 'AUSTRIA', 'INNSBRUCK', 'AUT', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940401', 'EUROPA', 'BELGICA', 'AMBERES', 'BEL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940402', 'EUROPA', 'BELGICA', 'BRUSELAS', 'BEL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940403', 'EUROPA', 'BELGICA', 'GANTE', 'BEL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940404', 'EUROPA', 'BELGICA', 'LIEJA', 'BEL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940405', 'EUROPA', 'BELGICA', 'LOVAINA', 'BEL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940406', 'EUROPA', 'BELGICA', 'NAMUR', 'BEL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940407', 'EUROPA', 'BELGICA', 'MAINAUT', 'BEL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940408', 'EUROPA', 'BELGICA', 'BRABANTE', 'BEL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940409', 'EUROPA', 'BELGICA', 'BRUJAS', 'BEL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940410', 'EUROPA', 'BELGICA', 'FLANDES OCCIDENTAL', 'BEL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940411', 'EUROPA', 'BELGICA', 'HENAO', 'BEL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940412', 'EUROPA', 'BELGICA', 'FLANDES ORIENTAL', 'BEL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940413', 'EUROPA', 'BELGICA', 'VALONIA', 'BEL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940414', 'EUROPA', 'BELGICA', 'LIMBURGO', 'BEL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940501', 'EUROPA', 'BULGARIA', 'SOFIA', 'BGR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940502', 'EUROPA', 'BULGARIA', 'PLOVDIV', 'BGR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940503', 'EUROPA', 'BULGARIA', 'STARA ZAGORA', 'BGR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940504', 'EUROPA', 'BULGARIA', 'SLIVEN', 'BGR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940505', 'EUROPA', 'BULGARIA', 'MIKHAILOVGRAD', 'BGR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940506', 'EUROPA', 'BULGARIA', 'MONTANA', 'BGR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940507', 'EUROPA', 'BULGARIA', 'VARNA', 'BGR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940508', 'EUROPA', 'BULGARIA', 'DOBRICH', 'BGR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940509', 'EUROPA', 'BULGARIA', 'RUSE', 'BGR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940601', 'EUROPA', 'REPUBLICA CHECA', 'PRAGA', 'CZE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940602', 'EUROPA', 'REPUBLICA CHECA', 'ZLIN', 'CZE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940603', 'EUROPA', 'REPUBLICA CHECA', 'PARDUBICE', 'CZE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940604', 'EUROPA', 'REPUBLICA CHECA', 'ZATEC', 'CZE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940605', 'EUROPA', 'REPUBLICA CHECA', 'JABLONEC', 'CZE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940606', 'EUROPA', 'REPUBLICA CHECA', 'MUKACEVO', 'CZE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940607', 'EUROPA', 'REPUBLICA CHECA', 'OSTRAVA', 'CZE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940608', 'EUROPA', 'REPUBLICA CHECA', 'PILSEN', 'CZE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940609', 'EUROPA', 'REPUBLICA CHECA', 'SEDLCANY', 'CZE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940610', 'EUROPA', 'REPUBLICA CHECA', 'MORAVIA', 'CZE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940611', 'EUROPA', 'REPUBLICA CHECA', 'LIBEREC', 'CZE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940612', 'EUROPA', 'REPUBLICA CHECA', 'USTI NAD LABEM', 'CZE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940613', 'EUROPA', 'REPUBLICA CHECA', 'KROMERIZ', 'CZE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940614', 'EUROPA', 'REPUBLICA CHECA', 'PLZEÑ', 'CZE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940615', 'EUROPA', 'REPUBLICA CHECA', 'BRNO', 'CZE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940616', 'EUROPA', 'REPUBLICA CHECA', 'HRADEC KRÁLOVÉ', 'CZE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940617', 'EUROPA', 'REPUBLICA CHECA', 'HUMPOLEC', 'CZE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940618', 'EUROPA', 'REPUBLICA CHECA', 'SAHY', 'CZE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940619', 'EUROPA', 'BULGARIA', 'ZITEC', 'BGR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940620', 'EUROPA', 'BULGARIA', 'BOHEMIA SEPTENTRIONAL', 'BGR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940621', 'EUROPA', 'REPUBLICA CHECA', 'BRUNTAL', 'CZE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940622', 'EUROPA', 'REPUBLICA CHECA', 'MORAVIA SEPTENTRIONAL', 'CZE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940701', 'EUROPA', 'CHIPRE', 'LIMASSOL', 'CYP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940702', 'EUROPA', 'CHIPRE', 'NICOSIA', 'CYP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940801', 'EUROPA', 'DINAMARCA', 'COPENHAGUE', 'DNK', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940802', 'EUROPA', 'DINAMARCA', 'KOLDING', 'DNK', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940803', 'EUROPA', 'DINAMARCA', 'ODENSE', 'DNK', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940804', 'EUROPA', 'DINAMARCA', 'ROSKILDE', 'DNK', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940805', 'EUROPA', 'DINAMARCA', 'ARHUS', 'DNK', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940806', 'EUROPA', 'DINAMARCA', 'VEJLE', 'DNK', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940807', 'EUROPA', 'DINAMARCA', 'JUTLANDIA DEL NORTE', 'DNK', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940808', 'EUROPA', 'DINAMARCA', 'SEELANDIA OCCIDENTAL', 'DNK', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940809', 'EUROPA', 'DINAMARCA', 'RIBE', 'DNK', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940901', 'EUROPA', 'ESPAÑA', 'ALICANTE', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940902', 'EUROPA', 'ESPAÑA', 'BARCELONA', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940903', 'EUROPA', 'ESPAÑA', 'BILBAO', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940904', 'EUROPA', 'ESPAÑA', 'CADIZ', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940905', 'EUROPA', 'ESPAÑA', 'SALAMANCA', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940906', 'EUROPA', 'ESPAÑA', 'GIJON', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940907', 'EUROPA', 'ESPAÑA', 'CACERES', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940908', 'EUROPA', 'ESPAÑA', 'LA CORUÑA', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940909', 'EUROPA', 'ESPAÑA', 'LAS PALMAS', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940910', 'EUROPA', 'ESPAÑA', 'MADRID', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940911', 'EUROPA', 'ESPAÑA', 'MALAGA', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940912', 'EUROPA', 'ESPAÑA', 'TOLEDO', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940913', 'EUROPA', 'ESPAÑA', 'MALLORCA', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940914', 'EUROPA', 'ESPAÑA', 'SAN SEBASTIAN', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940915', 'EUROPA', 'ESPAÑA', 'TENERIFE', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940916', 'EUROPA', 'ESPAÑA', 'SANTANDER', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940917', 'EUROPA', 'ESPAÑA', 'ZARAGOZA', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940918', 'EUROPA', 'ESPAÑA', 'SEVILLA', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940919', 'EUROPA', 'ESPAÑA', 'TARRAGONA', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940920', 'EUROPA', 'ESPAÑA', 'VALENCIA', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940921', 'EUROPA', 'ESPAÑA', 'VALLADOLID', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940922', 'EUROPA', 'ESPAÑA', 'VIGO', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940923', 'EUROPA', 'ESPAÑA', 'NAVARRA', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940924', 'EUROPA', 'ESPAÑA', 'LOGROÑO', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940925', 'EUROPA', 'ESPAÑA', 'GRANADA', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940926', 'EUROPA', 'ESPAÑA', 'LEON', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940927', 'EUROPA', 'ESPAÑA', 'ASTURIAS', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940928', 'EUROPA', 'ESPAÑA', 'SORIA', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940929', 'EUROPA', 'ESPAÑA', 'BURGOS', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940930', 'EUROPA', 'ESPAÑA', 'MURCIA', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940931', 'EUROPA', 'ESPAÑA', 'OVIEDO', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940932', 'EUROPA', 'ESPAÑA', 'BADAJOZ', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940933', 'EUROPA', 'ESPAÑA', 'GUADALAJARA', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940934', 'EUROPA', 'ESPAÑA', 'HUESCA', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940935', 'EUROPA', 'ESPAÑA', 'ALMERIA', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940936', 'EUROPA', 'ESPAÑA', 'ZAMORA', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940937', 'EUROPA', 'ESPAÑA', 'PONTEVEDRA', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940938', 'EUROPA', 'ESPAÑA', 'PALENCIA', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940939', 'EUROPA', 'ESPAÑA', 'ORENSE', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940940', 'EUROPA', 'ESPAÑA', 'AVILA', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940941', 'EUROPA', 'ESPAÑA', 'CORDOBA', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940942', 'EUROPA', 'ESPAÑA', 'LERIDA', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940943', 'EUROPA', 'ESPAÑA', 'JAEN', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940944', 'EUROPA', 'ESPAÑA', 'CIUDAD REAL', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940945', 'EUROPA', 'ESPAÑA', 'GERONA', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940946', 'EUROPA', 'ESPAÑA', 'VICTORIA', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940947', 'EUROPA', 'ESPAÑA', 'VIZCAYA', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940948', 'EUROPA', 'ESPAÑA', 'CUENCA', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940949', 'EUROPA', 'ESPAÑA', 'CASTELLON', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940950', 'EUROPA', 'ESPAÑA', 'LUGO', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940951', 'EUROPA', 'ESPAÑA', 'HUELVA', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940952', 'EUROPA', 'ESPAÑA', 'SEGOVIA', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940953', 'EUROPA', 'ESPAÑA', 'ALBACETE', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940954', 'EUROPA', 'ESPAÑA', 'LOS LLANOS DE ARIDANE', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940955', 'EUROPA', 'ESPAÑA', 'TERUEL', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940956', 'EUROPA', 'ESPAÑA', 'GUIPUZCOA', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940957', 'EUROPA', 'ESPAÑA', 'BALEARES', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940958', 'EUROPA', 'ESPAÑA', 'ALAVA', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940959', 'EUROPA', 'ESPAÑA', 'SAHARA OCCIDENTAL', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940960', 'EUROPA', 'ESPAÑA', 'CATALUÑA', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940961', 'EUROPA', 'ESPAÑA', 'CANTABRIA', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940962', 'EUROPA', 'ESPAÑA', 'GALICIA', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940963', 'EUROPA', 'ESPAÑA', 'MELILLA', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940964', 'EUROPA', 'ESPAÑA', 'CEUTA', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('940965', 'EUROPA', 'ESPAÑA', 'LA RIOJA', 'ESP', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941001', 'EUROPA', 'FINLANDIA', 'HELSINKY', 'FIN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941002', 'EUROPA', 'FINLANDIA', 'BORGA', 'FIN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941003', 'EUROPA', 'FINLANDIA', 'KOTKA', 'FIN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941004', 'EUROPA', 'FINLANDIA', 'OULU', 'FIN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941005', 'EUROPA', 'FINLANDIA', 'KUOPIO', 'FIN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941006', 'EUROPA', 'FINLANDIA', 'HAME', 'FIN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941007', 'EUROPA', 'FINLANDIA', 'TURKU', 'FIN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941008', 'EUROPA', 'FINLANDIA', 'FINLANDIA MERIDIONAL', 'FIN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941009', 'EUROPA', 'FINLANDIA', 'FINLANDIA ORIENTAL', 'FIN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941010', 'EUROPA', 'FINLANDIA', 'UUSIMAA', 'FIN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941011', 'EUROPA', 'FINLANDIA', 'TAMPERE', 'FIN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941012', 'EUROPA', 'FINLANDIA', 'OSTROBOTNIA DEL SUR', 'FIN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941013', 'EUROPA', 'FINLANDIA', 'OSTROBOTNIA', 'FIN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941101', 'EUROPA', 'FRANCIA', 'BURDEOS', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941102', 'EUROPA', 'FRANCIA', 'EL HAVRE', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941103', 'EUROPA', 'FRANCIA', 'ESTRASBURGO', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941104', 'EUROPA', 'FRANCIA', 'LA ROCHELLE', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941105', 'EUROPA', 'FRANCIA', 'LYON', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941106', 'EUROPA', 'FRANCIA', 'MARSELLA', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941107', 'EUROPA', 'FRANCIA', 'NIZA', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941108', 'EUROPA', 'FRANCIA', 'PARIS', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941109', 'EUROPA', 'FRANCIA', 'GRENOBLE', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941110', 'EUROPA', 'FRANCIA', 'TOULOUSE', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941111', 'EUROPA', 'FRANCIA', 'REIMS', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941112', 'EUROPA', 'FRANCIA', 'AQUITANIA', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941113', 'EUROPA', 'FRANCIA', 'ISLA DE FRANCIA', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941114', 'EUROPA', 'FRANCIA', 'QUIMPER', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941115', 'EUROPA', 'FRANCIA', 'BORGOÑA', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941116', 'EUROPA', 'FRANCIA', 'CAHORS', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941117', 'EUROPA', 'FRANCIA', 'LORENA', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941118', 'EUROPA', 'FRANCIA', 'AMIENS', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941119', 'EUROPA', 'FRANCIA', 'BRETAÑA', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941120', 'EUROPA', 'FRANCIA', 'LANGUEDOC-ROUSSILLON', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941121', 'EUROPA', 'FRANCIA', 'RHONE - ALPES', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941122', 'EUROPA', 'FRANCIA', 'PUY DE DOME', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941123', 'EUROPA', 'FRANCIA', 'CHAMPAÑA Y ARDENA', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941124', 'EUROPA', 'FRANCIA', 'LILLE', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941125', 'EUROPA', 'FRANCIA', 'NORMANDIA', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941126', 'EUROPA', 'FRANCIA', 'BARBENTANE', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941127', 'EUROPA', 'FRANCIA', 'GIRONDE', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941128', 'EUROPA', 'FRANCIA', 'MARTINICA', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941129', 'EUROPA', 'FRANCIA', 'BLOIS', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941130', 'EUROPA', 'FRANCIA', 'ANNEMASSE', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941131', 'EUROPA', 'FRANCIA', 'AUVERNIA', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941132', 'EUROPA', 'FRANCIA', 'LIMOUSIN', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941133', 'EUROPA', 'FRANCIA', 'NORTE PASO DE CALAIS', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941134', 'EUROPA', 'FRANCIA', 'ALSACIA', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941135', 'EUROPA', 'FRANCIA', 'PIRINEOS MERIDIONALES', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941136', 'EUROPA', 'FRANCIA', 'PROVENZA-COSTA AZUL', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941137', 'EUROPA', 'FRANCIA', 'CENTRO VALLE DEL LOIRA', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941138', 'EUROPA', 'FRANCIA', 'LANGUEDOC-ROSELLON', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941139', 'EUROPA', 'FRANCIA', 'BAJA NORMANDIA', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941140', 'EUROPA', 'FRANCIA', 'POLINESIA FRANCESA', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941141', 'EUROPA', 'FRANCIA', 'MONACO', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941142', 'EUROPA', 'FRANCIA', 'PAIS DEL LOIRA', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941143', 'EUROPA', 'FRANCIA', 'POITOU-CHARENTES', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941144', 'EUROPA', 'FRANCIA', 'ILE DE FRANCE', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941145', 'EUROPA', 'FRANCIA', 'PICARDIA', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941146', 'EUROPA', 'FRANCIA', 'NUEVA CALEDONIA', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941147', 'EUROPA', 'FRANCIA', 'ALTA NORMANDIA', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941148', 'EUROPA', 'FRANCIA', 'FRANCO CONDADO', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941149', 'EUROPA', 'FRANCIA', 'GUAYANA FRANCESA CAYENA', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941150', 'EUROPA', 'FRANCIA', 'GUAYANA FRANCESA KURU', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941151', 'EUROPA', 'FRANCIA', 'GUAYANA FRANCESA ST.LAURENT', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941152', 'EUROPA', 'FRANCIA', 'MONTPELLIER', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941153', 'EUROPA', 'FRANCIA', 'VAR', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941154', 'EUROPA', 'FRANCIA', 'LA REUNION', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941155', 'EUROPA', 'FRANCIA', 'PIRINEOS ORIENTALES', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941156', 'EUROPA', 'FRANCIA', 'CORCEGA', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941157', 'EUROPA', 'FRANCIA', 'SAINT MARTIN', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941158', 'EUROPA', 'FRANCIA', 'BASSE TERRE', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941159', 'EUROPA', 'FRANCIA', 'VALLE DEL MARNE', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941160', 'EUROPA', 'FRANCIA', 'YVELINES', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941161', 'EUROPA', 'FRANCIA', 'CENTRO', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941162', 'EUROPA', 'FRANCIA', 'NANTES', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941163', 'EUROPA', 'FRANCIA', 'SAINT GERMAIN EN LAYE', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941164', 'EUROPA', 'FRANCIA', 'GUADALUPE', 'FRA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941201', 'EUROPA', 'REINO UNIDO', 'GLASGOW', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941202', 'EUROPA', 'REINO UNIDO', 'HULL', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941203', 'EUROPA', 'REINO UNIDO', 'LIVERPOOL', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941204', 'EUROPA', 'REINO UNIDO', 'LONDRES', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941205', 'EUROPA', 'REINO UNIDO', 'MANCHESTER', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941206', 'EUROPA', 'REINO UNIDO', 'ESCOCIA', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941207', 'EUROPA', 'REINO UNIDO', 'CAMBRIDGESHIRE', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941208', 'EUROPA', 'REINO UNIDO', 'WARWICKSHIRE', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941209', 'EUROPA', 'REINO UNIDO', 'EDIMBURGO', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941210', 'EUROPA', 'REINO UNIDO', 'HERTFORDSHIRE', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941211', 'EUROPA', 'REINO UNIDO', 'YORKSHIRE', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941212', 'EUROPA', 'REINO UNIDO', 'WILTSHIRE', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941213', 'EUROPA', 'REINO UNIDO', 'STAFFORDSHIRE', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941214', 'EUROPA', 'REINO UNIDO', 'OXFORD', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941215', 'EUROPA', 'REINO UNIDO', 'FIFE', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941216', 'EUROPA', 'REINO UNIDO', 'DURHAM', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941217', 'EUROPA', 'REINO UNIDO', 'HAMPSHIRE', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941218', 'EUROPA', 'REINO UNIDO', 'PENZANCE', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941219', 'EUROPA', 'REINO UNIDO', 'LANCASHIRE', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941220', 'EUROPA', 'REINO UNIDO', 'WEST YORKSHIRE', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941221', 'EUROPA', 'REINO UNIDO', 'SURREY', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941222', 'EUROPA', 'REINO UNIDO', 'SHEFFIELD', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941223', 'EUROPA', 'REINO UNIDO', 'NEWCASTLE', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941224', 'EUROPA', 'REINO UNIDO', 'EAST SUSSEX', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941225', 'EUROPA', 'REINO UNIDO', 'DEVON', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941226', 'EUROPA', 'REINO UNIDO', 'GALES', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941227', 'EUROPA', 'REINO UNIDO', 'KENT', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941228', 'EUROPA', 'REINO UNIDO', 'CUMBRIA', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941229', 'EUROPA', 'REINO UNIDO', 'CHESHIRE', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941230', 'EUROPA', 'REINO UNIDO', 'BIRMINGHAM', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941231', 'EUROPA', 'REINO UNIDO', 'SHROPSHIRE', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941232', 'EUROPA', 'REINO UNIDO', 'ESSEX', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941233', 'EUROPA', 'REINO UNIDO', 'DERBYSHIRE', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941234', 'EUROPA', 'REINO UNIDO', 'WEST SUSSEX', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941235', 'EUROPA', 'REINO UNIDO', 'LINCOLNSHIRE', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941236', 'EUROPA', 'REINO UNIDO', 'READING', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941237', 'EUROPA', 'REINO UNIDO', 'CORNWALL', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941238', 'EUROPA', 'REINO UNIDO', 'SUNDERLAND', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941239', 'EUROPA', 'REINO UNIDO', 'SOMERSET', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941240', 'EUROPA', 'REINO UNIDO', 'BRADFORD', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941241', 'EUROPA', 'REINO UNIDO', 'LEEDS', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941242', 'EUROPA', 'REINO UNIDO', 'LANCASTER', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941243', 'EUROPA', 'REINO UNIDO', 'LEICESTER', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941244', 'EUROPA', 'REINO UNIDO', 'GLOUCESTERSHIRE', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941245', 'EUROPA', 'REINO UNIDO', 'HEREFORDSHIRE', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941246', 'EUROPA', 'REINO UNIDO', 'SUFFOLK', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941247', 'EUROPA', 'REINO UNIDO', 'WORCESTERSHIRE', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941248', 'EUROPA', 'REINO UNIDO', 'NORTHAMPTONSHIRE', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941249', 'EUROPA', 'REINO UNIDO', 'BOURNEMOUTH', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941250', 'EUROPA', 'REINO UNIDO', 'BRISTOL', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941251', 'EUROPA', 'REINO UNIDO', 'BUCKINGHAMSHIRE', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941252', 'EUROPA', 'REINO UNIDO', 'LUTON', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941253', 'EUROPA', 'REINO UNIDO', 'BEDFORDSHIRE', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941254', 'EUROPA', 'REINO UNIDO', 'STOKE ON TRENT', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941255', 'EUROPA', 'REINO UNIDO', 'BRIGHTON & HOVE', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941256', 'EUROPA', 'REINO UNIDO', 'COVENTRY', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941257', 'EUROPA', 'REINO UNIDO', 'ROTHERHAM', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941258', 'EUROPA', 'REINO UNIDO', 'INGLATERRA', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941259', 'EUROPA', 'REINO UNIDO', 'WOLVERHAMPTON', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941260', 'EUROPA', 'REINO UNIDO', 'NORWICH', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941261', 'EUROPA', 'REINO UNIDO', 'WALSALL', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941262', 'EUROPA', 'REINO UNIDO', 'DORSET', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941263', 'EUROPA', 'REINO UNIDO', 'NOTTINGHAMSHIRE', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941264', 'EUROPA', 'REINO UNIDO', 'SOUTHAMPTON', 'GBR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941301', 'EUROPA', 'GRECIA', 'ATENAS', 'GRC', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941302', 'EUROPA', 'GRECIA', 'SALONICA', 'GRC', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941303', 'EUROPA', 'GRECIA', 'EL PIREO', 'GRC', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941304', 'EUROPA', 'GRECIA', 'CRETA', 'GRC', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941305', 'EUROPA', 'GRECIA', 'LEFKADA', 'GRC', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941306', 'EUROPA', 'GRECIA', 'EGINA', 'GRC', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941307', 'EUROPA', 'GRECIA', 'SANTORINI', 'GRC', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941308', 'EUROPA', 'GRECIA', 'THASOS', 'GRC', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941309', 'EUROPA', 'GRECIA', 'LACONIA', 'GRC', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941310', 'EUROPA', 'GRECIA', 'PAROS', 'GRC', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941311', 'EUROPA', 'GRECIA', 'CORFU', 'GRC', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941312', 'EUROPA', 'GRECIA', 'RODAS', 'GRC', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941313', 'EUROPA', 'GRECIA', 'ISLA DE NAXOS', 'GRC', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941314', 'EUROPA', 'GRECIA', 'TRIPOLI', 'GRC', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941401', 'EUROPA', 'PAISES BAJOS', 'AMSTERDAM', 'NLD', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941402', 'EUROPA', 'PAISES BAJOS', 'ROTERDAM', 'NLD', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941403', 'EUROPA', 'PAISES BAJOS', 'EINDHOVEN', 'NLD', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941404', 'EUROPA', 'PAISES BAJOS', 'LA HAYA', 'NLD', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941405', 'EUROPA', 'PAISES BAJOS', 'ZELANDE', 'NLD', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941406', 'EUROPA', 'PAISES BAJOS', 'OVERIJSSEL', 'NLD', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941407', 'EUROPA', 'PAISES BAJOS', 'HOLANDA SEPTENTRIONAL', 'NLD', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941408', 'EUROPA', 'PAISES BAJOS', 'GELDRE', 'NLD', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941409', 'EUROPA', 'PAISES BAJOS', 'UTRECHT', 'NLD', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941410', 'EUROPA', 'PAISES BAJOS', 'HOLANDA MERIDIONAL', 'NLD', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941411', 'EUROPA', 'PAISES BAJOS', 'ZAANDAM', 'NLD', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941412', 'EUROPA', 'PAISES BAJOS', 'LIMBURGO', 'NLD', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941413', 'EUROPA', 'PAISES BAJOS', 'ANTILLAS NEERLANDESAS', 'NLD', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941414', 'EUROPA', 'PAISES BAJOS', 'BRABANTE SEPTENTRIONAL', 'NLD', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941415', 'EUROPA', 'PAISES BAJOS', 'LEIDEN', 'NLD', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941416', 'EUROPA', 'PAISES BAJOS', 'FRISIA', 'NLD', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941417', 'EUROPA', 'PAISES BAJOS', 'TILBURG', 'NLD', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941418', 'EUROPA', 'PAISES BAJOS', 'GRONINGEN', 'NLD', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941419', 'EUROPA', 'PAISES BAJOS', 'DELFT', 'NLD', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941420', 'EUROPA', 'PAISES BAJOS', 'FLEVOLAND', 'NLD', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941421', 'EUROPA', 'PAISES BAJOS', 'DRENTHE', 'NLD', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941501', 'EUROPA', 'HUNGRIA', 'BUDAPEST', 'HUN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941502', 'EUROPA', 'HUNGRIA', 'SZEGED', 'HUN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941503', 'EUROPA', 'HUNGRIA', 'VESZPREM', 'HUN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941504', 'EUROPA', 'HUNGRIA', 'NOGRAD', 'HUN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941505', 'EUROPA', 'HUNGRIA', 'OND', 'HUN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941506', 'EUROPA', 'HUNGRIA', 'ZALA', 'HUN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941507', 'EUROPA', 'HUNGRIA', 'BARANYA', 'HUN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941508', 'EUROPA', 'HUNGRIA', 'DEBRECEN', 'HUN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941509', 'EUROPA', 'HUNGRIA', 'SOMOGY', 'HUN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941510', 'EUROPA', 'HUNGRIA', 'BACS-KISKUN', 'HUN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941511', 'EUROPA', 'HUNGRIA', 'SZABOLCS SZATMAR-BEREG', 'HUN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941512', 'EUROPA', 'HUNGRIA', 'GYÖR', 'HUN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941513', 'EUROPA', 'HUNGRIA', 'VAS', 'HUN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941514', 'EUROPA', 'HUNGRIA', 'BEKES', 'HUN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941515', 'EUROPA', 'HUNGRIA', 'FEJER', 'HUN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941516', 'EUROPA', 'HUNGRIA', 'PEST', 'HUN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941517', 'EUROPA', 'HUNGRIA', 'MISKOLC', 'HUN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941518', 'EUROPA', 'HUNGRIA', 'KAZINCBARCIKA', 'HUN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941601', 'EUROPA', 'ISLANDIA', 'REYKJAVIK', 'ISL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941602', 'EUROPA', 'HUNGRIA', 'KEFLAVIK', 'HUN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941603', 'EUROPA', 'HUNGRIA', 'NORÐURLAND EYSTRA', 'HUN', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941701', 'EUROPA', 'ITALIA', 'BOLONIA', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941702', 'EUROPA', 'ITALIA', 'CHIAVARI', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941703', 'EUROPA', 'ITALIA', 'FLORENCIA', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941704', 'EUROPA', 'ITALIA', 'GENOVA', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941705', 'EUROPA', 'ITALIA', 'LIVORNO', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941706', 'EUROPA', 'ITALIA', 'MILAN', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941707', 'EUROPA', 'ITALIA', 'NAPOLES', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941708', 'EUROPA', 'ITALIA', 'PALERMO', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941709', 'EUROPA', 'ITALIA', 'ROMA', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941710', 'EUROPA', 'ITALIA', 'TRIESTE', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941711', 'EUROPA', 'ITALIA', 'TURIN', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941712', 'EUROPA', 'ITALIA', 'VENETO', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941713', 'EUROPA', 'ITALIA', 'CERDEÑA', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941714', 'EUROPA', 'ITALIA', 'UMBRIA', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941715', 'EUROPA', 'ITALIA', 'LACIO', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941716', 'EUROPA', 'ITALIA', 'ABRUZOS', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941717', 'EUROPA', 'ITALIA', 'MARCAS', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941718', 'EUROPA', 'ITALIA', 'BASILICATA', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941719', 'EUROPA', 'ITALIA', 'SICILIA', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941720', 'EUROPA', 'ITALIA', 'VERCELLI', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941721', 'EUROPA', 'ITALIA', 'MOLISE', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941722', 'EUROPA', 'ITALIA', 'LA SPEZIA', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941723', 'EUROPA', 'ITALIA', 'SIENA', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941724', 'EUROPA', 'ITALIA', 'PADUA', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941725', 'EUROPA', 'ITALIA', 'PIAMONTE', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941726', 'EUROPA', 'ITALIA', 'TRENTINO ALTO ADIGIO', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941727', 'EUROPA', 'ITALIA', 'FRIULI VENEZIA GIULIA', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941728', 'EUROPA', 'ITALIA', 'CALABRIA', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941729', 'EUROPA', 'ITALIA', 'APULIA', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941730', 'EUROPA', 'ITALIA', 'LIGURIA', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941731', 'EUROPA', 'ITALIA', 'LOMBARDIA', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941732', 'EUROPA', 'ITALIA', 'LUCA', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941733', 'EUROPA', 'ITALIA', 'TALMASSONS', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941734', 'EUROPA', 'ITALIA', 'BARI', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941735', 'EUROPA', 'ITALIA', 'CATANIA', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941736', 'EUROPA', 'ITALIA', 'CAMPANIA', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941737', 'EUROPA', 'ITALIA', 'REGGIO', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941738', 'EUROPA', 'ITALIA', 'FORLI', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941739', 'EUROPA', 'ITALIA', 'PARMA', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941740', 'EUROPA', 'ITALIA', 'TOSCANA', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941741', 'EUROPA', 'ITALIA', 'VALLE DE AOSTA', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941742', 'EUROPA', 'ITALIA', 'CESENA', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941743', 'EUROPA', 'ITALIA', 'EMILIA ROMAGNA', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941744', 'EUROPA', 'ITALIA', 'LE MARCHE', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941745', 'EUROPA', 'ITALIA', 'AGRIGENTO', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941746', 'EUROPA', 'ITALIA', 'BRESCIA', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941747', 'EUROPA', 'ITALIA', 'PIACENZA', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941748', 'EUROPA', 'ITALIA', 'PERUGIA', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941749', 'EUROPA', 'ITALIA', 'BERGAMO', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941750', 'EUROPA', 'ITALIA', 'SAVONA', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941751', 'EUROPA', 'ITALIA', 'LECCE', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941752', 'EUROPA', 'ITALIA', 'LECCE-GALLIPOLI', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941753', 'EUROPA', 'ITALIA', 'VICENZA', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941754', 'EUROPA', 'ITALIA', 'VENECIA', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941755', 'EUROPA', 'ITALIA', 'BOLZANO', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941756', 'EUROPA', 'ITALIA', 'VARESE', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941757', 'EUROPA', 'ITALIA', 'IMPERIA', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941758', 'EUROPA', 'ITALIA', 'LECCO', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941759', 'EUROPA', 'ITALIA', 'NOVARA', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941760', 'EUROPA', 'ITALIA', 'MONZA', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941761', 'EUROPA', 'ITALIA', 'LODI', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941762', 'EUROPA', 'ITALIA', 'COMO', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941763', 'EUROPA', 'ITALIA', 'PESCARA', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941764', 'EUROPA', 'ITALIA', 'CUNEO', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941765', 'EUROPA', 'ITALIA', 'ASTI', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941766', 'EUROPA', 'ITALIA', 'BIELLA', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941767', 'EUROPA', 'ITALIA', 'VERBANIA', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941768', 'EUROPA', 'ITALIA', 'VERBANO CUSIO OSSOLA', 'ITA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941801', 'EUROPA', 'IRLANDA', 'DUBLIN', 'IRL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941802', 'EUROPA', 'IRLANDA', 'LEINSTER', 'IRL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941803', 'EUROPA', 'IRLANDA', 'MUNSTER', 'IRL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941804', 'EUROPA', 'IRLANDA', 'GALWAY', 'IRL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941805', 'EUROPA', 'IRLANDA', 'FOXFORD', 'IRL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941806', 'EUROPA', 'IRLANDA', 'DONEGAL', 'IRL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941807', 'EUROPA', 'IRLANDA', 'KILKENNY', 'IRL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941808', 'EUROPA', 'IRLANDA', 'CORK', 'IRL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941809', 'EUROPA', 'IRLANDA', 'WATERFORD', 'IRL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941810', 'EUROPA', 'IRLANDA', 'KILDARE', 'IRL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941811', 'EUROPA', 'IRLANDA', 'CAVAN', 'IRL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941812', 'EUROPA', 'IRLANDA', 'ROSCOMMON', 'IRL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941813', 'EUROPA', 'IRLANDA', 'WICKLOW', 'IRL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('941901', 'EUROPA', 'LIECHTENSTEIN', 'VADUZ', 'LIE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942001', 'EUROPA', 'LUXEMBURGO', 'LUXEMBURGO', 'LUX', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942101', 'EUROPA', 'MALTA', 'LA VALETTA', 'MLT', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942201', 'EUROPA', 'MONACO', 'PRINCIPADO DE MONTECARLO', 'MCO', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942202', 'EUROPA', 'MONACO', 'PRINCIPADO DE MONACO', 'MCO', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942301', 'EUROPA', 'NORUEGA', 'BERGEN', 'NOR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942302', 'EUROPA', 'NORUEGA', 'OSLO', 'NOR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942303', 'EUROPA', 'NORUEGA', 'OSTFOLD', 'NOR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942304', 'EUROPA', 'NORUEGA', 'TRONDHEIM', 'NOR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942305', 'EUROPA', 'NORUEGA', 'FINNMARK', 'NOR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942306', 'EUROPA', 'NORUEGA', 'SOGN OG FJORDANE', 'NOR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942307', 'EUROPA', 'NORUEGA', 'ROGALAND', 'NOR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942308', 'EUROPA', 'NORUEGA', 'TROMS', 'NOR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942309', 'EUROPA', 'NORUEGA', 'HORDALAND', 'NOR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942310', 'EUROPA', 'NORUEGA', 'NORDLAND', 'NOR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942311', 'EUROPA', 'NORUEGA', 'VESTFOLD', 'NOR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942312', 'EUROPA', 'NORUEGA', 'BUSKERUD', 'NOR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942313', 'EUROPA', 'NORUEGA', 'HEDMARK', 'NOR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942314', 'EUROPA', 'NORUEGA', 'NORD-TRONDELAG', 'NOR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942315', 'EUROPA', 'NORUEGA', 'AUST-AGDER', 'NOR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942316', 'EUROPA', 'NORUEGA', 'AKERSHUS', 'NOR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942317', 'EUROPA', 'NORUEGA', 'STAVANGER', 'NOR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942318', 'EUROPA', 'NORUEGA', 'TELEMARK', 'NOR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942319', 'EUROPA', 'NORUEGA', 'ARENDAL', 'NOR', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942401', 'EUROPA', 'POLONIA', 'VARSOVIA', 'POL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942402', 'EUROPA', 'POLONIA', 'GDYNIA', 'POL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942403', 'EUROPA', 'POLONIA', 'LODZ', 'POL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942404', 'EUROPA', 'POLONIA', 'NOWY SACZ', 'POL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942405', 'EUROPA', 'POLONIA', 'RADON', 'POL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942406', 'EUROPA', 'POLONIA', 'WILNO', 'POL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942407', 'EUROPA', 'POLONIA', 'SZCZECIN', 'POL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942408', 'EUROPA', 'POLONIA', 'SIEDLCE', 'POL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942409', 'EUROPA', 'POLONIA', 'LUBLIN', 'POL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942410', 'EUROPA', 'POLONIA', 'KATOWICE', 'POL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942411', 'EUROPA', 'POLONIA', 'SWIECANY', 'POL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942412', 'EUROPA', 'POLONIA', 'ZAMOSC', 'POL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942413', 'EUROPA', 'POLONIA', 'KIELCE', 'POL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942414', 'EUROPA', 'POLONIA', 'LWOW', 'POL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942415', 'EUROPA', 'POLONIA', 'GDANSK', 'POL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942416', 'EUROPA', 'POLONIA', 'LOMZA', 'POL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942417', 'EUROPA', 'POLONIA', 'OSTROWIEC', 'POL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942418', 'EUROPA', 'POLONIA', 'JRUVIESHUV', 'POL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942419', 'EUROPA', 'POLONIA', 'WALBRZYCH', 'POL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942420', 'EUROPA', 'POLONIA', 'LESZNO', 'POL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942421', 'EUROPA', 'POLONIA', 'SOSNOWIEC', 'POL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942422', 'EUROPA', 'POLONIA', 'OPOLE', 'POL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942423', 'EUROPA', 'POLONIA', 'TYSZOWCE', 'POL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942424', 'EUROPA', 'POLONIA', 'BIALYSTOK', 'POL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942425', 'EUROPA', 'POLONIA', 'SOWINIEC', 'POL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942426', 'EUROPA', 'POLONIA', 'LIPSK', 'POL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942427', 'EUROPA', 'POLONIA', 'CRACOVIA', 'POL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942428', 'EUROPA', 'POLONIA', 'WROCLAW', 'POL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942429', 'EUROPA', 'POLONIA', 'POZNAN', 'POL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942430', 'EUROPA', 'POLONIA', 'SUWALKI', 'POL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942431', 'EUROPA', 'POLONIA', 'OLSZTYN', 'POL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942432', 'EUROPA', 'POLONIA', 'BYDGOSZCZ', 'POL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942433', 'EUROPA', 'POLONIA', 'ELK', 'POL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942434', 'EUROPA', 'POLONIA', 'BIELSKO-BIALA', 'POL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942435', 'EUROPA', 'POLONIA', 'OPPELN', 'POL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942436', 'EUROPA', 'POLONIA', 'PODKARPACKIE', 'POL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942437', 'EUROPA', 'POLONIA', 'MAZURIA', 'POL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942438', 'EUROPA', 'POLONIA', 'BAJA SILESIA', 'POL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942439', 'EUROPA', 'POLONIA', 'TARNOW', 'POL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942440', 'EUROPA', 'POLONIA', 'PEQUEÑA POLONIA', 'POL', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942501', 'EUROPA', 'PORTUGAL', 'FUNCHAL', 'PRT', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942502', 'EUROPA', 'PORTUGAL', 'LISBOA', 'PRT', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942503', 'EUROPA', 'PORTUGAL', 'MACAO', 'PRT', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942504', 'EUROPA', 'PORTUGAL', 'OPORTO', 'PRT', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942505', 'EUROPA', 'PORTUGAL', 'BRAGA', 'PRT', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942506', 'EUROPA', 'PORTUGAL', 'COIMBRA', 'PRT', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942507', 'EUROPA', 'PORTUGAL', 'VIANA DO CASTELO', 'PRT', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942508', 'EUROPA', 'PORTUGAL', 'AVEIRO', 'PRT', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942509', 'EUROPA', 'PORTUGAL', 'LEIRIA', 'PRT', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942510', 'EUROPA', 'PORTUGAL', 'MADEIRA', 'PRT', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942511', 'EUROPA', 'PORTUGAL', 'SANTAREM', 'PRT', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942512', 'EUROPA', 'PORTUGAL', 'FARO', 'PRT', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942513', 'EUROPA', 'PORTUGAL', 'VISEU', 'PRT', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942514', 'EUROPA', 'PORTUGAL', 'CASTELO BRANCO', 'PRT', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942515', 'EUROPA', 'PORTUGAL', 'SETUBAL', 'PRT', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942516', 'EUROPA', 'PORTUGAL', 'EVORA', 'PRT', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942517', 'EUROPA', 'PORTUGAL', 'ALGARVE', 'PRT', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942601', 'EUROPA', 'RUMANIA', 'BUCAREST', 'ROU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942602', 'EUROPA', 'RUMANIA', 'BRICENI', 'ROU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942603', 'EUROPA', 'RUMANIA', 'PETROSANI', 'ROU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942604', 'EUROPA', 'RUMANIA', 'TIMISOARA', 'ROU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942605', 'EUROPA', 'RUMANIA', 'NOVOSELITZA', 'ROU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942606', 'EUROPA', 'RUMANIA', 'IASI', 'ROU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942607', 'EUROPA', 'RUMANIA', 'ORADEA', 'ROU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942608', 'EUROPA', 'RUMANIA', 'SATU MARE', 'ROU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942609', 'EUROPA', 'RUMANIA', 'CRAIOVA', 'ROU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942610', 'EUROPA', 'RUMANIA', 'SUCEAVA', 'ROU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942611', 'EUROPA', 'RUMANIA', 'BESARABIA', 'ROU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942612', 'EUROPA', 'RUMANIA', 'BRASOV', 'ROU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942613', 'EUROPA', 'RUMANIA', 'CLUJ-NAPOCA', 'ROU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942614', 'EUROPA', 'RUMANIA', 'JOTIN', 'ROU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942615', 'EUROPA', 'RUMANIA', 'YURCOUTZ', 'ROU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942616', 'EUROPA', 'RUMANIA', 'BACAU', 'ROU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942617', 'EUROPA', 'RUMANIA', 'SIBIU', 'ROU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942618', 'EUROPA', 'RUMANIA', 'TIMIS', 'ROU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942619', 'EUROPA', 'RUMANIA', 'CHERNEWITZ', 'ROU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942620', 'EUROPA', 'RUMANIA', 'MURES', 'ROU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942621', 'EUROPA', 'RUMANIA', 'BUZAU', 'ROU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942622', 'EUROPA', 'RUMANIA', 'VASLUI', 'ROU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942623', 'EUROPA', 'RUMANIA', 'IALOMITA', 'ROU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942624', 'EUROPA', 'RUMANIA', 'PRAHOVA', 'ROU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942625', 'EUROPA', 'RUMANIA', 'ARGES', 'ROU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942626', 'EUROPA', 'RUMANIA', 'NEAMT', 'ROU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942627', 'EUROPA', 'RUMANIA', 'CONSTANTA', 'ROU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942628', 'EUROPA', 'RUMANIA', 'GORJ', 'ROU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942629', 'EUROPA', 'RUMANIA', 'DIMBOVITA', 'ROU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942630', 'EUROPA', 'RUMANIA', 'TULCEA', 'ROU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942631', 'EUROPA', 'RUMANIA', 'ALBA', 'ROU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942632', 'EUROPA', 'RUMANIA', 'ILFOV', 'ROU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942633', 'EUROPA', 'RUMANIA', 'COVASNA', 'ROU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942634', 'EUROPA', 'RUMANIA', 'ARAD', 'ROU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942635', 'EUROPA', 'RUMANIA', 'GALATI', 'ROU', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942701', 'EUROPA', 'SUECIA', 'ESTOCOLMO', 'SWE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942702', 'EUROPA', 'SUECIA', 'GOTEMBURGO', 'SWE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942703', 'EUROPA', 'SUECIA', 'MALMO', 'SWE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942704', 'EUROPA', 'SUECIA', 'SÖDERMANLAND', 'SWE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942705', 'EUROPA', 'SUECIA', 'UPPSALA', 'SWE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942706', 'EUROPA', 'SUECIA', 'VÄSTERBOTTEN', 'SWE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942707', 'EUROPA', 'SUECIA', 'VÄSTERÅS', 'SWE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942708', 'EUROPA', 'SUECIA', 'ÖSTERGÖTLAND', 'SWE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942709', 'EUROPA', 'SUECIA', 'VÄSTERNORRLAND', 'SWE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942710', 'EUROPA', 'SUECIA', 'ÖREBRO', 'SWE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942711', 'EUROPA', 'SUECIA', 'NORRBOTTEN', 'SWE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942712', 'EUROPA', 'SUECIA', 'JÖNKÖPING', 'SWE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942713', 'EUROPA', 'SUECIA', 'KOPPARBERG', 'SWE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942714', 'EUROPA', 'SUECIA', 'KRONOBERG', 'SWE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942715', 'EUROPA', 'SUECIA', 'GOTLAND', 'SWE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942716', 'EUROPA', 'SUECIA', 'KALMAR', 'SWE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942717', 'EUROPA', 'SUECIA', 'VÄRMLAND', 'SWE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942718', 'EUROPA', 'SUECIA', 'GÄVLEBORG', 'SWE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942719', 'EUROPA', 'SUECIA', 'DALARNA', 'SWE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942720', 'EUROPA', 'SUECIA', 'ESCANIA', 'SWE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942801', 'EUROPA', 'SUIZA', 'BASILEA CIUDAD', 'CHE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942802', 'EUROPA', 'SUIZA', 'BERNA', 'CHE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942803', 'EUROPA', 'SUIZA', 'GINEBRA', 'CHE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942804', 'EUROPA', 'SUIZA', 'LAUSSANE', 'CHE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942805', 'EUROPA', 'SUIZA', 'LUCERNA', 'CHE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942806', 'EUROPA', 'SUIZA', 'LUGANO', 'CHE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942807', 'EUROPA', 'SUIZA', 'NEUCHATEL', 'CHE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942808', 'EUROPA', 'SUIZA', 'SCHAFFNAUSEN', 'CHE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942809', 'EUROPA', 'SUIZA', 'ZURICH', 'CHE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942810', 'EUROPA', 'SUIZA', 'FRIBURGO', 'CHE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942811', 'EUROPA', 'SUIZA', 'TESINO', 'CHE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942812', 'EUROPA', 'SUIZA', 'ARGOVIA', 'CHE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942813', 'EUROPA', 'SUIZA', 'VAUD', 'CHE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942814', 'EUROPA', 'SUIZA', 'VEVEY', 'CHE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942815', 'EUROPA', 'SUIZA', 'ZUG', 'CHE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942816', 'EUROPA', 'SUIZA', 'SAN GALL', 'CHE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942817', 'EUROPA', 'SUIZA', 'GLARUS', 'CHE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942818', 'EUROPA', 'SUIZA', 'SCHWYZ', 'CHE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942819', 'EUROPA', 'SUIZA', 'LOCARNO', 'CHE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942820', 'EUROPA', 'SUIZA', 'TURGOVIA', 'CHE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942821', 'EUROPA', 'SUIZA', 'THURGAU', 'CHE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942822', 'EUROPA', 'SUIZA', 'STANS', 'CHE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942823', 'EUROPA', 'SUIZA', 'JURA', 'CHE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942824', 'EUROPA', 'SUIZA', 'BASILEA CAMPIÑA', 'CHE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942825', 'EUROPA', 'SUIZA', 'SOLOTHURN', 'CHE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942826', 'EUROPA', 'SUIZA', 'VALAIS', 'CHE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942827', 'EUROPA', 'SUIZA', 'AARGAU', 'CHE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942828', 'EUROPA', 'SUIZA', 'GRAUBÜNDEN', 'CHE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942829', 'EUROPA', 'SUIZA', 'URI', 'CHE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942830', 'EUROPA', 'SUIZA', 'APPENZELL RODAS EXTERIORES', 'CHE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942901', 'EUROPA', 'RUSIA', 'MOSCU', 'RUS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942902', 'EUROPA', 'RUSIA', 'BAKU', 'RUS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942903', 'EUROPA', 'RUSIA', 'LENINGRADO', 'RUS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942904', 'EUROPA', 'RUSIA', 'ASTRAKHAN', 'RUS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942905', 'EUROPA', 'RUSIA', 'MURMANSK', 'RUS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942906', 'EUROPA', 'RUSIA', 'CHELYABINSK', 'RUS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942907', 'EUROPA', 'RUSIA', 'ROSTOV', 'RUS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942908', 'EUROPA', 'RUSIA', 'MORDOVIA', 'RUS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942909', 'EUROPA', 'RUSIA', 'OMSK', 'RUS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942910', 'EUROPA', 'RUSIA', 'SAN PETERSBURGO', 'RUS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942911', 'EUROPA', 'RUSIA', 'VOLOGDA', 'RUS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942912', 'EUROPA', 'RUSIA', 'KRASNODAR', 'RUS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942913', 'EUROPA', 'RUSIA', 'ORENBURG', 'RUS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942914', 'EUROPA', 'RUSIA', 'SMOLENSK', 'RUS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942915', 'EUROPA', 'RUSIA', 'KALUGA', 'RUS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942916', 'EUROPA', 'RUSIA', 'PSKOV', 'RUS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942917', 'EUROPA', 'RUSIA', 'PAVLOVSK', 'RUS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942918', 'EUROPA', 'RUSIA', 'TVER', 'RUS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942919', 'EUROPA', 'RUSIA', 'KIROV', 'RUS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942920', 'EUROPA', 'RUSIA', 'SEVASTOPOL', 'RUS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942921', 'EUROPA', 'RUSIA', 'STAVROPOL', 'RUS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942922', 'EUROPA', 'RUSIA', 'ALMATY', 'RUS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942923', 'EUROPA', 'RUSIA', 'KEMEROV', 'RUS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942924', 'EUROPA', 'RUSIA', 'PERM', 'RUS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942925', 'EUROPA', 'RUSIA', 'VORONEZH', 'RUS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942926', 'EUROPA', 'RUSIA', 'VLADIMIR', 'RUS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942927', 'EUROPA', 'RUSIA', 'VOLGOGRADO', 'RUS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942928', 'EUROPA', 'RUSIA', 'SVERDLOVSK', 'RUS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942929', 'EUROPA', 'RUSIA', 'JABAROVSK', 'RUS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942930', 'EUROPA', 'RUSIA', 'KALMYKIA', 'RUS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942931', 'EUROPA', 'RUSIA', 'NIZHNIY NOVGOROD', 'RUS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942932', 'EUROPA', 'RUSIA', 'BELGOROD', 'RUS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942933', 'EUROPA', 'RUSIA', 'LIPETSK', 'RUS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942934', 'EUROPA', 'RUSIA', 'NOVGOROD', 'RUS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942935', 'EUROPA', 'RUSIA', 'VLADIVOSTOK', 'RUS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942936', 'EUROPA', 'RUSIA', 'ARJANGUELSK', 'RUS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942937', 'EUROPA', 'RUSIA', 'PENZA', 'RUS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942938', 'EUROPA', 'RUSIA', 'TEBERDA', 'RUS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942939', 'EUROPA', 'RUSIA', 'KALININGRADO', 'RUS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942940', 'EUROPA', 'RUSIA', 'TULA', 'RUS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942941', 'EUROPA', 'RUSIA', 'KAZAJSTAN', 'RUS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942942', 'EUROPA', 'RUSIA', 'YAROSLAVL', 'RUS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942943', 'EUROPA', 'RUSIA', 'BRIANSK', 'RUS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942944', 'EUROPA', 'RUSIA', 'BASHKORTOSTAN', 'RUS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942945', 'EUROPA', 'RUSIA', 'SAJALIN', 'RUS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942946', 'EUROPA', 'RUSIA', 'NOVOSIBIRSK', 'RUS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942947', 'EUROPA', 'RUSIA', 'KOMI', 'RUS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942948', 'EUROPA', 'RUSIA', 'AMUR', 'RUS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942949', 'EUROPA', 'RUSIA', 'SAMARA', 'RUS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942950', 'EUROPA', 'RUSIA', 'OBLAST DE TIUMEN', 'RUS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942951', 'EUROPA', 'RUSIA', 'ARSENYEV', 'RUS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942952', 'EUROPA', 'RUSIA', 'TRANSBAIKALIA', 'RUS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942953', 'EUROPA', 'RUSIA', 'TADJIKISTAN', 'RUS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('942954', 'EUROPA', 'RUSIA', 'REPUBLICA DE CARELIA', 'RUS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('943001', 'EUROPA', 'SERBIA', 'BELGRADO', 'SRB', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('943002', 'EUROPA', 'MONTENEGRO', 'MONTENEGRO', 'MNE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('943003', 'EUROPA', 'CROACIA', 'CROACIA', 'HRV', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('943004', 'EUROPA', 'CROACIA', 'ZAGREB', 'HRV', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('943005', 'EUROPA', 'CROACIA', 'RIJEKA', 'HRV', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('943006', 'EUROPA', 'SERBIA', 'ZRENJANIN', 'SRB', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('943007', 'EUROPA', 'BOSNIA Y HERZEGOVINA', 'OCENOVICI', 'BIH', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('943008', 'EUROPA', 'SERBIA', 'SERBIA', 'SRB', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('943009', 'EUROPA', 'MONTENEGRO', 'PLAV', 'MNE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('943010', 'EUROPA', 'SERBIA', 'NOVI SAD', 'SRB', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('943011', 'EUROPA', 'CROACIA', 'RADOSIC', 'HRV', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('943012', 'EUROPA', 'RUSIA', 'QUISCA', 'RUS', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('943013', 'EUROPA', 'BOSNIA Y HERZEGOVINA', 'BOS.GRADISKA', 'BIH', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('943014', 'EUROPA', 'MONTENEGRO', 'KOLASIN', 'MNE', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('943015', 'EUROPA', 'CROACIA', 'KRISTANOVEC', 'HRV', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('943016', 'EUROPA', 'SERBIA', 'LOZNICA', 'SRB', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('943017', 'EUROPA', 'CROACIA', 'ZADAR', 'HRV', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('943101', 'EUROPA', 'CROACIA', 'ZADAR', 'HRV', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('943102', 'EUROPA', 'CROACIA', 'BRAC', 'HRV', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('943103', 'EUROPA', 'CROACIA', 'KNIN', 'HRV', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('943104', 'EUROPA', 'CROACIA', 'RIJEKA', 'HRV', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('943105', 'EUROPA', 'CROACIA', 'PULA', 'HRV', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('943106', 'EUROPA', 'CROACIA', 'SINJ', 'HRV', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('943107', 'EUROPA', 'CROACIA', 'KRK', 'HRV', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('943108', 'EUROPA', 'CROACIA', 'ZAGREB', 'HRV', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('943109', 'EUROPA', 'CROACIA', 'SERNA', 'HRV', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('943110', 'EUROPA', 'CROACIA', 'DUBROVNIK', 'HRV', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('943111', 'EUROPA', 'CROACIA', 'SPUT', 'HRV', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('943201', 'EUROPA', 'MOLDAVIA', 'BESARABIA', 'MDA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('943202', 'EUROPA', 'MOLDAVIA', 'KISHINEV', 'MDA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('943203', 'EUROPA', 'MOLDAVIA', 'DONDUSENI', 'MDA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('943204', 'EUROPA', 'MOLDAVIA', 'LIPCANI', 'MDA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('943205', 'EUROPA', 'MOLDAVIA', 'SLOBODZEJA', 'MDA', 1, NULL, NULL, NULL);
INSERT INTO `tbl_ubigeo` VALUES ('943206', 'EUROPA', 'MOLDAVIA', 'TIRASPOL', 'MDA', 1, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for tbl_usuario
-- ----------------------------
DROP TABLE IF EXISTS `tbl_usuario`;
CREATE TABLE `tbl_usuario`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_persona` int(32) NULL DEFAULT NULL,
  `usuario` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `password` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `create_at` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `user_create_at` int(32) NULL DEFAULT NULL,
  `create_up` datetime(6) NULL DEFAULT NULL,
  `user_create_up` int(32) NULL DEFAULT NULL,
  `update_password` tinyint(1) NULL DEFAULT NULL,
  `estado` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_usuario
-- ----------------------------
INSERT INTO `tbl_usuario` VALUES (1, 1, 'JVICENTEQ', 'e10adc3949ba59abbe56e057f20f883e', '2021-08-27 12:14:07.428221', NULL, '2021-10-01 10:41:03.000000', 1, 1, 1);
INSERT INTO `tbl_usuario` VALUES (2, 4, '70389258', '1192f784f2e3a9a28723e01e3029e882', '2021-09-21 23:58:26.958305', NULL, NULL, NULL, NULL, 1);
INSERT INTO `tbl_usuario` VALUES (17, 21, '70897099', '1e4f05b6d5e9f4a1547b3dabc5445e4f', '2021-09-22 16:39:05.503530', NULL, NULL, NULL, NULL, 1);

-- ----------------------------
-- Table structure for tbl_usuario_rol
-- ----------------------------
DROP TABLE IF EXISTS `tbl_usuario_rol`;
CREATE TABLE `tbl_usuario_rol`  (
  `id_usuario` int(32) NOT NULL,
  `id_rol` int(32) NOT NULL,
  PRIMARY KEY (`id_usuario`, `id_rol`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_usuario_rol
-- ----------------------------
INSERT INTO `tbl_usuario_rol` VALUES (1, 1);
INSERT INTO `tbl_usuario_rol` VALUES (2, 4);
INSERT INTO `tbl_usuario_rol` VALUES (17, 4);

-- ----------------------------
-- Procedure structure for sp_accesos
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_accesos`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_accesos`(
_action VARCHAR(10),
_id_usuario int(32),
_id_rol INT(32),
_id_menu INT(32),
_accesos VARCHAR(50)
)
BEGIN

DECLARE strLen INT DEFAULT 0;
DECLARE subStrlen INT DEFAULT 0;

SET _id_rol = (SELECT id_rol from tbl_usuario_rol where id_usuario = _id_usuario limit 1);

case _action
WHEN 'add' THEN
	
	SET strLen=CHAR_LENGTH(_accesos);
	
	ins_accesos: LOOP
		SET strLen = CHAR_LENGTH(_accesos);

		IF strLen > 0 THEN
			IF(SELECT id FROM tbl_submenu where id=SUBSTRING_INDEX( _accesos , '|', 1 ) )is NULL THEN
					SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El menu no existe', MYSQL_ERRNO = 1001;
			ELSEIF(SELECT id_usuario from tbl_accesos_usuario where id_usuario=_id_usuario and id_rol=_id_rol and id_submenu=SUBSTRING_INDEX( _accesos , '|', 1 )) IS NULL  THEN					
					insert into tbl_accesos_usuario(id_usuario,id_rol,id_submenu) values(_id_usuario,_id_rol,SUBSTRING_INDEX( _accesos , '|', 1 ) );
			END IF;
		END IF;
					
		SET subStrlen = CHAR_LENGTH(SUBSTRING_INDEX( _accesos , '|',1 )) + 2;
		SET _accesos = MID( _accesos , subStrLen, strLen);

		IF _accesos='' THEN
			LEAVE ins_accesos; 
		END IF; 

	END LOOP ins_accesos;

WHEN 'add_all' THEN
	
	SET _accesos = (SELECT GROUP_CONCAT(id) from tbl_submenu where id_menu = _id_menu);
	SET strLen=CHAR_LENGTH(_accesos);
	
	ins_accesos: LOOP
		SET strLen = CHAR_LENGTH(_accesos);

		IF strLen > 0 THEN
			IF(SELECT id FROM tbl_submenu where id=SUBSTRING_INDEX( _accesos , ',', 1 ) )is NULL THEN
					SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El menu no existe', MYSQL_ERRNO = 1001;
			ELSEIF(SELECT id_usuario from tbl_accesos_usuario where id_usuario=_id_usuario and id_rol=_id_rol and id_submenu=SUBSTRING_INDEX( _accesos , ',', 1 )) IS NULL  THEN				
				insert into tbl_accesos_usuario(id_usuario,id_rol,id_submenu) values(_id_usuario,_id_rol,SUBSTRING_INDEX( _accesos , ',', 1 ) );					
			END IF;
		END IF;
					
		SET subStrlen = CHAR_LENGTH(SUBSTRING_INDEX( _accesos , ',',1 )) + 2;
		SET _accesos = MID( _accesos , subStrLen, strLen);

		IF _accesos='' THEN
			LEAVE ins_accesos; 
		END IF; 

	END LOOP ins_accesos;

WHEN 'rmv' THEN
	
	SET strLen=CHAR_LENGTH(_accesos);
	
	dlt_accesos: LOOP
		SET strLen = CHAR_LENGTH(_accesos);
		
		IF(SELECT id_usuario FROM tbl_accesos_usuario where id_usuario=_id_usuario and id_rol=_id_rol and id_submenu=SUBSTRING_INDEX( _accesos , '|', 1 )) IS NULL THEN
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

WHEN 'rmv_all' THEN
	
	SET _accesos = (SELECT GROUP_CONCAT(id_submenu) from tbl_accesos_usuario where id_usuario = _id_usuario);
	SET strLen=CHAR_LENGTH(_accesos);
	
	dlt_accesos: LOOP
		SET strLen = CHAR_LENGTH(_accesos);
		
		IF(SELECT id_usuario FROM tbl_accesos_usuario where id_usuario=_id_usuario and id_rol=_id_rol and id_submenu=SUBSTRING_INDEX( _accesos , ',', 1 )) IS NULL THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error', MYSQL_ERRNO = 1001;
		ELSE
			DELETE FROM tbl_accesos_usuario where id_usuario=_id_usuario and id_rol=_id_rol and id_submenu=SUBSTRING_INDEX( _accesos , ',', 1 );
		END IF;
		
		SET subStrlen = CHAR_LENGTH(SUBSTRING_INDEX( _accesos , ',',1 )) + 2;
		SET _accesos = MID( _accesos , subStrLen, strLen);
		
		IF _accesos='' THEN
			LEAVE dlt_accesos; 
		END IF; 
	END LOOP dlt_accesos;
	
END CASE;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_accesos_rol
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_accesos_rol`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_accesos_rol`(
_action VARCHAR(10),
_id_rol INT(32),
_id_menu INT(32),
_accesos VARCHAR(50)
)
BEGIN

DECLARE strLen INT DEFAULT 0;
DECLARE subStrlen INT DEFAULT 0;

case _action
WHEN 'add' THEN
	
	SET strLen=CHAR_LENGTH(_accesos);
	
	ins_accesos: LOOP
		SET strLen = CHAR_LENGTH(_accesos);

		IF strLen > 0 THEN
			IF(SELECT id FROM tbl_submenu where id=SUBSTRING_INDEX( _accesos , '|', 1 ) )is NULL THEN
					SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El menu no existe', MYSQL_ERRNO = 1001;
			ELSEIF(SELECT id_rol from tbl_accesos_rol where id_rol=_id_rol and id_submenu=SUBSTRING_INDEX( _accesos , '|', 1 )) IS NULL  THEN					
					insert into tbl_accesos_rol(id_rol,id_submenu) values(_id_rol,SUBSTRING_INDEX( _accesos , '|', 1 ) );
			END IF;
		END IF;
					
		SET subStrlen = CHAR_LENGTH(SUBSTRING_INDEX( _accesos , '|',1 )) + 2;
		SET _accesos = MID( _accesos , subStrLen, strLen);

		IF _accesos='' THEN
			LEAVE ins_accesos; 
		END IF; 

	END LOOP ins_accesos;

WHEN 'add_all' THEN
	
	SET _accesos = (SELECT GROUP_CONCAT(id) from tbl_submenu where id_menu = _id_menu);
	SET strLen=CHAR_LENGTH(_accesos);
	
	ins_accesos: LOOP
		SET strLen = CHAR_LENGTH(_accesos);

		IF strLen > 0 THEN
			IF(SELECT id FROM tbl_submenu where id=SUBSTRING_INDEX( _accesos , ',', 1 ) )is NULL THEN
					SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El menu no existe', MYSQL_ERRNO = 1001;
			ELSEIF(SELECT id_rol from tbl_accesos_rol where id_rol=_id_rol and id_submenu=SUBSTRING_INDEX( _accesos , ',', 1 )) IS NULL  THEN				
				insert into tbl_accesos_rol(id_rol,id_submenu) values(_id_rol,SUBSTRING_INDEX( _accesos , ',', 1 ) );					
			END IF;
		END IF;
					
		SET subStrlen = CHAR_LENGTH(SUBSTRING_INDEX( _accesos , ',',1 )) + 2;
		SET _accesos = MID( _accesos , subStrLen, strLen);

		IF _accesos='' THEN
			LEAVE ins_accesos; 
		END IF; 

	END LOOP ins_accesos;

WHEN 'rmv' THEN
	
	SET strLen=CHAR_LENGTH(_accesos);
	
	dlt_accesos: LOOP
		SET strLen = CHAR_LENGTH(_accesos);
		
		IF(SELECT id_rol FROM tbl_accesos_rol where id_rol=_id_rol and id_submenu=SUBSTRING_INDEX( _accesos , '|', 1 )) IS NULL THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error', MYSQL_ERRNO = 1001;
		ELSE
			DELETE FROM tbl_accesos_rol where id_rol=_id_rol and id_submenu=SUBSTRING_INDEX( _accesos , '|', 1 );
		END IF;
		
		SET subStrlen = CHAR_LENGTH(SUBSTRING_INDEX( _accesos , '|',1 )) + 2;
		SET _accesos = MID( _accesos , subStrLen, strLen);
		
		IF _accesos='' THEN
			LEAVE dlt_accesos; 
		END IF; 
	END LOOP dlt_accesos;

WHEN 'rmv_all' THEN
	
	SET _accesos = (SELECT GROUP_CONCAT(id_submenu) from tbl_accesos_rol where id_rol = _id_rol);
	SET strLen=CHAR_LENGTH(_accesos);
	
	dlt_accesos: LOOP
		SET strLen = CHAR_LENGTH(_accesos);
		
		IF(SELECT id_rol FROM tbl_accesos_rol where id_rol=_id_rol and id_submenu=SUBSTRING_INDEX( _accesos , ',', 1 )) IS NULL THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error', MYSQL_ERRNO = 1001;
		ELSE
			DELETE FROM tbl_accesos_rol where id_rol=_id_rol and id_submenu=SUBSTRING_INDEX( _accesos , ',', 1 );
		END IF;
		
		SET subStrlen = CHAR_LENGTH(SUBSTRING_INDEX( _accesos , ',',1 )) + 2;
		SET _accesos = MID( _accesos , subStrLen, strLen);
		
		IF _accesos='' THEN
			LEAVE dlt_accesos; 
		END IF; 
	END LOOP dlt_accesos;
	
END CASE;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_alumno
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_alumno`;
delimiter ;;
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
				
				IF (SELECT id FROM tbl_alumno WHERE id_persona = _id_persona) IS NULL THEN
						INSERT INTO tbl_alumno(id_persona) values(_id_persona);
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
				UPDATE tbl_alumno SET estado= NOT estado WHERE id= _id;
			ELSE
				SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Acción no válida', MYSQL_ERRNO = 1001;
		END CASE;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_concurso
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_concurso`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_concurso`( 
	_action varchar(10),
	_id int(32),	
	_description VARCHAR(255),
	_resumen varchar(255),
	_fecha varchar(255),
	_hora_inicio varchar(255),
	_hora_fin varchar(255),
	_direccion varchar(255),
	_monto_inscripcion varchar(255),
	_url_img varchar(255),
	_preguntas text,
	_opciones text,
	_respuestas text,
	_id_usuario int
)
BEGIN

DECLARE strLen      INT DEFAULT 0;
DECLARE subStrLen   INT DEFAULT 0;
DECLARE strLen_1    INT DEFAULT 0;
DECLARE subStrLen_1 INT DEFAULT 0;

DECLARE strLen_options    INT DEFAULT 0;
DECLARE subStrLen_options INT DEFAULT 0;

DECLARE separetor1 CHAR(2) DEFAULT ',';
DECLARE separetor2 CHAR(2) DEFAULT '|';

DECLARE separetor_1 CHAR(2) DEFAULT ',,';
DECLARE separetor_2 CHAR(2) DEFAULT '||';
DECLARE separetor_3 CHAR(2) DEFAULT '¡!';

DECLARE _id_persona INT DEFAULT 0;

DECLARE _opciones_x_pregunta text default null; 
DECLARE _opcion varchar(255) default null;
DECLARE _respuesta varchar(255) default null;
DECLARE _fecha_date DATE DEFAULT STR_TO_DATE( _fecha, '%d/%m/%Y' ); 
DECLARE _descripcion_opcion varchar(255) default null; 
DECLARE _is_correct int(1) default null; 

DECLARE _id_pregunta INT DEFAULT 0;
DECLARE _pregunta_data varchar(850) DEFAULT null;
DECLARE _pregunta VARCHAR(850) DEFAULT 0;
DECLARE _id_opcion INT DEFAULT 0;
DECLARE _id_opcion_correcta INT DEFAULT 0;
DECLARE _id_inscripcion INT DEFAULT 0;
DECLARE _puntaje INT DEFAULT 0;
DECLARE _puntaje_total INT DEFAULT 0;

DECLARE i_preguntas INT DEFAULT 1;
DECLARE i_opciones INT DEFAULT 1;

DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
			ROLLBACK;
			RESIGNAL;
	END;
START TRANSACTION;


CASE _action
	WHEN 'ins' THEN
	
		IF(SELECT id FROM tbl_concurso where description=_description and fecha = _fecha_date ) IS NULL THEN
		
			INSERT INTO tbl_concurso(description,resumen,fecha,hora_inicio,hora_fin,direccion,monto_inscripcion,url_img) 
				VALUES(_description,_resumen,_fecha_date,STR_TO_DATE(_hora_inicio,'%h:%i %p'),STR_TO_DATE(_hora_fin,'%h:%i %p'),_direccion,_monto_inscripcion,_url_img);
			
			SET _id = (SELECT LAST_INSERT_ID());
			
			/*BUCLE PARA INSERTAR CARACTERISTICAS*/
			ins_preguntas: LOOP
		
				SET strLen = CHAR_LENGTH(_preguntas);
				SET strLen_options = CHAR_LENGTH(_opciones);
				
				IF strLen > 0 THEN
					-- SET _id_pregunta = (SELECT LAST_INSERT_ID());
					SET _pregunta_data = SUBSTRING_INDEX( _preguntas , separetor_2 , 1 );
					
					SET _pregunta = SUBSTRING_INDEX( _pregunta_data , separetor_2 , 1 );										
					SET _puntaje = SUBSTRING(
						_pregunta_data,
						CHAR_LENGTH(SUBSTRING_INDEX( _pregunta_data , separetor_1, 1 )) + 3,
						CHAR_LENGTH(SUBSTRING_INDEX( _pregunta_data , separetor_1, 2 )) - 3
					);
					
					INSERT into tbl_pregunta(id_concurso,nro_orden,description) values(_id, i_preguntas, _pregunta);
					SET _id_pregunta = (SELECT LAST_INSERT_ID());
					SET i_preguntas = i_preguntas + 1;
				END IF;
								
				SET subStrLen = CHAR_LENGTH(SUBSTRING_INDEX( _preguntas , separetor_2, 1 )) + 3;
				SET _preguntas = MID( _preguntas , subStrLen, strLen);
				
				SET _opciones_x_pregunta = SUBSTRING_INDEX( _opciones , separetor_3, 1 );
				
				/* BLUCLE PARA LAS OPCIONES */
				ins_opciones: LOOP
					
					SET strLen_1 = CHAR_LENGTH(_opciones_x_pregunta);
					
					IF strLen_1 > 0 THEN
					
						SET _opcion = SUBSTRING_INDEX( _opciones_x_pregunta , separetor_2 , 1 );
						
						SET _descripcion_opcion = SUBSTRING_INDEX( _opcion , separetor_1, 1 );
						
						SET _is_correct = SUBSTRING(
							_opcion,
							CHAR_LENGTH(SUBSTRING_INDEX( _opcion , separetor_1, 1 )) + 3,
							CHAR_LENGTH(SUBSTRING_INDEX( _opcion , separetor_1, 2 )) - 3
						);
						
						insert into tbl_opcion(id_pregunta,nro_orden,description,es_correcto) values(_id_pregunta, i_opciones, _descripcion_opcion, _is_correct );
						SET i_opciones = i_opciones + 1;
						
					END IF;
					
					SET subStrLen_1 = CHAR_LENGTH(SUBSTRING_INDEX( _opciones_x_pregunta , separetor_2, 1 )) + 3;
					SET _opciones_x_pregunta = MID( _opciones_x_pregunta , subStrLen_1, strLen_1);
					
					IF _opciones_x_pregunta = '' THEN
						LEAVE ins_opciones;
					END IF;
					
				END LOOP ins_opciones;
				/* FIN DE BUCLE PARA OPCIONES */
				
				SET subStrLen_options = CHAR_LENGTH(SUBSTRING_INDEX( _opciones , separetor_3, 1 )) + 3;
				SET _opciones = MID( _opciones , subStrLen_options, strLen_options);
				
				SET i_opciones = 1;
	
				IF _preguntas = '' THEN
					LEAVE ins_preguntas;
				END IF;
			END LOOP ins_preguntas;
			
		ELSE
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El concurso ya existe', MYSQL_ERRNO = 1001;	
		END IF;
		
	WHEN 'upd' THEN
	
		IF(SELECT id FROM tbl_concurso where description=_description and fecha = _fecha_date and id<>_id) IS NULL THEN
		
			UPDATE tbl_concurso set description=_description,resumen=_resumen,fecha = _fecha_date,
				hora_inicio = STR_TO_DATE(_hora_inicio,'%h:%i %p') ,hora_fin = STR_TO_DATE(_hora_fin,'%h:%i %p'),
				direccion = _direccion, monto_inscripcion = _monto_inscripcion, url_img = _url_img WHERE id=_id;
			
			DELETE FROM tbl_opcion  WHERE id_pregunta in ( select p.id from tbl_pregunta p where p.id_concurso = _id);			
			DELETE FROM tbl_pregunta WHERE id_concurso = _id;
			
			/*BUCLE PARA INSERTAR CARACTERISTICAS*/
			ins_preguntas: LOOP
		
				SET strLen = CHAR_LENGTH(_preguntas);
				SET strLen_options = CHAR_LENGTH(_opciones);
				
				IF strLen > 0 THEN
					insert into tbl_pregunta(id_concurso,nro_orden,description) values(_id, i_preguntas, SUBSTRING_INDEX( _preguntas , separetor_2 , 1 ) );
					SET _id_pregunta = (SELECT LAST_INSERT_ID());
					SET i_preguntas = i_preguntas + 1;
				END IF;
								
				SET subStrLen = CHAR_LENGTH(SUBSTRING_INDEX( _preguntas , separetor_2, 1 )) + 3;
				SET _preguntas = MID( _preguntas , subStrLen, strLen);
				
				SET _opciones_x_pregunta = SUBSTRING_INDEX( _opciones , separetor_3, 1 );
				
				/* BLUCLE PARA LAS OPCIONES */
				ins_opciones: LOOP
					
					SET strLen_1 = CHAR_LENGTH(_opciones_x_pregunta);
					
					IF strLen_1 > 0 THEN
					
						SET _opcion = SUBSTRING_INDEX( _opciones_x_pregunta , separetor_2 , 1 );
						
						SET _descripcion_opcion = SUBSTRING_INDEX( _opcion , separetor_1, 1 );
						
						SET _is_correct = SUBSTRING(
							_opcion,
							CHAR_LENGTH(SUBSTRING_INDEX( _opcion , separetor_1, 1 )) + 3,
							CHAR_LENGTH(SUBSTRING_INDEX( _opcion , separetor_1, 2 )) - 3
						);
						
						insert into tbl_opcion(id_pregunta,nro_orden,description,es_correcto) values(_id_pregunta, i_opciones, _descripcion_opcion, _is_correct );
						SET i_opciones = i_opciones + 1;
						
					END IF;
					
					SET subStrLen_1 = CHAR_LENGTH(SUBSTRING_INDEX( _opciones_x_pregunta , separetor_2, 1 )) + 3;
					SET _opciones_x_pregunta = MID( _opciones_x_pregunta , subStrLen_1, strLen_1);
					
					IF _opciones_x_pregunta = '' THEN
						LEAVE ins_opciones;
					END IF;
					
				END LOOP ins_opciones;
				/* FIN DE BUCLE PARA OPCIONES */
				
				SET subStrLen_options = CHAR_LENGTH(SUBSTRING_INDEX( _opciones , separetor_3, 1 )) + 3;
				SET _opciones = MID( _opciones , subStrLen_options, strLen_options);
				
				SET i_opciones = 1;
	
				IF _preguntas = '' THEN
					LEAVE ins_preguntas;
				END IF;
			END LOOP ins_preguntas;
			
		ELSE
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error al actualizar el curso', MYSQL_ERRNO = 1001;
		END IF;
		
	WHEN 'sv_res' THEN 
		
		SET _id_persona = ( SELECT id_persona FROM tbl_usuario where id = _id_usuario );
		UPDATE tbl_inscripcion SET respuestas = _respuestas WHERE id_concurso = _id and id_persona = _id_persona;
		
		SET _puntaje_total = 0;
		
		/* BLUCLE PARA CALCULAR EL PUNTAJE*/
		calc_puntaje: LOOP
			
			SET strLen_1 = CHAR_LENGTH(_respuestas);
			
			IF strLen_1 > 0 THEN
			
				SET _respuesta = SUBSTRING_INDEX( _respuestas , separetor2 , 1 );
				
				SET _id_pregunta = SUBSTRING_INDEX( _respuesta , separetor1 , 1 );
				
				SET _id_opcion = SUBSTRING(
					_respuesta,
					CHAR_LENGTH(SUBSTRING_INDEX( _respuesta , separetor1, 1 )) + 2,
					CHAR_LENGTH(SUBSTRING_INDEX( _respuesta , separetor1, 2 )) - 2
				);
				
				SET _puntaje = ( SELECT puntaje FROM tbl_pregunta WHERE id = _id_pregunta );
				SET _id_opcion_correcta = ( SELECT id FROM tbl_opcion WHERE es_correcto = 1 and id_pregunta = _id_pregunta limit 1 );
								
				IF _id_opcion = _id_opcion_correcta THEN
					SET _puntaje_total = _puntaje_total + _puntaje;
				END IF;
				
			END IF;
			
			SET subStrLen_1 = CHAR_LENGTH(SUBSTRING_INDEX( _respuestas , separetor2, 1 )) + 2;
			SET _respuestas = MID( _respuestas , subStrLen_1, strLen_1);
			
			IF _respuestas = '' THEN
				LEAVE calc_puntaje;
			END IF;
			
		END LOOP calc_puntaje;
		/* FIN DE BUCLE PARA OPCIONES */
		
		UPDATE tbl_inscripcion SET puntaje = _puntaje_total WHERE id_concurso = _id and id_persona = _id_persona;
		
	WHEN 'est' THEN
		UPDATE tbl_curso SET estado= NOT estado WHERE id=_id;
	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Acción no válida', MYSQL_ERRNO = 1001;
END CASE;


COMMIT;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_curso
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_curso`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_curso`( 
	_action varchar(10),
	_id int(32),
	_description VARCHAR(255),
	_resumen varchar(255),
	_caractaristicas text,
	_beneficios text
)
BEGIN

DECLARE strLen    INT DEFAULT 0;
DECLARE subStrLen INT DEFAULT 0;


CASE _action
	WHEN 'ins' THEN
		IF(SELECT id FROM tbl_curso where description=_description) IS NULL THEN
		
			INSERT into tbl_curso(description,resumen) VALUES(_description,_resumen);
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
		
			UPDATE tbl_curso set description=_description,resumen=_resumen where id=_id;
			
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
		UPDATE tbl_curso SET estado= NOT estado WHERE id=_id;
	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Acción no válida', MYSQL_ERRNO = 1001;

END CASE;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_curso_programado
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_curso_programado`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_curso_programado`(
_action varchar(10),
_id int(32),
_id_curso int(32),
_fecha_inicio VARCHAR(50),
_fecha_fin VARCHAR(50),
_cant_mensualidades int,
_url_img VARCHAR(255),
_link_clase varchar(750),
_tipos_pago text,
_turnos text,
_id_usuario int(32),
_id_persona int(32))
begin

DECLARE strLen    INT  DEFAULT 0;
DECLARE subStrLen INT  DEFAULT 0;
DECLARE dataText  TEXT DEFAULT "";

DECLARE _id_tipo_pago int DEFAULT 0;
DECLARE _monto decimal(50,2) DEFAULT 0;

DECLARE _id_turno int DEFAULT 0;
DECLARE _hora_inicio time DEFAULT 0;
DECLARE _hora_fin time DEFAULT 0;

DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
			ROLLBACK;
			RESIGNAL;
	END;
START TRANSACTION;

case _action
	WHEN 'ins' then
		IF(SELECT ID FROM tbl_curso WHERE id=_id_curso) is NULL THEN
		
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El curso no existe' , MYSQL_ERRNO = 1001;
			
		ELSEIF(SELECT id FROM tbl_curso_programado where id=_id) IS NULL THEN
		
			INSERT INTO tbl_curso_programado(id_curso,create_at,user_create_at,fecha_inicio,fecha_fin,url_img,id_persona,link_clase,cant_mensualidades)
			VALUES(_id_curso,CURRENT_TIMESTAMP,_id_usuario,STR_TO_DATE(_fecha_inicio,'%d/%m/%Y'),
					STR_TO_DATE(_fecha_fin,'%d/%m/%Y'),_url_img,_id_persona,_link_clase,_cant_mensualidades);
			
			
			SET _id = (SELECT LAST_INSERT_ID());
			
			/*BUCLE PARA INSERTAR TIPO DE PAGO*/
			ins_tipo_pago: LOOP
		
				SET strLen = CHAR_LENGTH(_tipos_pago);

				if strLen > 0 THEN
					
					SET dataText = SUBSTRING_INDEX( _tipos_pago , '|', 1 );
					
					SET _id_tipo_pago = SUBSTRING_INDEX( dataText , ',', 1 );
					SET _monto = SUBSTRING( dataText,CHAR_LENGTH(SUBSTRING_INDEX( dataText , ',', 1 )) + 2, CHAR_LENGTH(SUBSTRING_INDEX( dataText , ',', 2 ))-2);
					
					insert into tbl_curso_programado_tipo_pago(id_curso_programado,id_tipo_pago,monto) 
						values(_id, _id_tipo_pago, _monto);
						
				END IF;

				SET subStrLen = CHAR_LENGTH(SUBSTRING_INDEX( _tipos_pago , '|',1 )) + 2;
				SET _tipos_pago = MID( _tipos_pago , subStrLen, strLen);
				
				IF _tipos_pago = '' THEN
					LEAVE ins_tipo_pago;
				END IF;
			END LOOP ins_tipo_pago;
			
			/*BUCLE PARA INSERTAR TURNOS*/
			ins_turnos: LOOP
		
				SET strLen = CHAR_LENGTH(_turnos);

				if strLen > 0 THEN
					
					SET dataText = SUBSTRING_INDEX( _turnos , '|', 1 );
					
					SET _id_turno = SUBSTRING_INDEX( dataText , ',', 1 );
					SET _hora_inicio = STR_TO_DATE(SUBSTRING( dataText,CHAR_LENGTH(SUBSTRING_INDEX( dataText , ',', 1 )) + 2, CHAR_LENGTH(SUBSTRING_INDEX( dataText , ',', 2 ))-2),'%h:%i %p');
					SET _hora_fin = STR_TO_DATE(SUBSTRING( dataText,CHAR_LENGTH(SUBSTRING_INDEX( dataText , ',', 2 )) + 2, CHAR_LENGTH(SUBSTRING_INDEX( dataText , ',', 3 ))-2),'%h:%i %p');
					
					insert into tbl_curso_programado_turno(id_curso_programado,id_turno,hora_inicio,hora_fin)
						values(_id, _id_turno, _hora_inicio,_hora_fin);
						
				END IF;

				SET subStrLen = CHAR_LENGTH(SUBSTRING_INDEX( _turnos , '|',1 )) + 2;
				SET _turnos = MID( _turnos , subStrLen, strLen);
				
				IF _turnos = '' THEN
					LEAVE ins_turnos;
				END IF;
			END LOOP ins_turnos;
			

		ELSE
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error' , MYSQL_ERRNO = 1001;	
		END if;
	WHEN 'upd' THEN
		
		IF(SELECT id FROM tbl_curso_programado where id_curso=_id_curso and id<>_id) IS NULL THEN
			UPDATE tbl_curso_programado set id_curso=_id_curso,fecha_inicio=STR_TO_DATE(_fecha_inicio,'%d/%m/%Y'),link_clase = _link_clase,
				fecha_fin=STR_TO_DATE(_fecha_fin,'%d/%m/%Y'),url_img=_url_img,user_create_up=_id_usuario,create_up=CURRENT_TIMESTAMP,
				cant_mensualidades = _cant_mensualidades WHERE id=_id;
			
			DELETE FROM tbl_curso_programado_turno where id_curso_programado = _id;
			DELETE FROM tbl_curso_programado_tipo_pago where id_curso_programado = _id;
			
			/*BUCLE PARA INSERTAR TIPO DE PAGO*/
			ins_tipo_pago: LOOP
		
				SET strLen = CHAR_LENGTH(_tipos_pago);

				if strLen > 0 THEN
					
					SET dataText = SUBSTRING_INDEX( _tipos_pago , '|', 1 );
					
					SET _id_tipo_pago = SUBSTRING_INDEX( dataText , ',', 1 );
					SET _monto = SUBSTRING( dataText,CHAR_LENGTH(SUBSTRING_INDEX( dataText , ',', 1 )) + 2, CHAR_LENGTH(SUBSTRING_INDEX( dataText , ',', 2 ))-2);
					
					insert into tbl_curso_programado_tipo_pago(id_curso_programado,id_tipo_pago,monto) 
						values(_id, _id_tipo_pago, _monto);
						
				END IF;

				SET subStrLen = CHAR_LENGTH(SUBSTRING_INDEX( _tipos_pago , '|',1 )) + 2;
				SET _tipos_pago = MID( _tipos_pago , subStrLen, strLen);
				
				IF _tipos_pago = '' THEN
					LEAVE ins_tipo_pago;
				END IF;
			END LOOP ins_tipo_pago;
			
			
			/*BUCLE PARA INSERTAR TURNOS*/
			ins_turnos: LOOP
		
				SET strLen = CHAR_LENGTH(_turnos);

				if strLen > 0 THEN
					
					SET dataText = SUBSTRING_INDEX( _turnos , '|', 1 );
					
					SET _id_turno = SUBSTRING_INDEX( dataText , ',', 1 );
					SET _hora_inicio = STR_TO_DATE(SUBSTRING( dataText,CHAR_LENGTH(SUBSTRING_INDEX( dataText , ',', 1 )) + 2, CHAR_LENGTH(SUBSTRING_INDEX( dataText , ',', 2 ))-2),'%h:%i %p');
					SET _hora_fin = STR_TO_DATE(SUBSTRING( dataText,CHAR_LENGTH(SUBSTRING_INDEX( dataText , ',', 2 )) + 2, CHAR_LENGTH(SUBSTRING_INDEX( dataText , ',', 3 ))-2),'%h:%i %p');
					
					insert into tbl_curso_programado_turno(id_curso_programado,id_turno,hora_inicio,hora_fin)
						values(_id, _id_turno, _hora_inicio,_hora_fin);
						
				END IF;

				SET subStrLen = CHAR_LENGTH(SUBSTRING_INDEX( _turnos , '|',1 )) + 2;
				SET _turnos = MID( _turnos , subStrLen, strLen);
				
				IF _turnos = '' THEN
					LEAVE ins_turnos;
				END IF;
			END LOOP ins_turnos;
			
		ELSE
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error al actualizar tabla', MYSQL_ERRNO = 1001;
		END IF;
	WHEN 'est' THEN
		UPDATE tbl_curso_programado SET estado= NOT estado WHERE id=_id AND id_curso=_id_curso;
		ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Acción no válida', MYSQL_ERRNO = 1001;
END CASE;

COMMIT;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_inscripcion
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_inscripcion`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_inscripcion`(
_action varchar(10),
_id int(32),
_dni varchar(8),
_nombre VARCHAR(255),
_apellidop VARCHAR(255),
_apellidom VARCHAR(255),
_correo VARCHAR(255),
_celular VARCHAR(25),
_id_ubigeo VARCHAR(6),
_id_concurso int(32)
)
begin

DECLARE _id_rol int(32) default null;
DECLARE _id_persona int(32) default null;
DECLARE _id_usuario_nuevo int(32) default null;
DECLARE _id_usuario_existente int(32) default null;
DECLARE _monto decimal(30,2) default null;
DECLARE _cant_mensualidades int default null;
DECLARE _i int default 1;
DECLARE _fecha_inicio date default null;

-- Declaramos las variables necesarias 
DECLARE _id_submenu int DEFAULT 0;
DECLARE done INT DEFAULT FALSE;
DECLARE arreglo CURSOR FOR SELECT id_submenu FROM tbl_accesos_rol WHERE id_rol = 5;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;


DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
			ROLLBACK;
			RESIGNAL;
	END;

START TRANSACTION;

case _action
	WHEN 'ins' then	

		SET _id_persona = ( select id from tbl_persona where dni = _dni );
		
		IF _id_persona is null THEN
			call sp_persona('ins', null, _dni, _nombre, _apellidop, _apellidom, _correo, _celular, null, null, _id_ubigeo, null, null);
			SET _id_persona = (SELECT LAST_INSERT_ID());
		ELSEIF (SELECT id_concurso from tbl_inscripcion where id_concurso = _id_concurso and id_persona = _id_persona) is not null THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ya se encuentra inscrito' , MYSQL_ERRNO = 1001;
		END IF;
		
		SET _id_usuario_existente = (SELECT id FROM tbl_usuario where id_persona = _id_persona);
		
		IF _id_usuario_existente IS NULL THEN
		
			insert into tbl_usuario(id_persona,usuario,password) values (_id_persona,_dni,md5(_dni));
			SET _id_usuario_nuevo = (SELECT LAST_INSERT_ID() );
			insert into tbl_usuario_rol(id_usuario,id_rol) values (_id_usuario_nuevo,5);

			INSERT INTO tbl_accesos_usuario (id_usuario,id_submenu,id_rol)
			SELECT _id_usuario_nuevo, id_submenu, 5
			FROM tbl_accesos_rol
			WHERE id_rol = 5;
		ELSE
		
			SET _id_rol = (SELECT id_rol from tbl_usuario_rol where id_usuario = _id_usuario_existente);
			-- Se abre el cursor
			OPEN arreglo;
			loop_recorre: LOOP
				-- Fetch lo utilizamos para leer cada uno de los registros
				FETCH arreglo INTO _id_submenu;

				IF (SELECT id_submenu from tbl_accesos_usuario where id_usuario = _id_usuario_existente and id_submenu = _id_submenu) IS NULL THEN
					INSERT INTO tbl_accesos_usuario(id_usuario,id_submenu,id_rol) VALUES (_id_usuario_existente,_id_submenu,_id_rol);
				END IF;

				-- If que permite salir del ciclo
				IF done THEN 
					LEAVE loop_recorre;
				END IF;

			END LOOP;
			
			-- cerramos el cursor 
			CLOSE arreglo;
			
		END IF;
		
		SET _monto = (select monto_inscripcion from tbl_concurso where id = _id_concurso);

		INSERT INTO tbl_inscripcion(id_concurso,id_persona,monto) VALUES (_id_concurso,_id_persona,_monto);
		SET _id = (SELECT LAST_INSERT_ID());
		
		INSERT INTO tbl_pago(id_inscripcion,id_tipo_pago,monto,estado_pago,fecha_plazo) VALUES(_id,3,_monto,2, date_add(now(), interval 1 day) );
						
	WHEN 'upd' THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error upd' , MYSQL_ERRNO = 1001;	
	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Acción no válida', MYSQL_ERRNO = 1001;
END CASE;

COMMIT;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_login
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_login`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_login`( 
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
			select u.id,u.id_persona,usuario,p.dni,u.update_password,ur.id_rol,
				trim(upper(concat(p.nombre,' ',ifnull(p.apellido_pat,''),' ',ifnull(p.apellido_mat,'')))) as nombre_completo
			from tbl_usuario u
			inner join tbl_persona p on u.id_persona = p.id
			inner join tbl_usuario_rol ur on ur.id_usuario = u.id
			where usuario = _usuario and `password`= md5(_password);
		END IF;
		
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_matricula
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_matricula`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_matricula`(
_action varchar(10),
_id int(32),
_id_alumno int(32),
_dni varchar(8),
_nombre VARCHAR(255),
_apellidop VARCHAR(255),
_apellidom VARCHAR(255),
_correo VARCHAR(255),
_celular VARCHAR(25),
_id_ubigeo VARCHAR(6),
_id_curso_programado int(32),
_id_turno int
)
begin

DECLARE _id_rol int(32) default null;
DECLARE _id_persona int(32) default null;
DECLARE _id_usuario_nuevo int(32) default null;
DECLARE _id_usuario_existente int(32) default null;
DECLARE _monto decimal(30,2) default null;
DECLARE _cant_mensualidades int default null;
DECLARE _i int default 1;
DECLARE _fecha_inicio date default null;

-- Declaramos las variables necesarias 
DECLARE _id_submenu int DEFAULT 0;
DECLARE done INT DEFAULT FALSE;
DECLARE arreglo CURSOR FOR SELECT id_submenu FROM tbl_accesos_rol WHERE id_rol = 4;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
			ROLLBACK;
			RESIGNAL;
	END;

START TRANSACTION;

case _action
	WHEN 'ins' then	
				
		SET _id_persona = ( select id from tbl_persona where dni = _dni );
		SET _id_alumno = (select id from tbl_alumno where id_persona = _id_persona);
		
		IF _id_alumno is null THEN
			call sp_alumno('ins', null, null, _dni, _nombre, _apellidop, _apellidom, _correo, _celular, null, null, _id_ubigeo, null, null);
			SET _id_alumno = (SELECT LAST_INSERT_ID());
		ELSEIF (SELECT id_curso_programado from tbl_matricula where id_curso_programado = _id_curso_programado and id_alumno = _id_alumno) is not null THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El alumno ya se encuentra matriculado para el curso seleccionado' , MYSQL_ERRNO = 1001;		
		END IF;
		
		SET _id_persona = (SELECT id_persona FROM tbl_alumno where id = _id_alumno );
		
		SET _id_usuario_existente = (SELECT id FROM tbl_usuario where id_persona = _id_persona);
		
		IF _id_usuario_existente IS NULL THEN
		
			insert into tbl_usuario(id_persona,usuario,password) values (_id_persona,_dni,md5(_dni));
			SET _id_usuario_nuevo = (SELECT LAST_INSERT_ID() );
			insert into tbl_usuario_rol(id_usuario,id_rol) values (_id_usuario_nuevo,4);

			INSERT INTO tbl_accesos_usuario (id_usuario,id_submenu,id_rol)
			SELECT _id_usuario_nuevo,id_submenu,4
			FROM tbl_accesos_rol
			WHERE id_rol = 4;
			
		ELSE
		
			SET _id_rol = (SELECT id_rol from tbl_usuario_rol where id_usuario = _id_usuario_existente);
			-- Se abre el cursor
			OPEN arreglo;
			loop_recorre: LOOP
				-- Fetch lo utilizamos para leer cada uno de los registros
				FETCH arreglo INTO _id_submenu;

				IF (SELECT id_submenu from tbl_accesos_usuario where id_usuario = _id_usuario_existente and id_submenu = _id_submenu) IS NULL THEN
					INSERT INTO tbl_accesos_usuario(id_usuario,id_submenu,id_rol) VALUES (_id_usuario_existente,_id_submenu,_id_rol);
				END IF;

				-- If que permite salir del ciclo
				IF done THEN 
					LEAVE loop_recorre;
				END IF;

			END LOOP;			
			-- cerramos el cursor 
			CLOSE arreglo;
		END IF;
		
		SET _monto = (select monto from tbl_curso_programado_tipo_pago where id_curso_programado = _id_curso_programado and id_tipo_pago = 1);
		SET _cant_mensualidades = (select cant_mensualidades from tbl_curso_programado where id = _id_curso_programado);
		
		INSERT INTO tbl_matricula(id_curso_programado,id_alumno,id_tipo_pago,id_turno,monto)
			VALUES (_id_curso_programado,_id_alumno,1,_id_turno,_monto);

		SET _id = (SELECT LAST_INSERT_ID());
		SET _fecha_inicio = (select fecha_inicio from tbl_curso_programado where id = _id_curso_programado);
		
		INSERT INTO tbl_pago(id_matricula,id_tipo_pago,monto,estado_pago,fecha_plazo) VALUES(_id,1,_monto,2, date_add(now(), interval 1 day) );
		
		SET _monto = (select monto from tbl_curso_programado_tipo_pago where id_curso_programado = _id_curso_programado and id_tipo_pago = 2);

		IF _monto is not null THEN
			/*BUCLE PARA INSERTAR PAGOS*/
			ins_pagos: LOOP
				
				INSERT INTO tbl_pago(id_matricula,id_tipo_pago,monto,estado_pago,fecha_plazo) VALUES(_id,2,_monto,1,date_add(now(), interval _i month));
				SET _cant_mensualidades = _cant_mensualidades - 1;
				SET _i = _i + 1;
				
				IF _cant_mensualidades <= 0 or _cant_mensualidades is null THEN
					LEAVE ins_pagos;
				END IF;
				
			END LOOP ins_pagos;
		END IF;
				
	WHEN 'upd' THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error upd' , MYSQL_ERRNO = 1001;	
	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Acción no válida', MYSQL_ERRNO = 1001;
END CASE;

COMMIT;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_pago
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_pago`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_pago`( 
	_action varchar(10),
	_id int(32),	
	_url_img varchar(500),
	_opt int,
	_observacion varchar(500),	
	_id_usuario int
)
BEGIN

DECLARE _id_ususario_db int default null;
DECLARE _id_matricula int default null;
DECLARE _estado_pago int default null;
DECLARE _id_siguiente_pago int default null;

CASE _action
	WHEN 'upd_bp' THEN  -- update baucher de pago de matricula/inscripcion a un curso/concurso
	
		SET _id_ususario_db = (SELECT u.id FROM tbl_usuario u INNER JOIN tbl_alumno a on a.id_persona = u.id_persona
			INNER JOIN tbl_matricula m on m.id_alumno = a.id INNER JOIN tbl_pago pa on pa.id_matricula = m.id WHERE pa.id = _id);
	
		IF _id_ususario_db = _id_usuario THEN
			UPDATE tbl_pago SET url_img = _url_img,fecha_pago=CURRENT_DATE,estado_pago = 3 WHERE id = _id;
		ELSE
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Su usuario no tiene permiso para realizar la acción', MYSQL_ERRNO = 1001;	
		END IF;
		
	WHEN 'chk_bp' THEN -- revision baucher de pago de matricula a un curso
		
		SET _id_matricula = (SELECT id_matricula FROM tbl_pago where id = _id);
		SET _estado_pago = (SELECT estado_pago FROM tbl_pago where id = _id);
		
		IF _estado_pago = 3 THEN 
			
			IF _opt = 1 THEN
			
				SET _id_siguiente_pago = ( SELECT id FROM tbl_pago where estado_pago = 1 order by fecha_plazo limit 1 );
				UPDATE tbl_pago SET estado_pago = 5,observacion=_observacion WHERE id = _id;
				UPDATE tbl_pago SET estado_pago = 2 WHERE id = _id_siguiente_pago;
				UPDATE tbl_matricula SET estado_matricula = 2 where id = _id_matricula;
				
			ELSEIF _opt = 2 THEN
				UPDATE tbl_pago SET estado_pago = 4,observacion=_observacion WHERE id = _id;
			END IF;
			
		ELSE
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Acción no valida', MYSQL_ERRNO = 1001;	
		END IF;

	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Acción no válida', MYSQL_ERRNO = 1001;
END CASE;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_persona
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_persona`;
delimiter ;;
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
		UPDATE tbl_persona SET estado= NOT estado WHERE id=_id AND dni=_dni;
		ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Acción no válida', MYSQL_ERRNO = 1001;
END CASE;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_personal
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_personal`;
delimiter ;;
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
				UPDATE tbl_personal SET estado= NOT estado WHERE id= _id;
			ELSE
				SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Acción no válida', MYSQL_ERRNO = 1001;				
			
		END CASE;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_tablas
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_tablas`;
delimiter ;;
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
		UPDATE tbl_tablas SET estado= NOT estado WHERE id_tabla=_id_tabla AND id_registro=_id_registro;
	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Acción no válida', MYSQL_ERRNO = 1001;
END CASE;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_usuario
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_usuario`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_usuario`(
_action varchar(10),
_id int(11),
_id_persona int(32),
_usuario VARCHAR(50),
_password varchar(150),
_old_password varchar(150),
_id_rol int,
_id_usuario int)
BEGIN

DECLARE msg varchar(255) default '';
DECLARE _id_usuario_nuevo int default null;
DECLARE _dni varchar(10) default null;

SET msg = CONCAT('El usuario ', _usuario , ' ya existe' );

CASE _action 
	WHEN 'ins' THEN
	
		IF(SELECT id from tbl_usuario where usuario=_usuario) is not null then
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg, MYSQL_ERRNO = 1001;
		ELSEIF(SELECT id from tbl_usuario where id_persona=_id_persona) IS NOT NULL THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ya existe una cuenta con este DNI', MYSQL_ERRNO = 1001;
		ELSEIF(SELECT id from tbl_persona where id=_id_persona) IS NULL THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El DNI no está registrado en la base de datos', MYSQL_ERRNO = 1001;
		ELSE
		
			INSERT INTO tbl_usuario(id,id_persona,usuario,`password`,create_at,user_create_at,update_password)
					VALUES(_id,_id_persona,_usuario,MD5(_usuario),CURRENT_TIMESTAMP,_id_usuario,0);
			
			SET _id_usuario_nuevo = (SELECT LAST_INSERT_ID() );
			
			INSERT INTO tbl_usuario_rol(id_usuario,id_rol) values (_id_usuario_nuevo,_id_rol);
			
			INSERT INTO tbl_accesos_usuario (id_usuario,id_submenu,id_rol)
			SELECT _id_usuario_nuevo,id_submenu,id_rol
			FROM tbl_accesos_rol
			WHERE id_rol = _id_rol;

		END if;
			
	WHEN'upd' THEN
		IF(SELECT id from tbl_usuario where id_persona=_id_persona and id<>_id) is NULL THEN
		
			UPDATE tbl_usuario SET usuario=_usuario,create_up=CURRENT_TIMESTAMP,user_create_up=_id_usuario,update_password=1
			WHERE	id=_id and id_persona=_id_persona;
			
			UPDATE tbl_usuario_rol SET id_rol = _id_rol WHERE id_usuario = _id AND id_rol = _id_rol;
			
		ELSE
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error al actualizar usuario', MYSQL_ERRNO = 1001;
		END IF;
		
	WHEN 'est' THEN
		UPDATE tbl_usuario SET estado= NOT estado WHERE id=_id;
	
	WHEN 'res' THEN
		SET _usuario = (SELECT usuario from tbl_usuario where id = _id);
		SET _dni = (SELECT dni FROM tbl_persona p INNER JOIN tbl_usuario u on u.id_persona = p.id where u.id = _id);
		
		UPDATE tbl_usuario SET `password` = md5(_dni),update_password = 0 WHERE id=_id;
	
	WHEN 'chng' THEN
		
		IF (select id FROM tbl_usuario WHERE `password`=MD5(_old_password)) IS NOT NULL THEN
			UPDATE tbl_usuario SET `password` = md5(_password),update_password = 1 WHERE id=_id;
		ELSE
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La contraseña actual no es correcta', MYSQL_ERRNO = 1001;
		END IF;
		
	
	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Accion no válida', MYSQL_ERRNO = 1001;
END CASE;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
