<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/includes/headerFar.jsp" />
<h2>상품 리스트 페이지 농민ver</h2>
<div class="container">
  <div class="row row-cols-3">
    <div class="col card" style="width: 18rem">
      <a id="prod" href="<%= request.getContextPath() %>/proDetailFar.jsp">
        <img src="https://images.unsplash.com/photo-1610099169256-c44f0ae44b4a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80" class="card-img-top" alt="..." />
        <div class="card-body">
          <p class="card-text">1. Some quick example text to build on the card title and make up the bulk of the card's content.</p>
        </div>
      </a>
    </div>
    <div class="col card" style="width: 18rem">
      <a id="prod" href="<%= request.getContextPath() %>/proDetailFar.jsp">
        <img src="https://images.unsplash.com/photo-1610099169256-c44f0ae44b4a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80" class="card-img-top" alt="..." />
        <div class="card-body">
          <p class="card-text">2. Some quick example text to build on the card title and make up the bulk of the card's content.</p>
        </div>
      </a>
    </div>
    <div class="col card" style="width: 18rem">
      <a id="prod" href="<%= request.getContextPath() %>/proDetailFar.jsp">
        <img src="https://images.unsplash.com/photo-1610099169256-c44f0ae44b4a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80" class="card-img-top" alt="..." />
        <div class="card-body">
          <p class="card-text">3. Some quick example text to build on the card title and make up the bulk of the card's content.</p>
        </div>
      </a>
    </div>

    <div class="col card" style="width: 18rem">
      <a id="prod" href="<%= request.getContextPath() %>/proDetailFar.jsp">
        <img src="https://images.unsplash.com/photo-1610099169256-c44f0ae44b4a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80" class="card-img-top" alt="..." />
        <div class="card-body">
          <p class="card-text">4. Some quick example text to build on the card title and make up the bulk of the card's content.</p>
        </div>
      </a>
    </div>
    <div class="col card" style="width: 18rem">
      <a id="prod" href="<%= request.getContextPath() %>/proDetailFar.jsp">
        <img src="https://images.unsplash.com/photo-1610099169256-c44f0ae44b4a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80" class="card-img-top" alt="..." />
        <div class="card-body">
          <p class="card-text">5. Some quick example text to build on the card title and make up the bulk of the card's content.</p>
        </div>
      </a>
    </div>
    <div class="col card" style="width: 18rem">
      <a id="prod" href="<%= request.getContextPath() %>/proDetailFar.jsp">
        <img src="https://images.unsplash.com/photo-1610099169256-c44f0ae44b4a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80" class="card-img-top" alt="..." />
        <div class="card-body">
          <p class="card-text">6. Some quick example text to build on the card title and make up the bulk of the card's content.</p>
        </div>
      </a>
    </div>
  </div>
</div>
<style>
  .container {
    margin-top: 100px;
  }
  .card {
    /* margin-right: 30px; */
    margin-bottom: 30px;
  }
</style>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
<jsp:include page="/includes/footerFar.jsp" />
