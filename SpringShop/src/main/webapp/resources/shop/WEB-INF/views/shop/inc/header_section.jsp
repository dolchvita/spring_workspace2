<%@page import="com.edu.springshop.domain.Category"%>
<%@page import="java.util.List"%>
<%
	List<Category> categoryList=(List)request.getAttribute("categoryList");
	System.out.println(categoryList);
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <header class="header">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xl-3 col-lg-2">
                    <div class="header__logo">
                        <a href="/"><img src="/resources/shop/img/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-xl-6 col-lg-7">
                    <nav class="header__menu">
                        <ul>
                            <li class="active"><a href="./index.html">Home</a></li>
	                        <%for(int i=0; i<categoryList.size(); i++){ %>
	                        <%Category category=categoryList.get(i); %>
                            <li><a href="#"><%=category.getCategory_name() %></a></li>
                            <%} %>
                            <li><a href="/shop">Shop</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3">
                    <div class="header__right">
                        <div class="header__right__auth">
                        <%//if(session.getAttribute("member")==null){ %>
                            <a href="">Login</a>
                            <a href="">Register</a>  
                                                  
                        <%//}else{ %>
                        
                            <a href="">Logout</a>
                            <a href="#"><%//=member.getId() %></a>                                                
                        <%//} %>
                        </div>
                        <ul class="header__right__widget">
                            <li><span class="icon_search search-switch"></span></li>
                            <li><a href="#"><span class="icon_heart_alt"></span>
                                <div class="tip">2</div>
                            </a></li>
                            <li><a href="/payment/cartList.jsp"><span class="icon_bag_alt"></span>
                                <div class="tip">2</div>
                            </a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="canvas__open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
    </header>