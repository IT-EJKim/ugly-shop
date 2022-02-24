<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/includes/headerFar.jsp" />
<h2>review detail 페이지 농민ver</h2>
<br /><br />
<div style="background-color: gray">
  <p>리뷰글번호: <c:out value="${review.reviewID}" /></p>
  <p>제목: <c:out value="${review.reviewTitle}" /></p>
  <p><c:out value="${review.reviewContent}" /></p>
  <p>작성자: <c:out value="${review.userID}" /></p>
  <p>작성일자: <c:out value="${review.reviewDate}" /></p>
  <p>상품번호: <c:out value="${review.prodID}" /></p>
</div>
<hr />
<div style="background-color: bisque">
  <p>덧글번호: <c:out value="${reply.replyID}" /></p>
  <p>판매자: <c:out value="${reply.farmID}" /></p>
  <p><c:out value="${reply.replyContent}" /></p>
  <p>리뷰글번호: <c:out value="${reply.reviewID}" /></p>
  <!-- <a href="<%=request.getContextPath()%>/replyController?cmd=delete&replyID=<c:out value='${reply.replyID}'/>" onclick="if(!confirm('정말로 삭제하시겠습니까?')) return false" class="btn btn-danger btn-sm">덧글 삭제</a> -->
  <button type="button" class="btn btn-danger btn-sm btn-delete" data-id="<c:out value='${reply.replyID}' />" data-toggle="modal" data-target="#modal-delete">덧글삭제</button>
</div>
<br /><br />
<!-- 덧글 삭제확인 모달창 -->
<div class="modal fade" id="modal-delete" tabindex="-1" aria-labelledby="deleteLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">delete</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>정말로 삭제할까요?</p>
      </div>
      <div class="modal-footer">
        <form id="frm-delete">
          <input type="hidden" name="cmd" value="del" />
          <input type="hidden" name="id" value="" />
          <button type="submit" class="btn btn-danger btn-action">삭제</button>
        </form>
        <button type="button" class="btn btn-secondary btn-action" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>
<hr />
<jsp:include page="/includes/footerFar.jsp" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
<script src="assets/reply.js"></script>
