<%@page import="com.jspshop.util.ResponseMessage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate();
	out.print(ResponseMessage.getMsgURL("로그아웃되었습니다 ", "/"));
%>