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
public class jadwal {
    public static List<fjadwal> getAllRecords(){ 
        List<fjadwal> list=new ArrayList<fjadwal>();
        try{
            Connection con=koneksi.getKoneksi();
            PreparedStatement ps=con.prepareStatement("select * from tb_jadwal"); 
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                function.admin.fjadwal u=new function.admin.fjadwal(); 
                u.setKdjadwal(rs.getString("kd_jadwal")); 
                u.setHari(rs.getString("hari")); 
                u.setJam(rs.getString("jam")); 
                u.setKdmatkul(rs.getString("kd_matkul")); 
                u.setKelas(rs.getString("kelas")); 
                u.setNip(rs.getString("nip")); 
                u.setSemester(rs.getInt("semester")); 
                u.setSks(rs.getInt("sks")); 
                list.add(u);
            }
        }catch(Exception e){
            System.out.println(e);
        } return list;
    }
    
    public static int save(fjadwal gt) { 
        int status = 0;
        try {
            Connection con = koneksi.getKoneksi();
            PreparedStatement ps = con.prepareStatement(
                    "insert into `tb_jadwal` (kd_jadwal,hari,jam,sks,semester,kelas,kd_matkul,nip) values (?,?,?,?,?,?,?,?)"
            );
            ps.setString(1, gt.getKdjadwal()); 
            ps.setString(2, gt.getHari()); 
            ps.setString(3, gt.getJamfrom()+"-"+gt.getJamto()); 
            ps.setInt(4, gt.getSks());
            ps.setInt(5, gt.getSemester());
            ps.setString(6, gt.getKelas());
            ps.setString(7, gt.getKdmatkul());
            ps.setString(8, gt.getNip());
            status = ps.executeUpdate();
        } catch (Exception e) { 
            System.out.println(e);
        }
        return status;
    }    
    
    public static int update(fjadwal gt) { 
        int status = 0;
        try {
            Connection con = koneksi.getKoneksi();
            PreparedStatement ps = con.prepareStatement(
                "update tb_jadwal set hari=?,jam=?,sks=?,semester=?,kelas=?,kd_matkul=?,nip=? where kd_jadwal=?"
            ); 
            ps.setString(1, gt.getHari()); 
            ps.setString(2, gt.getJamfrom()+"-"+gt.getJamto()); 
            ps.setInt(3, gt.getSks());
            ps.setInt(4, gt.getSemester());
            ps.setString(5, gt.getKelas());
            ps.setString(6, gt.getKdmatkul());
            ps.setString(7, gt.getNip());
            ps.setString(8, gt.getKdjadwal());
            status = ps.executeUpdate();
        } catch (Exception e) { 
            System.out.println(e);
        }
        return status;
    }
    
    public static fjadwal getRecordById(String id) { 
        fjadwal u = null;
        try {
            Connection con = koneksi.getKoneksi();
            PreparedStatement ps = con.prepareStatement(
                    "select * from tb_jadwal where kd_jadwal=?"
            );
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery(); 
            while (rs.next()) {
                u = new fjadwal(); 
                u.setKdjadwal(rs.getString("kd_jadwal")); 
                u.setHari(rs.getString("hari")); 
                u.setJam(rs.getString("jam")); 
                u.setKdmatkul(rs.getString("kd_matkul")); 
                u.setKelas(rs.getString("kelas")); 
                u.setNip(rs.getString("nip")); 
                u.setSemester(rs.getInt("semester")); 
                u.setSks(rs.getInt("sks")); 
            }
        } catch (Exception e) { 
            System.out.println(e);
        } return u;
    }
    
    public static int delete(fjadwal u){
        int status = 0; 
        try {
            Connection con = koneksi.getKoneksi();
            PreparedStatement ps = con.prepareStatement(
                    "delete from tb_jadwal where kd_jadwal=?"
            );
            ps.setString(1, u.getKdjadwal()); 
            status = ps.executeUpdate();
        } catch (Exception e) { 
            System.out.println(e);
        }
        return status;
    }
}
