<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head lang="en">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

<title>卒業作品 管理システム</title>
<meta name="description"
	content="BlackTie.co - Free Handsome Bootstrap Themes" />
<meta name="keywords"
	content="themes, bootstrap, free, templates, bootstrap 3, freebie,">
<meta property="og:title" content="">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<link
	href="https://fonts.googleapis.com/css?family=M+PLUS+Rounded+1c:400,500,700&amp;subset=japanese"
	rel="stylesheet" type='text/css'>
<!-- 쪽지 아이콘 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
	background-image: url('resources/images/bg1.jpg');
	background-size: 100%;
	color: white;
}

.dropdown{
	float : right;
}
.link{
	float : right;
}

li {
	color : black;
	
}

</style>

<script src="<c:url value="/resources/js/jquery-1.10.2.min.js"/>"></script>
<script src="<c:url value="/resources/js/jquery-migrate-1.2.1.min.js"/>"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/js/jquery.easing.1.3.js"/>"></script>
<script src="<c:url value="/resources/js/jquery-3.3.1.js"/>"></script>
<script src="<c:url value="/resources/js/html5shiv.js"/>"></script>
<script src="<c:url value="/resources/js/jquery-1.10.2.min.js"/>"></script>

<script>

	$(function(){
		$('#selectFiveMessages').on('click', selectFive);	
		$('#goApplicationForm').on('click', goApplicationForm);	
		//5개 뽑아오기
		 
		 function selectFive() {
				$.ajax({
					method : 'get'
					,url : 'selectFiveMessages'
					,success : outputMsg
					,error : function(resp) {
						console.log(resp);
					}
				});
			}
			
			function outputMsg(resp){

				var content = '<table class="table table-bordered" id="msgTable" width="30%" cellspacing="0">';
				if(resp == "") {
					content += '<tr><td colspan="2">쪽지가 없습니다.</td></tr>';
				}
				if(resp != ""){
					$.each(resp, function(index, item){
						content += '<tr>';
						content += '<td class="fromId">'+item.fromId+'</td>';
						content += '<td class="messageContent">' + '<a href = "#" class = "getMessage">'+item.messageContent+'</a>' + '</td>';
						content += '<td class="messageIndate">' + item.messageIndate + '</td>';
						content += '</tr>';
					});
				}
				
				content += '</table>';
				
				$('.listOfMessage').html(content);
			};
			
			function goApplicationForm(){
				location.href = "/insertApplicationForm";
			};
	});
	
	</script>
</head>

