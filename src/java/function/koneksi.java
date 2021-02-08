/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package function;
import java.sql.*;
/**
 *
 * @author Raynold Panji
 */
public class koneksi {
    public static Connection getKoneksi(){
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/db_frs", "root", ""
            );
        } catch(Exception e) { 
            System.out.print(e); 
        }
        return con;
    }
}
