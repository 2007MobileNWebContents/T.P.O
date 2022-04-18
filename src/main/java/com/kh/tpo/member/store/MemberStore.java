package com.kh.tpo.member.store;

import java.util.ArrayList;

import com.kh.tpo.member.domain.Member;
import com.kh.tpo.member.domain.ReservationInfo;

public interface MemberStore {

	/*
	 * 	로그인
	 *  
	 *  @Param Member
	 *  @Return Member
	 * */
	public Member selectOne(Member member);
	/*
	 * 	회원가입
	 *  
	 *  @Param Member
	 *  @Return Member
	 * */
	public int insertMember(Member member);
	/*
	 *  아이디 중복검사
	 *  
	 *  @Param String 
	 *  @Return int
	 * */
	public int idDuplicateChk(String userId);
	/*
	 * 	회원정보 수정
	 *  
	 *  @Param Member
	 *  @Return int
	 * */
	public int updateMember(Member member);
	/*
	 * 	회원탈퇴
	 *  
	 *  @Param Member
	 *  @Return int
	 * */
	public int deleteMember(Member member);
	/*
	 * 	회원 항공 예약 정보
	 *  
	 *  @Param Member
	 *  @Return ReservationInfo
	 * */
	public ArrayList<ReservationInfo> reservationInfo(String userId);
	/*
	 * 	회원 아이디 찾기
	 *  
	 *  @Param Member
	 *  @Return String
	 * */
	public Member searchId(Member member);
	/*
	 * 	회원 비밀번호 찾기
	 *  
	 *  @Param Member
	 *  @Return Member
	 * */
	public Member searchPwd(Member member);
	/*
	 * 	회원 이메일 인증여부
	 *  
	 *  @Param Member
	 *  @Return int
	 * */
	public int emailChk(Member member);
	/*
	 * 	회원 항공 예약 취소
	 *  
	 *  @Param int
	 *  @Return int
	 * */
	public int reservationCancel(int riNo);
	/*
	 * 	회원 핸드폰 번호
	 *  
	 *  @Param String
	 *  @Return int
	 * */
	public int phoneChk(String phone);
}
