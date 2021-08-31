<?php

require_once __DIR__ . "/../services/General.php";

class Usuario extends General
{
    private $conexion;

    public function __construct()
    {
        $this->conexion = new Conexion();
    }

    public function login($data)
    {
        $result = ["error" => ""];
        try {

            $cn = $this->conexion->getConexion();
            $sql_val_1 = "select count(id_usuario) cant from tbl_usuario where nom_usuario ilike :usuario";
            $sql_val_2 = "select count(id_usuario) cant from tbl_usuario where nom_usuario ilike :usuario and pass_usuario = md5(:clave)";

            $sql_login = "select distinct
                                u.id_usuario,u.nom_usuario nombre_usuario,d.id_dependencia,d.nom_depen dependencia,pr.id_profesion,
                                p.nombre_rs nombres,p.primer_ape apellido_pat,p.segundo_ape apellido_mat,ps.id_rol,p.id_persona,
                                p.nombre_rs||' '||p.primer_ape||' '||p.segundo_ape nombre_completo,ub.id_ubigeo,ub.distrito,p.nrodoc
                        from tbl_usuario u
                        inner join tbl_persona p on p.id_persona = u.id_persona
                        inner join tbl_profesional pr on pr.id_persona = p.id_persona
                        inner join tbl_profesionalservicio ps on ps.id_profesional = pr.id_profesional and ps.id_usuario = u.id_usuario
                        inner join tbl_dependencia d on d.id_dependencia = ps.id_dependencia
                        left join tbl_ubigeo2019 ub on ub.id_ubigeo = d.id_ubigeo
                        where u.nom_usuario ilike :usuario and d.id_dependencia = :id_est and u.pass_usuario = md5(:clave)";

            $cant = 0;
            $stmt = $cn->prepare($sql_val_1);
            $stmt->bindParam(":usuario", $data["usuario"]);
            $ok = $stmt->execute();
            if ($ok) {
                if ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    $cant = $row["cant"];
                }
                if ($cant == 0) {
                    $result["error"] = "Nombre de usuario no existe";
                }
            } else {
                $result["error"] = "Error en la aunteticación de usuario";
            }

            if (!$result["error"]) {
                $stmt = $cn->prepare($sql_val_2);
                $stmt->bindParam(":usuario", $data["usuario"]);
                $stmt->bindParam(":clave", $data["clave"]);
                $ok = $stmt->execute();
                if ($ok) {
                    if ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                        $cant = $row["cant"];
                    }
                    if ($cant == 0) {
                        $result["error"] = "Contraseña Incorrecta";
                    }
                } else {
                    $result["error"] = "Error en la aunteticación de usuario";
                }
            }

