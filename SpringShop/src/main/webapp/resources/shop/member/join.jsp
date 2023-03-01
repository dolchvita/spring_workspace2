<%@page import="com.jspshop.util.ResponseMessage"%>
<%@page import="com.jspshop.exception.MemberException"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.jspshop.mybatis.MybatisConfig"%>
<%@page import="com.jspshop.repository.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	MemberDAO memberDAO=new MemberDAO();

	MybatisConfig mybatisConfig=MybatisConfig.getInstance();
%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="member"  class="com.jspshop.domain.Member"/>
<jsp:setProperty property="*" name="member"/>
<%
	// 위에서 자동 매핑 되었으므로 바로 쿼리문 실행하자 

	SqlSession sqlSession=mybatisConfig.getSqlSession();
	memberDAO.setSqlSesison(sqlSession);

	try{
		memberDAO.insert(member);
		out.print(ResponseMessage.getMsgURL("등록 성공", "/"));
		sqlSession.commit();
	}catch(MemberException e){
		out.print(ResponseMessage.getMsgBack("등록 실패!"));		
	}finally{
		mybatisConfig.release(sqlSession);
	}
	
%>

