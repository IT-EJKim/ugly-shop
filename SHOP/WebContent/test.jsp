<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>

<div class="container">
  <div class="font-weight-bold mt-3 shadow p-3 mb-4 bg-light rounded">
    상품 상세 페이지
  </div>
</div>
<div>
  <button id="gamja" type="button" class="btn btn-success">감자</button>

  <button id="goguma" type="button" class="btn btn-success">고구마</button>
</div>
<div>
  <button
    onclick="window.open('/SHOP/cartList.jsp')"
    id="cart"
    type="button"
    class="btn btn-success"
  >
    장바구니로 이동
  </button>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="assets/testJs.js"></script>