            if (!$result["error"]) {
                $stmt = $cn->prepare($sql_login);
                $stmt->bindParam(":usuario", $data["usuario"]);
                $stmt->bindParam(":clave", $data["clave"]);
                $stmt->bindParam(":id_est", $data["id_est"]);

                $ok = $stmt->execute();
                if ($ok) {
                    if ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                        $result["row"] = $row;
                    } else {
                        $result["error"] = "El usuario o contraseña ingresada es incorrecta";
                    }
                } else {
                    $result["error"] = "Error en la aunteticación de usuario";
                }
            }

        } catch (Exception $ex) {
            $cn = null;
            $result["error"] = $this->error("Error en la aunteticación de usuario", $ex);
        }

        return $result;

    }

    public function changePass($data)
    {
        $result = ["error" => ""];
        try {

            $cn = $this->conexion->getConexion();
            $sql = "select sp_change_pass from sp_change_pass(:id,:current_pass,:new_pass)";

            if (!$result["error"]) {
                $stmt = $cn->prepare($sql);
                $stmt->bindParam(":id", $data["id_usuario"]);
                $stmt->bindParam(":current_pass", $data["current_pass"]);
                $stmt->bindParam(":new_pass", $data["new_pass"]);

                $ok = $stmt->execute();
                if (!$ok) {
                    $result["error"] = "No se pudo guardar los datos";
                } else {
                    if ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                        $result["error"] = $row["sp_change_pass"];
                    }
                }
            }

        } catch (Exception $ex) {
            $cn = null;
            $result["error"] = $this->error("Error", $ex);
        }

        return $result;

    }

    public function changePassReq($data)
    {
        $result = ["error" => ""];
        try {

            $cn = $this->conexion->getConexion();
            $sql = "select sp_change_pass from sp_change_pass(:id,null,:new_pass,true)";

            if (!$result["error"]) {
                $stmt = $cn->prepare($sql);
                $stmt->bindParam(":id", $data["id_usuario"]);
                $stmt->bindParam(":new_pass", $data["pass_usuario"]);

                $ok = $stmt->execute();
                if (!$ok) {
                    $result["error"] = "No se pudo guardar los datos";
                } else {
                    if ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                        $result["error"] = $row["sp_change_pass"];
                    }
                }
            }

        } catch (Exception $ex) {
            $cn = null;
            $result["error"] = $this->error("Error", $ex);
        }

        return $result;

    }

    public function sendEmailCodSeg($data)
    {
        $result = ["error" => ""];
        try {

            $cn = $this->conexion->getConexion();
            $sql = "select sp_insert_cod_seg from sp_insert_cod_seg(:id_usuario,:cod_seg)";

            if (!$result["error"]) {
                $stmt = $cn->prepare($sql);
                $stmt->bindParam(":id_usuario", $data["id_usuario"]);
                $stmt->bindParam(":cod_seg", $data["cod_seg"]);

                $ok = $stmt->execute();
                if (!$ok) {
                    $result["error"] = "No se pudo guardar los datos";
                } else {
                    if ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                        $result["error"] = $row["sp_insert_cod_seg"];
                    }
                }
            }

        } catch (Exception $ex) {
            $cn = null;
            $result["error"] = $this->error("Error", $ex);
        }

        return $result;

    }

    public function validCodSeg($data)
    {
        $result = ["error" => ""];
        try {

            $cn = $this->conexion->getConexion();
            $sql = "select sp_valid_cod_seg from sp_valid_cod_seg(:id_usuario,:cod_seg)";

            if (!$result["error"]) {
                $stmt = $cn->prepare($sql);
                $stmt->bindParam(":id_usuario", $data["id_usuario"]);
                $stmt->bindParam(":cod_seg", $data["correo"]);

                $ok = $stmt->execute();
                if (!$ok) {
                    $result["error"] = "No se pudo guardar los datos";
                } else {
                    if ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                        $result["error"] = $row["sp_valid_cod_seg"];
                    }
                }
            }

        } catch (Exception $ex) {
            $cn = null;
            $result["error"] = $this->error("Error", $ex);
        }

        return $result;

    }

    public function getLoginUsuario($data)
    {
        $result = ["error" => "", "rows" => []];
        try {

            $cn = $this->conexion->getConexion();

            $sql = "select nom_usuario as value from tbl_usuario 
                    where nom_usuario ilike '%'|| :nombre_usuario ||'%'";

            $stmt = $cn->prepare($sql);

            if ($data["nombre_usuario"]) $stmt->bindParam(":nombre_usuario", $data["nombre_usuario"]);
            else $stmt->bindParam(":nombre_usuario", $data["term"]);

            $ok = $stmt->execute();

            if ($ok) {
                if ($data["nombre_usuario"]) {
                    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                        $result["rows"][] = $row;
                    }
                } else {
                    $result = [];
                    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                        $result[] = $row;
                    }
                }

            } else {
                $result["error"] = "No se pudo obtener los datos";
            }

        } catch (Exception $ex) {
            $cn = null;
            $result["error"] = $this->error("Error al obtener listado de usuarios", $ex);
        }

        return $result;

    }

    public function getCbxDependencias($data)
    {
        $result = ["error" => "", "rows" => []];
        $filters = "";
        try {

            if ($data["usuario"]) $filters .= " and u.nom_usuario ilike :usuario ";
            if (trim(substr($filters, 0, 4)) == "and") {
                $filters = substr($filters, 4);
            }

            $cn = $this->conexion->getConexion();
            $sql = "select d.id_dependencia as id,d.nom_depen as descripcion from tbl_usuario u
                    inner join tbl_persona p on p.id_persona = u.id_persona
                    inner join tbl_profesional pr on pr.id_persona = p.id_persona
                    inner join tbl_profesionalservicio ps on ps.id_profesional = pr.id_profesional
                    inner join tbl_dependencia d on d.id_dependencia = ps.id_dependencia
                    where $filters and u.estado = '1'";

            $stmt = $cn->prepare($sql);

            if ($data["usuario"]) $stmt->bindParam(":usuario", $data["usuario"]);

            $ok = $stmt->execute();

            if ($ok) {
                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    $result["rows"][] = $row;
                }
            } else {
                $result["error"] = "No se pudo obtener los datos";
            }

        } catch (Exception $ex) {
            $cn = null;
            $result["error"] = $this->error("Error al obtener listado de usuarios", $ex);
        }
        return $result;
    }

    public function getCantRows($data)
    {
        $result = 0;
        $filters = $data["filters_str"];

        try {

            $cn = $this->conexion->getConexion();
            $qry_sel = "select count(us.id_usuario) cant_rows from tbl_usuario us inner join tbl_persona pr on us.id_persona=pr.id_persona $filters";
            $stmt = $cn->prepare($qry_sel);
            foreach ($data as $key => &$value) {
                if ($value && ($key != 'filters_str' && $key != 'limit')) $stmt->bindParam(":" . $key, $value);
            }
            $ok = $stmt->execute();
            if ($ok) {
                if ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    $result = $row["cant_rows"];
                }
            }
        } catch (Exception $ex) {
            $cn = null;
            exit($ex->getMessage());
        }

        return (int)$result;

    }

    public function getUsuarios($data)
    {
        $result = ["error" => "", "rows" => [], "cantRows" => 0];
        $filters = $data["filters_str"];
        $limit = $data["limit"];
        try {
            $cn = $this->conexion->getConexion();
            $qry_sel = "select us.id_usuario,pr.nrodoc Documento, concat(pr.primer_ape,pr.segundo_ape, pr.nombre_rs) Persona,us.nom_usuario  usuario,
            to_char(us.fec_expiracion, 'dd/mm/yyyy')  Fec_caduca,
                        us.estado, (case when us.estado=1 then 'Activado' ELSE 'Desactivado' END) Estado_str from tbl_usuario us 
                        inner join tbl_persona pr on us.id_persona=pr.id_persona $filters order by us.id_usuario $limit";

            $stmt = $cn->prepare($qry_sel);
            foreach ($data as $key => &$value) {
                if ($value && ($key != 'filters_str' && $key != 'limit')) $stmt->bindParam(":" . $key, $value);
            }
            $ok = $stmt->execute();

            if ($ok) {
                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    $result["rows"][] = $row;
                }
                $result["cantRows"] = $this->getCantRows($data);
            } else {
                $result["error"] = "Error";
            }

        } catch (Exception $ex) {
            $cn = null;
            $result["error"] = $this->error("Error", $ex);
        }
        return $result;
    }

    public function getCbxPersonal($data)
    {
        $result = ["error" => "", "rows" => []];
        $filters = $data["filters_str"];
        try {
            $cn = $this->conexion->getConexion();
            $qry_sel = "Select p.id_persona id,
Case When p.primer_ape isNull Then '' Else p.primer_ape End||' '||Case When p.segundo_ape isNull Then '' Else p.segundo_ape End ||' '||p.nombre_rs as text,
substr(p.nombre_rs,1,1)||p.primer_ape||substr(p.segundo_ape,1,1) log_gen,p.nrodoc
						From tbl_profesional pro  
            Inner Join tbl_persona p On pro.id_persona = p.id_persona 
                        $filters order by 2";
            //echo $qry_sel;exit();
            $stmt = $cn->prepare($qry_sel);
            foreach ($data as $key => &$value) {
                if ($value && ($key != 'filters_str' && $key != 'limit')) $stmt->bindParam(":" . $key, $value);
            }
            $ok = $stmt->execute();

            if ($ok) {
                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    $result["rows"][] = $row;
                }
            } else {
                $result["error"] = "Error";
            }

        } catch (Exception $ex) {
            $cn = null;
            $result["error"] = $this->error("Error", $ex);
        }
        return $result;
    }

    public function getCbxCargos($data)
    {
        $result = ["error" => "", "rows" => []];
        $filters = $data["filters_str"];
        try {
            $cn = $this->conexion->getConexion();
            $qry_sel = "select id_cargo id, nom_cargo nombre from tbl_cargo  
                        $filters order by 2";
            //echo $qry_sel;exit();
            $stmt = $cn->prepare($qry_sel);
            foreach ($data as $key => &$value) {
                if ($value && ($key != 'filters_str' && $key != 'limit')) $stmt->bindParam(":" . $key, $value);
            }
            $ok = $stmt->execute();

            if ($ok) {
                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    $result["rows"][] = $row;
                }
            } else {
                $result["error"] = "Error";
            }

        } catch (Exception $ex) {
            $cn = null;
            $result["error"] = $this->error("Error", $ex);
        }
        return $result;
    }

    public function getCbxRoles($data)
    {
        $result = ["error" => "", "rows" => []];
        $filters = $data["filters_str"];
        try {
            $cn = $this->conexion->getConexion();
            $qry_sel = "select id_rol id, nom_rol nombre from tbl_rol  
                        $filters order by 2";
            //echo $qry_sel;exit();
            $stmt = $cn->prepare($qry_sel);
            foreach ($data as $key => &$value) {
                if ($value && ($key != 'filters_str' && $key != 'limit')) $stmt->bindParam(":" . $key, $value);
            }
            $ok = $stmt->execute();

            if ($ok) {
                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    $result["rows"][] = $row;
                }
            } else {
                $result["error"] = "Error";
            }

        } catch (Exception $ex) {
            $cn = null;
            $result["error"] = $this->error("Error", $ex);
        }
        return $result;
    }

    public function checkDniUser($data)
    {
        $result = ["error" => "", "rows" => []];
        $filters = $data["filters_str"];
        try {
            $cn = $this->conexion->getConexion();
            $qry_sel = "select md5(us.id_usuario::varchar) id_usuario,
                        concat(pe.nombre_rs,' '||pe.primer_ape,' '||pe.segundo_ape) usuario,
                        (select email from tbl_historialemail where id_persona = pe.id_persona order by create_at desc limit 1) email
                      from tbl_usuario us inner join tbl_persona pe on pe.id_persona = us.id_persona $filters limit 1";
            //echo $qry_sel;exit();
            $stmt = $cn->prepare($qry_sel);
            foreach ($data as $key => &$value) {
                if ($value && ($key != 'filters_str' && $key != 'limit')) $stmt->bindParam(":" . $key, $value);
            }
            $ok = $stmt->execute();

            if ($ok) {
                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    $result["rows"][] = $row;
                }
            } else {
                $result["error"] = "Error";
            }

        } catch (Exception $ex) {
            $cn = null;
            $result["error"] = $this->error("Error", $ex);
        }
        return $result;
    }

}














