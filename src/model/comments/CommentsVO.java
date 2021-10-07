package model.comments;

import java.sql.Date;

public class CommentsVO {
	private int cnum;
	private String cment;
	private Date cdate;
	private String c_user;
	private String cwriter;
	private int replyCnt;
	private int clikeCnt;
	private String cprofileImage;
	
	public int getClikeCnt() {
		return clikeCnt;
	}
	public void setClikeCnt(int clikeCnt) {
		this.clikeCnt = clikeCnt;
	}
	private int c_post;
	public int getCnum() {
		return cnum;
	}
	public void setCnum(int cnum) {
		this.cnum = cnum;
	}
	public String getCment() {
		return cment;
	}
	public void setCment(String cment) {
		this.cment = cment;
	}
	public Date getCdate() {
		return cdate;
	}
	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}
	public String getC_user() {
		return c_user;
	}
	public void setC_user(String c_user) {
		this.c_user = c_user;
	}
	public int getC_post() {
		return c_post;
	}
	public void setC_post(int c_post) {
		this.c_post = c_post;
	}
	public String getCwriter() {
		return cwriter;
	}
	public void setCwriter(String cwriter) {
		this.cwriter = cwriter;
	}
	public int getReplyCnt() {
		return replyCnt;
	}
	public void setReplyCnt(int replyCnt) {
		this.replyCnt = replyCnt;
	}
	public String getCprofileImage() {
		return cprofileImage;
	}
	public void setCprofileImage(String cprofileImage) {
		this.cprofileImage = cprofileImage;
	}
	@Override
	public String toString() {
		return "CommentsVO [cnum=" + cnum + ", cment=" + cment + ", cdate=" + cdate + ", c_user=" + c_user
				+ ", cwriter=" + cwriter + ", replyCnt=" + replyCnt + ", clikeCnt=" + clikeCnt + ", cprofileImage="
				+ cprofileImage + ", c_post=" + c_post + "]";
	}
	
}