<body>
	<div class="navbar navbar-fixed-top">
		<c:if test="${sessionScope.loginId != null }">
			<!-- 로그인후 -->
		
			<div class = "link">
				<p style="text-align: right; font-size: 20px;">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<a class="nav-link active" href="logoutMember">LOGOUT</a>
				&nbsp;&nbsp;
				<c:if test="${sessionScope.loginDivision == '学生'}">
				&nbsp;&nbsp;
				<a class="nav-link" href="mypage">MYPAGE</a>
				&nbsp;&nbsp;
					&nbsp;&nbsp;
					<a class="nav-link active" href="applicationForm">APPLICATION</a>
					 &nbsp;&nbsp;&nbsp;
			
				</c:if>
				</p>
			</div>
			<c:if test="${sessionScope.loginDivision == '学生'}">
			<div class="dropdown" id = "selectFiveMessages" >
				
				<a class="dropdown-toggle" data-toggle="dropdown"  >
				<img src="https://img.icons8.com/ultraviolet/40/000000/new-post.png" width = "30px" height = "30px" />
				</a>
				
				<ul class="dropdown-menu dropdown-menu-right" role="menu" aria-labelledby="dLabel" id = "menu" >
					<li><div class = "listOfMessage" style="width: 400px;"></div></li>
					<li><div class = "dropdown-divider"></div>
						<a class = "viewAllMessages" href = "viewAllMessages" style="text-align: center;">全てのメッセージを見る</a>
					</li>
				</ul>
				
			</div>
			</c:if>
			
		</c:if>
		<c:if test="${sessionScope.loginId == null }">
			<!-- 로그인전 -->
			<p style="text-align: right; font-size: 20px;">
				<a class="nav-link active" href="loginMember">LOGIN</a>
				&nbsp;&nbsp;&nbsp;&nbsp; <a class="nav-link" href="joinMember">JOIN</a>
				&nbsp;&nbsp;&nbsp;
			</p>
		</c:if>
	</div>
	<!-- /.navbar -->


	<!-- === MAIN Background === -->
	<div class="slide story" id="slide-1" data-slide="1">
		<div class="container">
			<div id="home-row-1" class="row clearfix">
				<div class="col-12">
					<h1 class="font-semibold">
						SC UNIVERSITY <span class="font-thin">卒業作品 管理システム</span>
					</h1>
					<c:if test="${sessionScope.loginId != null }">
						<!-- 로그인후 -->
						<h4 class="font-thin">
							<span style="font-size: 45px;">${sessionScope.loginName }
								様</span>、こんにちは！
						</h4>
					</c:if>
					<c:if test="${sessionScope.loginId == null }">
						<!-- 로그인전 -->
						<h4 class="font-thin">
							皆さんの<span style="font-size: 45px;">円滑な論文作成</span>を手伝います。
						</h4>
					</c:if>
					<br> <br>
				</div>
				<!-- /col-12 -->
			</div>
			<!-- /row -->
			<c:if
				test="${sessionScope.loginId != null && sessionScope.loginDivision == '学生'}">
				<!-- 학생로그인후 -->
				<div id="home-row-2" class="row clearfix">
					<div class="col-12 col-sm-4">
						<div class="home-hover navigation-slide" data-slide="4">
							<img src="resources/images/menu2.svg"
								style="width: 100px; height: 100px;">
						</div>
						<span>論文検索</span>
					</div>
					<div class="col-12 col-sm-4">
						<div class="home-hover navigation-slide" data-slide="4">
							<img src="resources/images/menu3.svg"
								style="width: 100px; height: 100px;">
						</div>
						<span>掲示板<br>(TEAM)
						</span>
					</div>
					<div class="col-12 col-sm-4">
						<div class="home-hover navigation-slide" data-slide="3">
							<img src="resources/images/menu4.svg"
								style="width: 100px; height: 100px;">
						</div>
						<span>掲示板<br>(ANYONE)
						</span>
					</div>
				</div>
			</c:if>

			<c:if test="${sessionScope.loginId == null}">
				<!-- 로그인전 -->
				<div id="home-row-2" class="row clearfix">
					<div class="col-12 col-sm-4">
						<div class="home-hover navigation-slide" data-slide="4">
							<img src="resources/images/menu2.svg"
								style="width: 100px; height: 100px;">
						</div>
						<span>論文検索</span>
					</div>
					<div class="col-12 col-sm-4">
						<div class="home-hover navigation-slide" data-slide="4">
							<img src="resources/images/menu3.svg"
								style="width: 100px; height: 100px;">
						</div>
						<span>掲示板<br>(TEAM)
						</span>
					</div>
					<div class="col-12 col-sm-4">
						<div class="home-hover navigation-slide" data-slide="3">
							<img src="resources/images/menu4.svg"
								style="width: 100px; height: 100px;">
						</div>
						<span>掲示板<br>(ANYONE)
						</span>
					</div>
				</div>
			</c:if>

			<c:if
				test="${sessionScope.loginId != null && sessionScope.loginDivision == '管理者'}">
				<!-- 관리자 로그인후 -->
				<div id="home-row-2" class="row clearfix">
					<div class="col-12 col-sm-4">
						<div class="home-hover navigation-slide" data-slide="4">
							<a href="insertGroupBoard"><img src="resources/images/adminmenu1.svg"
								style="width: 100px; height: 100px;"></a>
						</div>
						<span>論文登録</span>
					</div>
					<div class="col-12 col-sm-4">
						<div class="home-hover navigation-slide" data-slide="4">
							<div id="goApplicationForm"><img src="resources/images/adminmenu2.svg"
								style="width: 100px; height: 100px;"></div>
						</div>
						<span>チーム掲示板生成</span>
					</div>
					<div class="col-12 col-sm-4">
						<div class="home-hover navigation-slide" data-slide="3">
							<img src="resources/images/menu3.svg"
								style="width: 100px; height: 100px;">
						</div>
						<span>論文様式修正</span>
					</div>
				</div>
			</c:if>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /slide1 -->

</body>

</html>