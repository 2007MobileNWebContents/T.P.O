package com.kh.tpo.sight.domain;

import java.sql.Date;

public class SightReview {

	private int reviewNo;
	private int sNo;
	private String userId;
	private String reviewTitle;
	private String reviewContent;
	private int reviewScore;
	private String reviewPicture;
	private Date reviewEnrollDate;
	private Date reivewModifyDate;
	public SightReview() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SightReview(int reviewNo, int sNo, String userId, String reviewTitle, String reviewContent, int reviewScore,
			String reviewPicture, Date reviewEnrollDate, Date reivewModifyDate) {
		super();
		this.reviewNo = reviewNo;
		this.sNo = sNo;
		this.userId = userId;
		this.reviewTitle = reviewTitle;
		this.reviewContent = reviewContent;
		this.reviewScore = reviewScore;
		this.reviewPicture = reviewPicture;
		this.reviewEnrollDate = reviewEnrollDate;
		this.reivewModifyDate = reivewModifyDate;
	}
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public int getsNo() {
		return sNo;
	}
	public void setsNo(int sNo) {
		this.sNo = sNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getReviewTitle() {
		return reviewTitle;
	}
	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public int getReviewScore() {
		return reviewScore;
	}
	public void setReviewScore(int reviewScore) {
		this.reviewScore = reviewScore;
	}
	public String getReviewPicture() {
		return reviewPicture;
	}
	public void setReviewPicture(String reviewPicture) {
		this.reviewPicture = reviewPicture;
	}
	public Date getReviewEnrollDate() {
		return reviewEnrollDate;
	}
	public void setReviewEnrollDate(Date reviewEnrollDate) {
		this.reviewEnrollDate = reviewEnrollDate;
	}
	public Date getReivewModifyDate() {
		return reivewModifyDate;
	}
	public void setReivewModifyDate(Date reivewModifyDate) {
		this.reivewModifyDate = reivewModifyDate;
	}
	@Override
	public String toString() {
		return "SightReview [reviewNo=" + reviewNo + ", sNo=" + sNo + ", userId=" + userId + ", reviewTitle="
				+ reviewTitle + ", reviewContent=" + reviewContent + ", reviewScore=" + reviewScore + ", reviewPicture="
				+ reviewPicture + ", reviewEnrollDate=" + reviewEnrollDate + ", reivewModifyDate=" + reivewModifyDate
				+ "]";
	}
}
