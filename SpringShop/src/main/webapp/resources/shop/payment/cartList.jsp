
<%@page import="com.jspshop.domain.Product"%>
<%@page import="com.jspshop.domain.Cart"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이제 카트리스트 뽑아서 화면 반영하기 
	List<Cart> cartList=(List)session.getAttribute("cartList");
	System.out.println("카트리스트 개수 !"+cartList.size());
%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<%@ include file="/inc/header.jsp"%>
</head>

<body>
    <!-- Page Preloder -->
	<%@ include file="/inc/preloder.jsp"%>

    <!-- Header Section Begin -->
    <%@ include file="/inc/header_section.jsp"%>
    <!-- Header Section End -->


    <!-- Shop Cart Section Begin -->
    <section class="shop-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shop__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th>Product</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                            <%Product[] productList=null; %>
	                            <%for(int i=0; i<cartList.size(); i++){%>
	                            <%Cart cart=cartList.get(i);%>
	                            <%Product product=cart.getProduct();%>
						
                                <tr>
                                    <td class="cart__product__item">
                                        <img src="/data/"+<%=product.getPimgList().get(0).getFilename() %> alt="">
                                        <div class="cart__product__item__title">
                                        
                                            <h6><%=product.getProduct_name() %></h6>
                                            <div class="rating">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="cart__price"><%=product.getDiscount() %></td>
                                    <td class="cart__quantity">
                                        <div class="pro-qty">
                                            <input type="text" value="1">
                                        </div>
                                    </td>
                                    <td class="cart__total"><%=product.getPrice() %></td>
                                    <td class="cart__close"><span class="icon_close"></span></td>
                                </tr>
								<%}%>


                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="cart__btn">
                        <a href="#">Continue Shopping</a>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="cart__btn update__btn">
                        <a href="#"><span class="icon_loading"></span> Update cart</a>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6">
                    <div class="discount__content">
                        <h6>Discount codes</h6>
                        <form action="#">
                            <input type="text" placeholder="Enter your coupon code">
                            <button type="submit" class="site-btn">Apply</button>
                        </form>
                    </div>
                </div>
                <div class="col-lg-4 offset-lg-2">
                    <div class="cart__total__procced">
                        <h6>Cart total</h6>
                        <ul>
                            <li>Subtotal <span>$ 750.0</span></li>
                            <li>Total <span>$ 750.0</span></li>
                        </ul>
                        <a href="#" class="primary-btn">Proceed to checkout</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shop Cart Section End -->


	<!-- Instagram Begin -->
	<%@ include file="/inc/insta.jsp" %>
	<!-- Instagram End -->
	
	<!-- Footer Section Begin -->
	<%@ include file="/inc/footer.jsp" %>
	<!-- Footer Section End -->
	
	<!-- Search Begin -->
	<%@ include file="/inc/search.jsp" %>
	<!-- Search End -->
	
	<!-- Js Plugins -->
	<%@ include file="/inc/footer_link.jsp" %>

</body>

</html>