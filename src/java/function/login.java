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
public class login {
    
    public static boolean validate(flogin gt){
        boolean status = false;
        try {
            Connection con=koneksi.getKoneksi();
            PreparedStatement ps = con.prepareStatement(
                    "select * from tb_mhs where email=? AND password=?"
            );
            
            ps.setString(1, gt.getEmail());
            ps.setString(2, gt.getPassword());
            
            ResultSet rs = ps.executeQuery();
            status = rs.next();
            
            if(status) {
                gt.setNim(rs.getString("nim"));
                gt.setEmail(rs.getString("email"));
                gt.setPassword(rs.getString("password"));
                gt.setLevel("mahasiswa");
            } else {
                ps = con.prepareStatement(
                    "select * from tb_dosen where email=? AND password=?"
                );

                ps.setString(1, gt.getEmail());
                ps.setString(2, gt.getPassword());

                rs = ps.executeQuery();
                status = rs.next();
                if(status) {
                    gt.setNip(rs.getString("nip"));
                    gt.setEmail(rs.getString("email"));
                    gt.setPassword(rs.getString("password"));
                    gt.setLevel("dosen");
                } else {
                    ps = con.prepareStatement(
                        "select * from tb_admin where email=? AND password=?"
                    );

                    ps.setString(1, gt.getEmail());
                    ps.setString(2, gt.getPassword());

                    rs = ps.executeQuery();
                    status = rs.next();
                    if(status) {
                        gt.setIdadmin(rs.getString("id_admin"));
                        gt.setEmail(rs.getString("email"));
                        gt.setPassword(rs.getString("password"));
                        gt.setLevel("admin");
                    }
                }
            }
        } catch(Exception e) {
            System.out.println(e);
        }
        return status;
    }
}
