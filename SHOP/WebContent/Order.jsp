<%@page import="model.Cart"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    
    <jsp:include page="/includes/headerFar.jsp" />
    <title>못난이농산물 판매사이트</title>
    <style>
      /* .col-md-8 {
        display: flex;
      } */
      /* .pay {
        display: inline-block;
        justify-content: flex-end;
      } */
	  
  /* tbody, td, tfoot, th, thead, tr {
    border-style: none !important;
  } */
	  .bank{
		  width: 80px;
		  height: 40px;
	  }
	  .cardNum{
		  width: 350px;
		  margin: 10px 30px;
	  }
	  .cardPass{
		  width: 100px;
		  margin: 10px 30px;
	  }
    </style>
  </head>
  <body>
    <!-- 로그인 한 경우에 세션에 저장된 유저아이디를 가지고 옴 -->
    <% String userID = null; if(session.getAttribute("userID") != null){ userID = (String)session.getAttribute("userID"); } %>
    <% if (session.getAttribute("cartList") != null) { HashMap<Integer, Cart>
    cartList = (HashMap<Integer, Cart>) session.getAttribute("cartList"); } %>

    <!-- <nav class="navbar navbar-expand-lg navbar-dark" style="background-color: gray">
      <a class="navbar-brand" href="#">Navbar</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item"><a class="nav-link active" aria-current="page" href="<%=request.getContextPath()%>/main.jsp">메인</a></li>
          <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/proListFar.jsp">농산품</a></li>
          <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/reviewController">리뷰</a></li>
        </ul>
        <form class="d-flex mb-2 mb-auto">
          <input class="form-control" type="search" placeholder="Search" aria-label="Search" />
          <button class="btn btn-secondary me-2" type="submit">Search</button>
        </form>
        <% if(userID == null){ %>
        <ul class="navbar-nav mb-2 mb-lg-0">
          <li class="nav-item"><a class="btn btn-primary me-2" href="login/login.jsp" role="button">로그인</a></li>
          <li class="nav-item"><a class="btn btn-success me-2" href="join/join.jsp" role="button">회원가입</a></li>
        </ul>
        <% }else{ %>
        <ul class="navbar-nav mb-2 mb-lg-0">
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 마이 페이지</a>
            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
              <li><a class="dropdown-item" href="<%=request.getContextPath()%>/logout.jsp">로그아웃</a></li>
              <li><a class="dropdown-item" href="#">장바구니</a></li>
              <li><a class="dropdown-item" href="#">주문조회</a></li>
              <li><a class="dropdown-item" href="#">고객정보수정</a></li>
            </ul>
          </li>
        </ul>
        <% } %>
      </div>
    </nav> -->
    <!-- 여기까지가 헤더. 모양만 있는 미완성 헤더이니 나중에 완성된걸로 바꿔주세요. -->
    <div class="row mt-5">
      <div class="col-md-8 mx-auto" >
        <div class="font-weight-bold mt-3 shadow p-3 mb-4 bg-light rounded">
          주문하기
        </div>
        <hr />
        <table class="table table-striped table-hover">
          <thead>
            <tr>
              <th scope="col">상품명</th>
              <!-- <th scope="col">판매자</th> -->
              <th scope="col">수량</th>
              <th scope="col">금액</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="carList" items="${cartList.values()}">
            <c:set var="prodPrice" value="${carList.prodPrice}" />
            <c:set var="orderQuantity" value="${carList.orderQuantity}" />
            <c:set var= "row_sum" value="${row_sum + prodPrice*orderQuantity}"/>
            <tr>
              <td scope="row"><c:out value="${carList.prodName}" /></td>
              <!-- <td>Mark</td> -->
              <td><c:out value="${carList.orderQuantity}" /></td>
              <td><c:out value="${prodPrice*orderQuantity}" /></td>
            </tr>
            </c:forEach>
          </tbody>
          
            

        </table>
        <div><b> 총 결제금액 : <c:out value="${row_sum}" /></b></div>
        <hr />
		<div class="pay">
			<!-- 은행선택 -->
			<select name="bank" id="bank">
				<option value="1">농협</option>
				<option value="1">우리</option>
				<option value="1">국민</option>
				<option value="1">신한</option>
			</select>
			<input class="cardNum" type="text" placeholder="카드번호를 입력해주세요" />
			<input class="cardPass" type="text" placeholder="카드비밀번호" />
		
      <!-- <a class="btn btn-primary mt-auto" data-bs-toggle="modal" data-bs-target="#paymentModal">결제하기</a> -->

      <a class="btn btn-primary mt-auto" href="<%=request.getContextPath()%>/paymentController?cmd=insert&cartID=<c:out value='${cartList.cartID}'/>" class="btn btn-success btn-action mt-3">결제하기</a>



    
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
    <script src="https://cdn.datatables.net/v/bs4/dt-1.10.24/datatables.min.js"></script>
    <script src="assets/payment.js"></script>
    <jsp:include page="/includes/footerFar.jsp" />
  </body>
</html>
