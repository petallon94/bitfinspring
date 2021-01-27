package spring.chat.dao;

public class ChatDto {
	private String chusername;
	private String chdocname;
	private String chcontent;
	private String chtime;
	
	public String getChusername() {
		return chusername;
	}
	public void setChusername(String chusername) {
		this.chusername = chusername;
	}
	public String getChdoctorname() {
		return chdocname;
	}
	public void setChdoctorname(String chdoctorname) {
		this.chdocname = chdoctorname;
	}
	public String getChcontent() {
		return chcontent;
	}
	public void setChcontent(String chcontent) {
		this.chcontent = chcontent;
	}
	public String getChtime() {
		return chtime;
	}
	public void setChtime(String chtime) {
		this.chtime = chtime;
	}
}
