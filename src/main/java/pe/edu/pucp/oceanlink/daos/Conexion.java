package pe.edu.pucp.oceanlink.daos;

import java.sql.Connection;
import java.sql.SQLException;

public class Conexion {
    public static Connection abrir() throws SQLException {
        return DaoBase.obtenerConexion();
    }
}
