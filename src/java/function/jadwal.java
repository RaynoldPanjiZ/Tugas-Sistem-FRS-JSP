/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package function;
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
                fjadwal u=new fjadwal(); 
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
    
    public static String[] getSelectedfrs(String nim) { 
        String[] u = new String[100];
//            int o = 0;
        try {
            Connection con = koneksi.getKoneksi();
            PreparedStatement ps = con.prepareStatement(
                    "select * from kontrak_mhs where nim=?"
            );
            ps.setString(1, nim);
            ResultSet rs = ps.executeQuery();
            
            for(int i=0; rs.next(); i++){
                u[i] = rs.getString("kd_jadwal");
                System.out.println(i+">>"+u[i]);
            }
        } catch (Exception e) { 
            System.out.println(e+" "+u[0]);
        } return u;
    }
    
    public static int getAllKontrakfrs(Connection con) { 
        int id = 1;
        try {
            PreparedStatement ps = con.prepareStatement(
                    "select * from kontrak_mhs"
            );
            ResultSet rs = ps.executeQuery(); 
            if(rs.last()){
                id=rs.getInt("kd_kontrak")+1;
            } 
        } catch (Exception e) { 
            System.out.println(e);
        } return id;
    }
    
    public static int savefrs(fjadwal u) { 
        int status = 0;
        try {
            Connection con = koneksi.getKoneksi();
            delete(con, u);
            if(u.getFrsjadwal()!=null){
                PreparedStatement psinsert = con.prepareStatement(
                    "INSERT INTO kontrak_mhs (kd_kontrak, kd_jadwal, nim) values(?,?,?);"
                );
                for (int i=0; i<u.getFrsjadwal().length; i++) {
                    psinsert.setInt(1, getAllKontrakfrs(con)+i);
                    psinsert.setString(2, u.getFrsjadwal()[i]);
                    psinsert.setString(3, u.getNim());
                    psinsert.addBatch();
                }
                psinsert.executeBatch();                
                
            }
//            status = ps.executeUpdate();
        } catch (Exception e) { 
            System.out.println(e);
        }
        return status;
    }
    
    public static void delete(Connection con, fjadwal u){
        try {         
            PreparedStatement ps = con.prepareStatement("DELETE FROM kontrak_mhs where nim=?");
            ps.setString(1, u.getNim());
            ps.executeUpdate();
        } catch (Exception e) { 
            System.out.println(e);
        }
    }
}
