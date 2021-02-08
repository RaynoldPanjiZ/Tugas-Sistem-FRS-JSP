/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package function;
import function.admin.fmatkul;
import java.sql.*;
import java.util.ArrayList; 
import java.util.List; 
/**
 *
 * @author Raynold Panji
 */
public class profile {
    public static int update(fprofile u) { 
        int status = 0;
        try {
            Connection con = koneksi.getKoneksi();
            PreparedStatement ps = con.prepareStatement(
                "update tb_user set level=?,username=?,password=? where id_user=?"
            );
//            ps.setString(1, u.getLevel()); 
//            ps.setString(2, u.getUsername()); 
//            ps.setString(3, u.getPassword()); 
//            ps.setString(4, u.getIduser());
            status = ps.executeUpdate();
        } catch (Exception e) { 
            System.out.println(e);
        }
        return status;
    }
    
    public static fprofile getRecordById(String id, String akses) { 
        fprofile u = null;
        try {
            Connection con = koneksi.getKoneksi();
            
            if (akses.equals("mahasiswa")){
                PreparedStatement ps = con.prepareStatement(
                    "select * from tb_mhs where nim=?"
                );
                ps.setString(1, id);
                ResultSet rs = ps.executeQuery(); 
                while (rs.next()) {
                    u = new fprofile(); 
                    u.setNim(rs.getString("nim")); 
                    u.setNama(rs.getString("nama")); 
                    u.setNotelp(rs.getString("no_telp")); 
                    u.setEmail(rs.getString("email")); 
                    u.setKelas(rs.getString("kelas")); 

                    System.out.println(u.getNama());
                }
            } else if (akses.equals("dosen")){
                PreparedStatement ps = con.prepareStatement(
                    "select * from tb_dosen where nip=?"
                );
                ps.setString(1, id);
                ResultSet rs = ps.executeQuery(); 
                while (rs.next()) {
                    u = new fprofile(); 
                    u.setNip(rs.getString("nip")); 
                    u.setNama(rs.getString("nama")); 
                    u.setNotelp(rs.getString("no_telp")); 
                    u.setEmail(rs.getString("email")); 
                    u.setStatus(rs.getString("status")); 

                    System.out.println(u.getNama());
                }
            }
            
        } catch (Exception e) { 
            System.out.println(e);
        } return u;
    }
}
