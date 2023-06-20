package com.board.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.board.dao.MemberDAO;
import com.board.domain.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO dao;

	//회원가입
	@Override
	public void register(MemberVO vo) throws Exception{
		dao.register(vo);
	}

	//아이디 확인
	@Override
	public MemberVO idCheck(String userId) throws Exception{
		return dao.idCheck(userId);
	}

	//닉네임 확인
	@Override
	public MemberVO nameCheck(String userName) throws Exception{
		return dao.nameCheck(userName);
	}

	//로그인
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return dao.login(vo);
	}

	//회원 정보 수정
	@Override
	public void modify(MemberVO vo) throws Exception{
		dao.modify(vo);
	}

	//회원 탈퇴
	public void withdrawal(MemberVO vo) throws Exception{
		dao.withdrawal(vo);
	}

}
