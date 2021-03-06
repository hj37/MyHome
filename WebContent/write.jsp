<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardBean"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
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
		
				 
	<style type="text/css">
#container table{
/* 	width: 80%; */
/* 	margin-left: auto; */
/* 	margin-right: auto; */
	table-layout: fixed;
}
#table_search {
	margin: auto;
	width: 50%;
}

#tb td,#tb th{
	padding-top: 1.25em;
	padding-bottom: 1.25em;
}


</style>
		
		
</head>

<%
	//session값 얻기
	//session값 얻는  이유: 글쓰기 화면에 글을 작성하는 사람이름 출력 
	String id = (String)session.getAttribute("id");
	
	//session영역에 저장된 값이 없으면
	if(id == null){
		response.sendRedirect("login.jsp");
	}

%>

<!-- Wrapper -->
			<div class="wrapper style1">
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
									if("".equals(id) || id == null){
							
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
					
							<!-- Banner -->
					<div id="banner" class="container">
						<section>
							<p>롯데 자이언츠 커뮤니티 게시판</p>
						</section>
					</div>

<div class="container">
	<div class="row">
	<form action="writePro.jsp" method="post">
	<table class="table table-hover" id="tb" style="text-align:center; border: 1px solid white;" bgcolor = "white">
	<thead>
				<tr>
					<th colspan="3" style="background-color:#eeeeee; text-align: center;">게시판 글쓰기 양식 </th>
				</tr>
	</thead>
	<tbody>	
	<tr>
			<td>이름</td>
			<td colspan="2"><input type="text" name="name" value="<%=id%>" readonly></td>
	</tr>
	<tr>
			<td>비밀번호</td>
			<td colspan="2"><input type="password" name="passwd"></td>
	</tr>
	<tr>
			<td>제목</td>
			<td colspan="2"><input type="text" name="subject"></td>
	</tr>
	<tr>
			<td>글내용</td>
			<td  colspan="2"><textarea name="content" rows="13" cols="40"></textarea></td>
	</tr>
	
</tbody>
</table>
<div id = "table_search" style="text-align: center">
<input type="submit" value="글쓰기" class="btn">
			<input type="reset" value="다시작성" class="btn">
			<input type="button" value="글목록" class="btn" onclick="location.href='board.jsp'">
</div>
</form>
</div>
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

    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</body>
</html>