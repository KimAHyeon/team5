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
		
	<script src="<c:url value="/resources/vendor/jquery/jquery.min.js" />"></script>
	<script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>
	<script src="<c:url value="/resources/vendor/jquery-easing/jquery.easing.min.js" />"></script>
 	<script src="<c:url value="/resources/vendor/datatables/jquery.dataTables.js" />"></script>
 	<script src="<c:url value="/resources/vendor/datatables/dataTables.bootstrap4.js" />"></script>
	<script src="<c:url value="/resources/js/sb-admin.min.js" />"></script>
 	<script src="resources/js/jquery-3.3.1.js"></script>
	<script>
		$(function(){
			searchApplication();
			$("#memberAgree").on('click', insertGroupBoard);
		});
		
		function searchApplication(){
			$.ajax({
				method : 'GET'
				, url : 'searchApplication'
				, success : function(resp) {
					output(resp);
				}
			});
		};
		
		function output(resp){
			var num = 1;
			var content = '<table class="table table-bordered" id="applicationTable" width="100%" cellspacing="0">';
				  content += '<tr><th>申込番号</th><th>チーム掲示板 申込者</th><th>チームメンバー</th><th>チームメンバー</th><th>チームメンバー</th><th>チームメンバー</th><th>承知</th><th>生成</th></tr>';
			if(resp != ""){
				$.each(resp, function(index, item){
					content += '<tr id="'+ item.applicationSeq +'">';
					content += '<td class="applicationSeq" style="text-align : center;">'+num+'</td>';
					content += '<td class="id">' + item.id + '</td>';
					content += '<td class="member1">' + item.member1 + '</td>';
					
					if (item.member2 == null) {
						content += '<td class="member2" style="text-align : center;">-</td>';
					} else {
						content += '<td class="member2">' + item.member2 + '</td>';
					}
					
					if (item.member3 == null) {
						content += '<td class="member3" style="text-align : center;">-</td>';
					} else {
						content += '<td class="member3">' + item.member3 + '</td>';
					}
					
					if (item.member4 == null) {
						content += '<td class="member4" style="text-align : center;">-</td>';
					} else {
						content += '<td class="member4">' + item.member4 + '</td>';
					}
					if (item.memberCheck == 0) {
						content += '<td class="memberCheck"><a class="btn btn-secondary" id="memberAgree" style="width: 100px; font-weight: bold;">承知</a></td>';						
						content += '<td class="adminCheck"><a class="btn btn-secondary" id="memberAgree" style="width: 100px; font-weight: bold;">生成</a></td>';
					} else {
						content += '<td class="memberCheck"><a class="btn btn-primary id="memberAgree" style="width: 100px; font-weight: bold; color:white;">承知</a></td>';						
						content += '<td class="adminCheck"><button type="button" class="btn btn-primary" id="memberAgree" data-value="'+item.applicationSeq+'" style="width: 100px; font-weight: bold;">生成</button></td>';
					}
					content += '</tr>';
					num++;
				});
			}
			
			content += '</table>';
			
			$('#applicationData').html(content);

		};
		
		function insertGroupBoard(){
			var applicationSeq = attr("data-value");
			
			$.ajax({
				method : 'POST'
				, url : 'insertGroupBoard'
				, success : function(resp) {
					if (resp == null) {
						alert("失敗しました。");
						return;
					} else {
						alert("Board IDは [ "+resp.groupBoardId+" ], Board Passwordは [ "+resp.groupBoardPw+" ]です。");
						$.ajax({
							method : 'POST'
							, url : 'updateApplication'
							, data : {'applicationSeq' : applicationSeq}
							, success : function(resp) {
								if (resp == 0) {
									alert("失敗!");
									return;
								} else {
									searchApplication();
								};
							}
						});
					}
				}
			});
			
		}
	</script>
</head>

<body id="page-top">

  <nav class="navbar navbar-expand navbar-dark bg-dark static-top">
    <a class="navbar-brand mr-1" style="font-size: 25px; color:white;">チーム掲示板 申し込み 現況</a>
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
				チーム掲示板 申し込み</div>
          <div class="card-body">
            <div class="table-responsive" id="applicationData">
            </div>
          </div>
          </div>
          </div>
      </div>    
    <!-- /.content-wrapper -->
  </div>
  <!-- /#wrapper -->

</body>

</html>