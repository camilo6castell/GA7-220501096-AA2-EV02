package ga7.pkg220501096.aa2.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MyConnection {

    public static Connection connect() {

        String sjdbc = "jdbc:mariadb";
        String host = "127.0.0.1";
        String port = "3306";
        String db = "cryptomessage";
        String user = "test";
        String pass = "test";

        String url = sjdbc + "://" + host + ":" + port + "/" + db;

        Connection myConnection = null;

        try {

            // Registrar el driver
            Class.forName("org.mariadb.jdbc.Driver");

            myConnection = DriverManager.getConnection(
                    url, user, pass
            );

            if (myConnection != null) {
                System.out.println("Conexión con la db establecida");
            }

        } catch (ClassNotFoundException e) {
            System.out.println("Error al cargar el driver de MariaDB: " + e.getMessage());
        } catch (SQLException e) {
            System.out.println(
                    "Error, no se ha podido conectar "
                    + "a la base de datos: " + e.getMessage()
            );
        }

        return myConnection;
    }

}
