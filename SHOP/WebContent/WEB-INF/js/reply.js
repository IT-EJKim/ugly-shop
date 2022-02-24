// alert('테스트');

(function (path) {
  $('#replyDelete').click(function (e) {
    // .replyDelete를 클릭했을 때
    e.preventDefault(); // submit이벤트 중지
    e.stopPropagation(); // 이벤트 중지
    $.ajax({
      type: 'POST',
      url: path + '/replyController?cmd=delete',
      data: 'replyID=' + $(this).data('replyID'),
      dataType: 'json',
    })
      .done(function (data) {
        // 성공시
        if (data.status) {
          $('#modal-delete').modal('hide'); // 모달창 닫기
          location.reload(); // 새로고침
        }
      })
      .fail(function (jqXHR, textStatus) {
        // 실패시
        console.log(textStatus); // 콘솔로그 띄우기
      });
  });
})(path);
