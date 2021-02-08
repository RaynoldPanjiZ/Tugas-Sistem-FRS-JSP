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
public class mhs {
    public static List<fmhs> getAllRecords(){ 
        List<fmhs> list=new ArrayList<fmhs>();
        try{
            Connection con=koneksi.getKoneksi();
            PreparedStatement ps=con.prepareStatement("select * from tb_mhs"); 
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                fmhs u=new fmhs(); 
                u.setNim(rs.getString("nim")); 
                u.setNama(rs.getString("nama")); 
                u.setNotelp(rs.getString("no_telp")); 
                u.setEmail(rs.getString("email")); 
                u.setPassword(rs.getString("password")); 
                u.setKelas(rs.getString("kelas")); 
                list.add(u);
            }
        }catch(Exception e){
            System.out.println(e);
        } return list;
    }
    
    public static int save(fmhs gt) { 
        int status = 0;
        try {
            Connection con = koneksi.getKoneksi();
            PreparedStatement ps = con.prepareStatement(
                    "insert into `tb_mhs` (nim,nama,no_telp,email,password,kelas) values (?,?,?,?,?,?)"
            );
            ps.setString(1, gt.getNim()); 
            ps.setString(2, gt.getNama()); 
            ps.setString(3, gt.getNotelp()); 
            ps.setString(4, gt.getEmail());
            ps.setString(5, gt.getPassword());
            ps.setString(6, gt.getKelas());
            status = ps.executeUpdate();
        } catch (Exception e) { 
            System.out.println(e);
        }
        return status;
    }    
    
    public static int update(fmhs gt) { 
        int status = 0;
        try {
            Connection con = koneksi.getKoneksi();
            PreparedStatement ps = con.prepareStatement(
                "update tb_mhs set nama=?,no_telp=?,email=?,password=?,kelas=? where nim=?"
            );
            ps.setString(1, gt.getNama()); 
            ps.setString(2, gt.getNotelp()); 
            ps.setString(3, gt.getEmail());
            ps.setString(4, gt.getPassword());
            ps.setString(5, gt.getKelas());
            ps.setString(6, gt.getNim()); 
            status = ps.executeUpdate();
        } catch (Exception e) { 
            System.out.println(e);
        }
        return status;
    }
    
    public static fmhs getRecordById(String nim) { 
        fmhs u = null;
        try {
            Connection con = koneksi.getKoneksi();
            PreparedStatement ps = con.prepareStatement(
                    "select * from tb_mhs where nim=?"
            );
            ps.setString(1, nim);
            ResultSet rs = ps.executeQuery(); 
            while (rs.next()) {
                u = new fmhs(); 
                u.setNim(rs.getString("nim")); 
                u.setNama(rs.getString("nama")); 
                u.setNotelp(rs.getString("no_telp")); 
                u.setEmail(rs.getString("email")); 
                u.setPassword(rs.getString("password")); 
                u.setKelas(rs.getString("kelas")); 
            }
        } catch (Exception e) { 
            System.out.println(e);
        } return u;
    }
    
    public static int delete(fmhs u){
        int status = 0; 
        try {
            Connection con = koneksi.getKoneksi();
            PreparedStatement ps = con.prepareStatement(
                    "delete from tb_mhs where nim=?"
            );
            ps.setString(1, u.getNim()); 
            status = ps.executeUpdate();
        } catch (Exception e) { 
            System.out.println(e);
        }
        return status;
    }
}
