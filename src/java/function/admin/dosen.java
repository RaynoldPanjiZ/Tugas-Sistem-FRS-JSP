/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package function.admin;
import function.koneksi;
import java.sql.*;
import java.util.ArrayList; 
import java.util.List; 
/**
 *
 * @author Raynold Panji
 */
public class dosen {
    public static List<fdosen> getAllRecords(){ 
        List<fdosen> list=new ArrayList<fdosen>();
        try{
            Connection con=koneksi.getKoneksi();
            PreparedStatement ps=con.prepareStatement("select * from tb_dosen"); 
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                fdosen u=new fdosen(); 
                u.setNip(rs.getString("nip")); 
                u.setNama(rs.getString("nama")); 
                u.setNotelp(rs.getString("no_telp")); 
                u.setEmail(rs.getString("email")); 
                u.setPassword(rs.getString("password")); 
                u.setStatus(rs.getString("status")); 
                list.add(u);
            }
        }catch(Exception e){
            System.out.println(e);
        } return list;
    }
    
    public static int save(fdosen gt) { 
        int status = 0;
        try {
            Connection con = koneksi.getKoneksi();
            PreparedStatement ps = con.prepareStatement(
                    "insert into `tb_dosen` (nip,nama,no_telp,email,password,status) values (?,?,?,?,?,?)"
            );
            ps.setString(1, gt.getNip()); 
            ps.setString(2, gt.getNama()); 
            ps.setString(3, gt.getNotelp()); 
            ps.setString(4, gt.getEmail());
            ps.setString(5, gt.getPassword());
            ps.setString(6, gt.getStatus());
            status = ps.executeUpdate();
        } catch (Exception e) { 
            System.out.println(e);
        }
        return status;
    }    
    
    public static int update(fdosen gt) { 
        int status = 0;
        try {
            Connection con = koneksi.getKoneksi();
            PreparedStatement ps = con.prepareStatement(
                "update tb_dosen set nama=?,no_telp=?,email=?,password=?,status=? where nip=?"
            );
            ps.setString(1, gt.getNama()); 
            ps.setString(2, gt.getNotelp()); 
            ps.setString(3, gt.getEmail());
            ps.setString(4, gt.getPassword());
            ps.setString(5, gt.getStatus());
            ps.setString(6, gt.getNip()); 
            status = ps.executeUpdate();
        } catch (Exception e) { 
            System.out.println(e);
        }
        return status;
    }
    
    public static fdosen getRecordById(String nip) { 
        fdosen u = null;
        try {
            Connection con = koneksi.getKoneksi();
            PreparedStatement ps = con.prepareStatement(
                    "select * from tb_dosen where nip=?"
            );
            ps.setString(1, nip);
            ResultSet rs = ps.executeQuery(); 
            while (rs.next()) {
                u = new fdosen(); 
                u.setNip(rs.getString("nip")); 
                u.setNama(rs.getString("nama")); 
                u.setNotelp(rs.getString("no_telp")); 
                u.setEmail(rs.getString("email")); 
                u.setPassword(rs.getString("password")); 
                u.setStatus(rs.getString("status")); 
            }
        } catch (Exception e) { 
            System.out.println(e);
        } return u;
    }
    
    public static int delete(fdosen u){
        int status = 0; 
        try {
            Connection con = koneksi.getKoneksi();
            PreparedStatement ps = con.prepareStatement(
                    "delete from tb_dosen where nip=?"
            );
            ps.setString(1, u.getNip()); 
            status = ps.executeUpdate();
        } catch (Exception e) { 
            System.out.println(e);
        }
        return status;
    }
}
