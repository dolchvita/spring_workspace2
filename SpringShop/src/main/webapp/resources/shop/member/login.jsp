<%@page import="com.jspshop.util.ResponseMessage"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.jspshop.exception.MemberException"%>
<%@page import="com.jspshop.domain.Member"%>
<%@page import="com.jspshop.repository.MemberDAO"%>
<%@page import="com.jspshop.mybatis.MybatisConfig"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	MybatisConfig mybatisConfig=MybatisConfig.getInstance();
	MemberDAO memberDAO=new MemberDAO();
	ResponseMessage responseMessage=new ResponseMessage();
%>
<%
	request.setCharacterEncoding("utf-8");
	
	String id=request.getParameter("id");
	String pass=request.getParameter("pass");

	
/* 	Member member=new Member();
	member.setId(id);
	member.setPass(pass); */

	

	//System.out.println(member.getId());
	//System.out.println(member.getPass());
	
	SqlSession sqlSession=mybatisConfig.getSqlSession();
	memberDAO.setSqlSesison(sqlSession);
	
	try{	
		Member dto=memberDAO.select(id);
		session.setAttribute("member", dto);		// 회원 1명 담기
		
		out.print(responseMessage.getMsgURL("로그인 성공", "/"));
		
	}catch(MemberException e){
		out.print(responseMessage.getMsgBack("로그인 실패"));
		
	}finally{
		mybatisConfig.release(sqlSession);
	}
	

	
%>