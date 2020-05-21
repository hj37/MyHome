<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
<!--     <meta name="viewport" content="width=device-width, initial-scale=1"> -->
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>로그인 화면</title>

    <!-- 부트스트랩 -->
<!--     <link href="css/bootstrap.min.css" rel="stylesheet"> -->

    <!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
    <!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
 
  		<script src="js/jquery.min.js"></script>
		<script src="js/jquery.dropotron.min.js"></script>
		<script src="js/skel.min.js"></script>
		<script src="js/skel-layers.min.js"></script>
		<script src="js/init.js"></script>
			<link rel="stylesheet" href="css/skel.css" />
			<link rel="stylesheet" href="css/style.css" />
			<link rel="stylesheet" href="css/style-wide.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
		
		
		
		<script type="text/javascript">
 	function winopen(){//아래의 아이디중복체크 버튼 눌렀을때 호출되는 함수 
 		//1. 아이디를 입력했는지 검사
 		//아이디를 입력하지 않았다면
 		if(document.f.id.value == ""){
 			alert("아이디를 입력하세요.");
 			//아이디 입력 <input>태그에 포커스깜빡
 			document.f.id.focus();
 			return;
 		}
 		//아이디를 입력 했다면
 		//입력한 아이디를 얻는다.
 		var fid = document.f.id.value;
 		
 		//새 창을 join_IDCheck.jsp로 띄우며 전달값으로 바로위에 입력한 아이디를 전달함
 		// 새 창의 width와 height를 크기를 지정
 		window.open("join_IDCheck.jsp?userid="+fid, "","width=400,height=200");
 		
 	
 	}
 
 
 </script>
 
	</head>
	<body>

		<!-- Wrapper -->

				<!-- Header -->
					<div id="header" class="skel-panels-fixed">
						<div id="logo">
							<h1><a href="index.jsp">Giants</a></h1>
							<span class="tag">커뮤니티 게시판</span>
						</div>
						<nav id="nav">
							<ul>
								<li class="active"><a href="index.jsp">Homepage</a></li>
								<li><a href="left-sidebar.html">Left Sidebar</a></li>
								<li><a href="right-sidebar.html">Right Sidebar</a></li>
								<li><a href="board.jsp">커뮤니티 게시판</a></li>
								<%
									if("".equals(session.getAttribute("id")) || session.getAttribute("id") == null){
							
								%>
								<li><a href="login.jsp">Login</a></li>
								<%
									}else{
										%>
								<li><a href="logout.jsp">Logout</a></li>
										<% 
									}
								%>								<li><a href="mypage.jsp">Mypage</a></li>
								
							</ul>
						</nav>
					</div>
				


 
    
    
    	<!-- Footer -->
		<div id="footer" class="wrapper style2">
			<div class="container">
				<section>
					<header class="major">
						<h2>Mauris vulputate dolor</h2>
						<span class="byline">Integer sit amet pede vel arcu aliquet pretium</span>
					</header>
					<form method="post" action="joinPro.jsp" id="join" method="post" name="f">
						<div class="row half">
							<div class="12u">
								<label>User ID</label>
								<input class="id" type="text" name="id"  placeholder="ID"/>	<br>
								<input type="button" value="ID_CHECK" class="button alt" onclick="winopen()"><br>			
							</div>
							
							
						</div>
						<div class="row half">
							<div class="12u">
								<label>Password</label>
								<input type="password" name="passwd"  placeholder="Password" />
							</div>
						</div>
						<div class="row half">
							<div class="12u">
							<label>Retype Password</label>
								<input type="password" name="passwd2" placeholder="Retype Password" />
							</div>
						</div> 
						
						<div class="row half">
							<div class="12u">
								<label>Name</label>
								<input type="text" name="name" placeholder="Name" />
							</div>
						</div>
						
						<div class="row half">
							<div class="12u">
								<label>E-Mail</label>
								<input type="email" name="email"  placeholder="Email" />
							</div>
						</div>
						
						<div class="row half">
							<div class="12u">
								<label>Address</label>
								<input type="text" name="address" placeholder="Address">
							</div>
						</div>
						
						
						<div class="row half">
							<div class="12u">
								<ul class="actions">
									<li>
										<input type="submit" value="Register" class="button alt" />
										<input type="reset" value="Reset" class="button alt" />
										
									</li>
								</ul>
							</div>
						</div>
					</form>
				</section>
			</div>
		</div>
    
    	<!-- Copyright -->
		<div id="copyright">
			<div class="container">
				<div class="copyright">
					<p>Design: <a href="http://templated.co">TEMPLATED</a> Images: <a href="http://unsplash.com">Unsplash</a> (<a href="http://unsplash.com/cc0">CC0</a>)</p>
					<ul class="icons">
						<li><a href="#" class="fa fa-facebook"><span>Facebook</span></a></li>
						<li><a href="#" class="fa fa-twitter"><span>Twitter</span></a></li>
						<li><a href="#" class="fa fa-google-plus"><span>Google+</span></a></li>
					</ul>
				</div>
			</div>
		</div>
    
    
  </body>
</html>