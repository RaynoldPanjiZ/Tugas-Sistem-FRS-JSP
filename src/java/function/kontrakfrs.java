/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package function;
import static java.lang.Math.abs;
import java.sql.*;
import java.util.ArrayList; 
import java.util.List; 
/**
 *
 * @author Raynold Panji
 */
public class kontrakfrs {
    public static List<fkontrakfrs> getAllRecords(){ 
        List<fkontrakfrs> list=new ArrayList<fkontrakfrs>();
        try{
            Connection con=koneksi.getKoneksi();
            PreparedStatement ps=con.prepareStatement("select * from kontrak_mhs"); 
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                fkontrakfrs u=new fkontrakfrs(); 
                u.setKdkontrak(rs.getString("kd_kontrak")); 
                u.setKdjadwal(rs.getString("kd_jadwal")); 
                u.setNim(rs.getString("nim")); 
                u.setApprove(rs.getInt("approve")); 
                u.setNilai(rs.getString("nilai")); 
                list.add(u);
            }
        }catch(Exception e){
            System.out.println(e);
        } return list;
    }
    
    public static int approve(fkontrakfrs u) { 
        int status = 0;
        int appv = abs(1*u.getApprove()-1);
        try {
            Connection con = koneksi.getKoneksi();
            PreparedStatement ps = con.prepareStatement(
                "update kontrak_mhs set approve=? where kd_kontrak=?"
            );
            ps.setInt(1, appv);
            ps.setString(2, u.getKdkontrak()); 
            status = ps.executeUpdate();
            
            System.out.println(u.getKdkontrak()+" "+u.getApprove()+">>"+(1*u.getApprove()-1)+">>"+appv+"<<"+u.getNilai()+"<<<>>>"+status);
        } catch (Exception e) { 
            System.out.println(e);
        }
        return status;
    }
    
    public static int approveall(String select, int appv) { 
        int status = 0;
        appv = abs(1*appv-1);
        
        try {
            Connection con = koneksi.getKoneksi();
            
            if(select.equals("all")){
                PreparedStatement ps = con.prepareStatement(
                    "update kontrak_mhs set approve=? where 1=1"
                );
                ps.setInt(1, appv);
                status = ps.executeUpdate();
            } else {
                PreparedStatement ps = con.prepareStatement(
                    "update kontrak_mhs set approve=? where nim=?"
                );
                ps.setInt(1, appv);
                ps.setString(2, select); 
                status = ps.executeUpdate();
            }
                                    
        } catch (Exception e) { 
            System.out.println(e);
        }
        return status;
    }
    
    public static int saveNilai(fkontrakfrs u) { 
        int status = 0;
        try {
            Connection con = koneksi.getKoneksi();
            PreparedStatement ps = con.prepareStatement(
                "update kontrak_mhs set nilai=? where kd_kontrak=?"
            );
            ps.setString(1, u.getNilai()!=null?u.getNilai().toUpperCase():"");
            ps.setString(2, u.getKdkontrak()); 
            status = ps.executeUpdate();
            
            System.out.println(u.getKdkontrak()+"<<"+u.getNilai()+"<<<>>>"+status);
        } catch (Exception e) { 
            System.out.println(e);
        }
        return status;
    }
    
    public static List<fkontrakfrs> getRecordById(String nim) { 
        List<fkontrakfrs> list=new ArrayList<fkontrakfrs>();
        try {
            Connection con = koneksi.getKoneksi();
            PreparedStatement ps = con.prepareStatement(
                    "select * from kontrak_mhs where nim=?"
            );
            ps.setString(1, nim);
            ResultSet rs = ps.executeQuery(); 
            while (rs.next()) {
                fkontrakfrs u=new fkontrakfrs();  
                u.setKdkontrak(rs.getString("kd_kontrak")); 
                u.setKdjadwal(rs.getString("kd_jadwal")); 
                u.setNim(rs.getString("nim")); 
                u.setApprove(rs.getInt("approve")); 
                u.setNilai(rs.getString("nilai")); 
                list.add(u);
            }
        } catch (Exception e) { 
            System.out.println(e);
        } return list;
    }
    
}
