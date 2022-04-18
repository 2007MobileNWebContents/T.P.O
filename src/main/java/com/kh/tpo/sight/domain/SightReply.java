package com.kh.tpo.sight.domain;

import java.sql.Date;

public class SightReply {

	private int commentNo;
	private int reviewNo;
	private String commentTitle;
	private String commentcontent;
	private Date commentEnrollDate;
	private Date commentModiryDate;
	public SightReply() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SightReply(int commentNo, int reviewNo, String commentTitle, String commentcontent, Date commentEnrollDate,
			Date commentModiryDate) {
		super();
		this.commentNo = commentNo;
		this.reviewNo = reviewNo;
		this.commentTitle = commentTitle;
		this.commentcontent = commentcontent;
		this.commentEnrollDate = commentEnrollDate;
		this.commentModiryDate = commentModiryDate;
	}
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public String getCommentTitle() {
		return commentTitle;
	}
	public void setCommentTitle(String commentTitle) {
		this.commentTitle = commentTitle;
	}
	public String getCommentcontent() {
		return commentcontent;
	}
	public void setCommentcontent(String commentcontent) {
		this.commentcontent = commentcontent;
	}
	public Date getCommentEnrollDate() {
		return commentEnrollDate;
	}
	public void setCommentEnrollDate(Date commentEnrollDate) {
		this.commentEnrollDate = commentEnrollDate;
	}
	public Date getCommentModiryDate() {
		return commentModiryDate;
	}
	public void setCommentModiryDate(Date commentModiryDate) {
		this.commentModiryDate = commentModiryDate;
	}
	@Override
	public String toString() {
		return "SightReply [commentNo=" + commentNo + ", reviewNo=" + reviewNo + ", commentTitle=" + commentTitle
				+ ", commentcontent=" + commentcontent + ", commentEnrollDate=" + commentEnrollDate
				+ ", commentModiryDate=" + commentModiryDate + "]";
	}
	
	
	
}
