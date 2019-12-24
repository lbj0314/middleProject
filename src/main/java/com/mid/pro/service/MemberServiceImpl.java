package com.mid.pro.service;

import javax.inject.Inject;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mid.pro.dao.MemberDAO;
import com.mid.pro.dao.MemberDAOImpl;
import com.mid.pro.model.MailConfirmVO;
import com.mid.pro.model.MemberVO;
import com.mid.pro.util.MailHandler;
import com.mid.pro.util.TempKey;
import com.mid.pro.model.NoticeVO;
import com.mid.pro.util.FileSaver;
import com.mid.pro.util.Pager;
@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberDAOImpl memberDAOImpl;
	//@Inject
	//private JavaMailSender mailSender;
	@Inject
	private FileSaver fs;
	@Override
	public int memberJoin(MemberVO memberVO) throws Exception {		
		/*
		 * memberDAOImpl.memberJoin(memberVO);
		 * 
		 * String key = new TempKey().getKey(50, false);
		 * 
		 * memberDAOImpl.createAuthKey(memberVO.getEmail(), key);
		 * 
		 * MailHandler sendMail = new MailHandler(mailSender);
		 * sendMail.setSubject("[이메일 인증]"); sendMail.setText( "<h1>메일인증</h1>"+
		 * "<a href = 'http://localhost/pro/member/memberEmailConfirm?userEmail="
		 * +memberVO.getEmail()+ "&key="+key+ "'target='_blenk'>이메일 인증 확인</a>"
		 * 
		 * ); sendMail.setFrom("jin00853@gmail.com", "foodfun");
		 * sendMail.setTo(memberVO.getEmail()); sendMail.send();
		 */
		
		return memberDAOImpl.memberJoin(memberVO);
	}
	
	
	/*
	 * @Override public void userAuth(String userEmail)throws Exception{
	 * memberDAOImpl.userAuth(userEmail); }
	 */
	
	
	
	@Override
	public MemberVO memberCheckId(String id)throws Exception{
		return memberDAOImpl.memberCheckId(id);
	}
	
	@Override
	public MemberVO memberCheckEmail(String email)throws Exception{
		return memberDAOImpl.memberCheckEmail(email);
	}
	
	@Override
	public MemberVO memberSelect(MemberVO memberVO)throws Exception{
		return memberDAOImpl.memberSelect(memberVO);
	}
	
	@Override
	public MemberVO memberLogin(MemberVO memberVO)throws Exception{
		return memberDAOImpl.memberLogin(memberVO);	
	}
	
	@Override
	public int memberUpdate(MemberVO memberVO)throws Exception{
		return memberDAOImpl.memberUpdate(memberVO);
	}
	
	@Override
	public int memberDelete(MemberVO memberVO)throws Exception{
		return memberDAOImpl.memberDelete(memberVO);
	}
	
	@Override
	public java.util.List<MemberVO> List(Pager pager) throws Exception {
		pager.makeRow();
		pager.makePager(memberDAOImpl.Count(pager));
		return memberDAOImpl.List(pager);
	}
	
	@Override
	public int memberUpdate2(MemberVO memberVO)throws Exception{
		return memberDAOImpl.memberUpdate2(memberVO);
	}
	@Override
	public java.util.List<MemberVO> List2(Pager pager) throws Exception {
		pager.makeRow();
		pager.makePager(memberDAOImpl.Count2(pager));
		return memberDAOImpl.List(pager);
	}

}
