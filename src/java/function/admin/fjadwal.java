/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package function.admin;

/**
 *
 * @author Raynold Panji
 */
public class fjadwal {
    private int semester, sks;
    private String hari, jamfrom, jamto, jam, kdjadwal, kdmatkul, kelas, nip;
    private String[] frsjadwal;
    
    public String[] getFrsjadwal() { 
        return frsjadwal;
    }
    public void setFrsjadwal(String[] frsjadwal) { 
        this.frsjadwal = frsjadwal;
    }
    
    public String getKdjadwal() { 
        return kdjadwal;
    }
    public void setKdjadwal(String kdjadwal) { 
        this.kdjadwal = kdjadwal;
    }
    
    public String getHari() { 
        return hari;
    }
    public void setHari(String hari) { 
        this.hari = hari;
    }
    
    public String getJam() { 
        return jam;
    }
    public void setJam(String jam) {
        this.jam = jam;
    }
    public String getJamfrom() { 
        return jamfrom;
    }
    public void setJamfrom(String jamfrom) {
        this.jamfrom = jamfrom;
    }
    public String getJamto() { 
        return jamto;
    }
    public void setJamto(String jamto) {
        this.jamto = jamto;
    }
    
    public int getSemester() { 
        return semester;
    }
    public void setSemester(int semester) { 
        this.semester = semester;
    }
    public int getSks() { 
        return sks;
    }
    public void setSks(int sks) { 
        this.sks = sks;
    }
    public String getKelas() { 
        return kelas;
    }
    public void setKelas(String kelas) { 
        this.kelas = kelas;
    }
    public String getKdmatkul() { 
        return kdmatkul;
    }
    public void setKdmatkul(String kdmatkul) { 
        this.kdmatkul = kdmatkul;
    }
    public String getNip() { 
        return nip;
    }
    public void setNip(String nip) { 
        this.nip = nip;
    }
}
