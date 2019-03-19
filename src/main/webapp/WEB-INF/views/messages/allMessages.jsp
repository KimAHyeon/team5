<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>管理者 Page</title>

  <!-- Custom fonts for this template-->
  <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="${pageContext.request.contextPath}/resources/css/sb-admin.css" rel="stylesheet">
	
	<link
		href="https://fonts.googleapis.com/css?family=M+PLUS+Rounded+1c:400,500,700&amp;subset=japanese"
		rel="stylesheet" type='text/css'>
 	<script src="resources/js/jquery-3.3.1.js"></script>
	<script>
		$(function(){
			allMessages();
			
		});
		
		function allMessages(){
			$.ajax({
				method : 'GET'
				, url : 'allMessages'
				, success : function(resp) {
					output(resp);
				}
			});
		};
		
		function output(resp){
			var num = 1;
			var content = '<table class="table table-bordered" id="messageTable" width="100%" cellspacing="0">';
				  content += '<tr><th>削除</th><th>送信者</th><th>内容</th><th>日付</th></tr>';
			if(resp == "") {
				content += '<tr><td colspan="4">쪽지가 없습니다.</td></tr>';
			}
			if(resp != ""){
				$.each(resp, function(index, item){
					content += '<tr><td><input class="delCheck" type = "checkbox" value = "'+item.msg_seq+'"></td>';
					content += '<td class="fromId">'+item.fromId+'</td>';
					content += '<td class="messageContent">' + '<a href = "#" class = "getMessage">'+item.messageContent+'</a>' + '</td>';
					content += '<td class="messageIndate">' + item.messageIndate + '</td>';
					if (item.memberCheck == 0) {
						content += '<td class="memberCheck"><a class="btn btn-secondary" id="memberAgree" style="width: 100px; font-weight: bold;">受諾</a></td>';						
						content += '<td class="adminCheck"><a class="btn btn-secondary" id="memberAgree" style="width: 100px; font-weight: bold;">生成</a></td>';
					} else {
						content += '<td class="memberCheck"><a class="btn btn-primary id="memberAgree" style="width: 100px; font-weight: bold; color:white;">受諾</a></td>';						
						content += '<td class="adminCheck"><button type="button" class="btn btn-primary id="memberAgree" style="width: 100px; font-weight: bold;">生成</button></td>';
					}
					content += '</tr>';
				
					num++;
				});
			}
			
			content += '</table>';
			
			$('#messagesData').html(content);
			$('.deleteMsg').on('click', deleteMsg);

		};
		//메시지 삭제 1
		function deleteMsg() {
			//체크 되었는지 검사 후 데이터를 넘긴다.
			var check_flag = false;
			var test = "";
			$.each($('.delCheck'), function(index,item){
				if($(this).prop("checked")){
					var temp = $(this).val();
					test += temp;
					test += ",";
					check_flag = true;
					return check_flag;
				}
			})
					alert(test);
					deleteMessage(test);
			
			if(!check_flag) {
				alert('한개 이상을 선택해 주세요.');
			}
			
			
		}
		
		function deleteMessage(test) {
			$.ajax({
				method : 'GET'
				,url : 'deleteMsg'
				,data : { "msg_seq" : test }
				,success : function(res) {
					if (res=="success") {
						alert('삭제 성공');//test
						allMessages();
					} else {
						alert('삭제 실패');//test
					}
				}
				,error : function(e) {
					console.log(e);
				}
			
			});
			
			
		}
	</script>
</head>

<body id="page-top">

  <nav class="navbar navbar-expand navbar-dark bg-dark static-top">
    <a class="navbar-brand mr-1" style="font-size: 25px; color:white;">送信メッセージの照会</a>
    <div class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
    	<a href="../" style="font-size: 25px; color:white;">ホーム</a>
    </div>
  </nav>

  <div id="wrapper">
    <div id="content-wrapper">
      <div class="container-fluid">

        <!-- DataTables Example -->
        <div class="card mb-3">
          <div class="card-header" style="font-size: 25px;">
            <i class="fas fa-table"></i>
				送信メッセージの照会</div>
          <div class="card-body">
          	<input type = "button" value = "削除" class = "deleteMsg">
          	<br>
            <div class="table-responsive" id="messagesData">
            </div>
          </div>
          </div>
          </div>
      </div>    
    <!-- /.content-wrapper -->
  </div>
  <!-- /#wrapper -->


	<script src="<c:url value="/resources/vendor/jquery/jquery.min.js"/>"></script>
	<script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>
	<script src="<c:url value="/resources/vendor/jquery-easing/jquery.easing.min.js"/>"></script>
 	<script src="<c:url value="/resources/vendor/datatables/jquery.dataTables.js"/>"></script>
 	<script src="<c:url value="/resources/vendor/datatables/dataTables.bootstrap4.js"/>"></script>
	<script src="<c:url value="/resources/js/sb-admin.min.js"/>"></script>
 	<script src="<c:url value="/resources/js/demo/datatables-demo.js"/>"></script>

</body>

</html>