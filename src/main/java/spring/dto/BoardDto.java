package spring.dto;

import java.sql.Timestamp;

public class BoardDto {
	
	private int bnum;
	private int bmidnum;
	private String bwriter;
	private String bsubject;
	private String bcontent;
	private Timestamp bwritedate;
	private int breadcount;
	private int readcount;
	private int regroup;
	private int restep;
	private int relevel;
	
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getRegroup() {
		return regroup;
	}
	public void setRegroup(int regroup) {
		this.regroup = regroup;
	}
	public int getRestep() {
		return restep;
	}
	public void setRestep(int restep) {
		this.restep = restep;
	}
	public int getRelevel() {
		return relevel;
	}
	public void setRelevel(int relevel) {
		this.relevel = relevel;
	}
	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	public int getBmidnum() {
		return bmidnum;
	}
	public void setBmidnum(int bmidnum) {
		this.bmidnum = bmidnum;
	}
	public String getBwriter() {
		return bwriter;
	}
	public void setBwriter(String bwriter) {
		this.bwriter = bwriter;
	}
	public String getBsubject() {
		return bsubject;
	}
	public void setBsubject(String bsubject) {
		this.bsubject = bsubject;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public Timestamp getBwritedate() {
		return bwritedate;
	}
	public void setBwritedate(Timestamp bwritedate) {
		this.bwritedate = bwritedate;
	}
	public int getBreadcount() {
		return breadcount;
	}
	public void setBreadcount(int breadcount) {
		this.breadcount = breadcount;
	}
	

}
