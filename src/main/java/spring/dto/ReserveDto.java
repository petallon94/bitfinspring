package spring.dto;

import java.sql.Date;

public class ReserveDto {
   private int rnum;
   private int rmnum;
   private int rdmnum;
   private String rmemo;
   private String rtime;
   private Date rdate;
   
   public int getRnum() {
      return rnum;
   }
   public void setRnum(int rnum) {
      this.rnum = rnum;
   }
   public int getRmnum() {
      return rmnum;
   }
   public void setRmnum(int rmnum) {
      this.rmnum = rmnum;
   }
   public int getRdmnum() {
      return rdmnum;
   }
   public void setRdmnum(int rdmnum) {
      this.rdmnum = rdmnum;
   }
   public String getRmemo() {
      return rmemo;
   }
   public void setRmemo(String rmemo) {
      this.rmemo = rmemo;
   }
   public String getRtime() {
      return rtime;
   }
   public void setRtime(String rtime) {
      this.rtime = rtime;
   }
   public Date getRdate() {
      return rdate;
   }
   public void setRdate(Date rdate) {
      this.rdate = rdate;
   }
   
   

   
}