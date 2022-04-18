package com.kh.tpo.member.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.tpo.member.domain.Member;
import com.kh.tpo.member.domain.ReservationInfo;
import com.kh.tpo.member.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private JavaMailSender mailSender;

	// 로그인 페이지이동
	@RequestMapping(value="loginView.tpo", method=RequestMethod.GET)
	public String  MemberLoginView() {
		return "member/memberLoginView";
	}
	
	// 로그인
	@RequestMapping(value="login.tpo", method=RequestMethod.POST)
	public String MemberLogin(HttpServletRequest request, Model model,Member member,HttpServletResponse response) throws Exception{
		HttpSession session  = request.getSession();
		Member loginUser = mService.memberLogin(member);
		if(loginUser!=null) {
		session.setAttribute("loginUser", loginUser);
		return "redirect:mainPage.tpo";
		}
		else {
		PrintWriter out  = response.getWriter();
		response.setContentType("text/html; charset=UTF-8");
//		location.href='loginView.tpo';
		out.print("<script>alert('등록된 회원정보가 없습니다.'); location.href='loginView.tpo';</script>");
		out.flush();
		out.close();
		return "member/memberLoginView";
		}
	}
	
	// 로그아웃
	@RequestMapping(value="logout.tpo", method=RequestMethod.GET)
	public String MemberLogout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session!=null) {
			session.invalidate();
			return "redirect:mainPage.tpo";
		}else {
			return "common/errrorPage";
		}
	}
	
	// 회원가입 화면 이동
	@RequestMapping(value="memberJoinForm.tpo", method=RequestMethod.GET)
	public String MemberJoinForm() {
		return "member/memberJoinForm";
	}
	
	// ID 중복체크 확인
	@ResponseBody
	@RequestMapping(value="dupId.tpo", method=RequestMethod.GET)
	public String idDuplicateChk(String userId) {
		boolean result  = mService.idDuplicateChk(userId) == 0 ? true : false;
		return result+"";
	}
	
	// 회원가입 insert
	@RequestMapping(value="memberJoin.tpo", method=RequestMethod.POST)
	public String MemberJoin(Member member, String post,String roadAddress,String detailAddress, String extraAddress) {
		member.setAddress(post+","+roadAddress+","+detailAddress+","+extraAddress);
		int result = mService.registerMember(member);
		if(result>0) {
			return "member/memberLoginView";
		}else {
		return "common/errorPage";
		}
	}
	
	// 아이디찾기(화면불러오기)
	@RequestMapping(value="memberIdFindForm.tpo", method=RequestMethod.GET)
	public String MemberIdFindForm() {
		return "member/memberIdFind";
	}
	// 아이디찾기(값 가져오기)
	@ResponseBody
	@RequestMapping(value="memberIdFind.tpo", method=RequestMethod.GET)
	public String MemberIdFind(Member member, Model model) {
		 Member mem = mService.findId(member);
		 String userId ="";
		 if(mem!=null) {
			 userId = mem.getUserId();
			 System.out.println(userId);
			 return userId;
		 }else {
			 return userId;
		 }
	}
	// 비밀번호 찾기(화면불러오기)
	@RequestMapping(value="memberPwdFindForm.tpo", method=RequestMethod.GET)
	public String MemberPwdFindForm() {
		return "member/memberPwdFind";
	}
	
	// 등록된 회원정보의 이름과 이메일 일치 여부 및 메일보내기
	@ResponseBody
	@RequestMapping(value="emailCheck.tpo", method=RequestMethod.GET)
	public void emailCheck(Member member,HttpServletResponse response) throws Exception{
		// 이메일 일치여부
		boolean emailCheck = mService.emailChk(member)==1? true : false;
		// emailCheck값과 난수값을 받아서 넘겨야 됨
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(emailCheck==true) { // 등록된 이메일정보와 일치하는 경우만 메일 발송
			// 보내는 사람
			String setfrom = "emailkst7238@gmail.com";
			// 받는 사람 이메일
			String tomail = member.getEmail();
			System.out.println(tomail);
			// 제목
			String title = "TPO사이트 비밀번호 찾기(인증번호)";
			// 인증번호 난수로 생성
			int randomNumber = (int)(Math.random()*1000) +1;
			// 내용
			String content = "임시비밀번호 : " + randomNumber;
			// mailSending작성
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				// 보내는 사람 생략하면 오류뜸
				messageHelper.setFrom(setfrom);
				// 받는 사람 이메일저장
				messageHelper.setTo(tomail);
				// 메일제목 저장 (생략 가능)
				messageHelper.setSubject(title);
				// 메일내용
				messageHelper.setText(content);
				// 메일 보내기~
				mailSender.send(message);
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			map.put("emailCheck", emailCheck+"");
			map.put("randomNumber", randomNumber);
		}
		Gson gson = new Gson();
		gson.toJson(map,response.getWriter());
	}
	
	// 회원비밀번호 불러오기
	@ResponseBody
	@RequestMapping(value="resultPwd.tpo", method=RequestMethod.POST)
	public String resultPwd(Member member) {
		Member mem = mService.findPwd(member);
		if(mem!=null) {
		return mem.getUserPwd();
		}else {
		return "";
		}
	}
	
	// 마이페이지(화면이동)
	@RequestMapping(value="myPageView.tpo", method=RequestMethod.GET)
	public String myPageView() {
		return "member/myPageView";
	}
	
	// 마이페이지(회원정보수정)
	@RequestMapping(value="modifyMember.tpo", method=RequestMethod.POST)
	public String modifyMember(HttpServletRequest request, 
										 Member member,
										 String post,
										 String roadAddress,
										 String detailAddress,
										 String extraAddress) {
		HttpSession session = request.getSession();
		/* session.invalidate(); */
		member.setAddress(post+","+roadAddress+","+detailAddress+","+extraAddress);
		int result = mService.modifyMember(member);
		if(result>0) {
			session.setAttribute("loginUser", member);
			return "member/myPageView";
		}else {
			return "common/errorPage";
		}
	}
	
	// 회원탈퇴 페이지(화면이동)
	@RequestMapping(value="deleteMemberView.tpo", method=RequestMethod.GET)
	public String deleteMemberView() {
		return "member/memberDelete";
	}
	
	// 회원탈퇴(update)
	@RequestMapping(value="deleteMember.tpo", method=RequestMethod.POST)
	public String deleteMember(HttpServletRequest request, Member member) {
			HttpSession session = request.getSession();
			int result = mService.deleteMember(member);
			if(result>0) {
				session.invalidate();
				return "redirect:mainPage.tpo";
			}else {
			    return "common/errorPage";
			}
	}
	
	// 항공예약정보조회
	@RequestMapping(value="reservationInfo.tpo", method=RequestMethod.GET)
	public String reservationInfoView(Model model, HttpServletRequest request) {
		ArrayList<ReservationInfo> rList = new ArrayList<ReservationInfo>();
		HttpSession session = request.getSession();
		String userId = (String)((Member)session.getAttribute("loginUser")).getUserId();
		rList = mService.reservationInfo(userId);
		model.addAttribute("rList", rList);
		return "member/reservationInfo";
	}
	// 항공예약 취소
	@RequestMapping(value="reservationCancel.tpo", method=RequestMethod.GET)
	public String reservationCancel(HttpServletRequest request) {
			int riNo = Integer.parseInt(request.getParameter("riNo"));
			int result  = mService.reservationCancel(riNo);
			if(result>0) {
				return "redirect:myPageView.tpo";
			}else {
				return"common/errorPage";
			}
	}
	// 핸드폰번호 유효성 체크
	@ResponseBody
	@RequestMapping(value="dupPhone.tpo", method=RequestMethod.GET)
	public String phoneChk(String phone,HttpServletResponse response) throws Exception{
		boolean phoneCheck = mService.phoneChk(phone)==0? true : false;
			return phoneCheck+"";
	}
}
