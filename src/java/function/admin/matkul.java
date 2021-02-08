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
public class matkul {
    public static List<fmatkul> getAllRecords(){ 
        List<fmatkul> list=new ArrayList<fmatkul>();
        try{
            Connection con=koneksi.getKoneksi();
            PreparedStatement ps=con.prepareStatement("select * from tb_matkul"); 
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                fmatkul u=new fmatkul(); 
                u.setKdmatkul(rs.getString("kd_matkul")); 
                u.setNamamatkul(rs.getString("nama_matkul")); 
                u.setSyaratmatkul(rs.getString("syarat_matkul")); 
                u.setJenis(rs.getString("jenis")); 
                list.add(u);
            }
        }catch(Exception e){
            System.out.println(e);
        } return list;
    }
    
    public static int save(fmatkul gt) { 
        int status = 0;
        try {
            Connection con = koneksi.getKoneksi();
            PreparedStatement ps = con.prepareStatement(
                    "insert into `tb_matkul` (kd_matkul,nama_matkul,syarat_matkul,jenis) values (?,?,?,?)"
            );
            ps.setString(1, gt.getKdmatkul()); 
            ps.setString(2, gt.getNamamatkul()); 
            ps.setString(3, gt.getSyaratmatkul()); 
            ps.setString(4, gt.getJenis());
            status = ps.executeUpdate();
        } catch (Exception e) { 
            System.out.println(e);
        }
        return status;
    }    
    
    public static int update(fmatkul u) { 
        int status = 0;
        try {
            Connection con = koneksi.getKoneksi();
            PreparedStatement ps = con.prepareStatement(
                "update tb_matkul set nama_matkul=?,syarat_matkul=?,jenis=? where kd_matkul=?"
            );
            ps.setString(1, u.getNamamatkul()); 
            ps.setString(2, u.getSyaratmatkul()); 
            ps.setString(3, u.getJenis());
            ps.setString(4, u.getKdmatkul()); 
            status = ps.executeUpdate();
        } catch (Exception e) { 
            System.out.println(e);
        }
        return status;
    }
    
    public static fmatkul getRecordById(int id) { 
        fmatkul u = null;
        try {
            Connection con = koneksi.getKoneksi();
            PreparedStatement ps = con.prepareStatement(
                    "select * from tb_matkul where kd_matkul=?"
            );
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery(); 
            while (rs.next()) {
                u = new fmatkul(); 
                u.setKdmatkul(rs.getString("kd_matkul")); 
                u.setNamamatkul(rs.getString("nama_matkul")); 
                u.setSyaratmatkul(rs.getString("syarat_matkul")); 
                u.setJenis(rs.getString("jenis")); 
            }
        } catch (Exception e) { 
            System.out.println(e);
        } return u;
    }
    
    public static int delete(fmatkul u){
        int status = 0; 
        try {
            Connection con = koneksi.getKoneksi();
            PreparedStatement ps = con.prepareStatement(
                    "delete from tb_matkul where kd_matkul=?"
            );
            ps.setString(1, u.getKdmatkul()); 
            status = ps.executeUpdate();
        } catch (Exception e) { 
            System.out.println(e);
        }
        return status;
    }
}
