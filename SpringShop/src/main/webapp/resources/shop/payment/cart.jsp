<%@page import="com.jspshop.domain.Product"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.jspshop.repository.ProductDAO"%>
<%@page import="com.jspshop.mybatis.MybatisConfig"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.jspshop.domain.Member"%>
<%@page import="com.jspshop.domain.Cart"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	MybatisConfig mybatisConfig=MybatisConfig.getInstance();
	ProductDAO productDAO=new ProductDAO();
%>
<%
	System.out.println("통과");
	String sid=session.getId();
	System.out.println(sid);
	
	List<Cart> cartList=new ArrayList();
	// DTO를 담을 리스트 선언!

	if(session.getAttribute("cartList")==null){
		session.setAttribute("cartList", cartList);		
	}
	
	
	// 이제 정보를 모아보자 !
	// 1누가? 세션에 담긴 로그인된 멤버 꺼내기 
	Member member=(Member)session.getAttribute("member");
	
	
	// 2무엇을?
			// --> 상품의 idx를 넘겨받아 db에서 실제 상품을 조회하자
			// 왜? 장바구니 버튼을 누르면 거기 실제 상품이 넘어오잖아. 그 값을 리스트에 담아놓자고.
	String product_idx=request.getParameter("product_idx");
	SqlSession sqlSession=mybatisConfig.getSqlSession();
	productDAO.setSqlSession(sqlSession);
	Product product=productDAO.select(Integer.parseInt(product_idx));
			
	Cart cart=new Cart();
	cart.setMember(member);
	cart.setProduct(product);
	
	// 몇개나? 
	 cart.setEa(1);	// 디폴트값 1씩 증가 

	cartList.add(cart);
	//System.out.print(cartList.size()+" 개 담김 ");		// 1개만 연속되지 - 왜? - 요청 때마다 새로 생성되니까
			
	// 위에서 설정한 세션의 속성을 가져오자 
	List sessionCartList=(List)session.getAttribute("cartList");

	
	// 이제 카트리스트를 품은 세션 리스트에 cart를 담으면 그대로 누적된다!
	sessionCartList.add(cart);
	
	System.out.print(sessionCartList.size()+" 개 담김 ");

	out.print("장바구니 담김 ");
	
	
%>
