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
#container {
	width: 80%;
	margin-left: auto;
	margin-right: auto;
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
	/*글 상세보기 페이지 */
	//notice.jsp페이지에서 글제목을 클릭해서 전달하여 넘어온 num,pageNum 한글처리 
	request.setCharacterEncoding("UTF-8");

	//notice.jsp페이지에서 글제목을 클릭해서 전달하여 넘어온 num, pageNum 가져오기
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
	//BoardDAO 객체 생성 bdao
	BoardDAO dao = new BoardDAO();
	
	//조회수 1증가
	dao.updateReadCount(num); 	//메소드 먼저 만들자 
	
	//상세내용을 볼 글에 대한 글번호를 넘겨서 DB로부터 글정보(BoardBean객체) 가져오기
	BoardBean boardBean = dao.getBoard(num);
	
	int DBnum = boardBean.getNum();
	int DBReadcount = boardBean.getReadcount();
	String DBName = boardBean.getName(); //작성자
	Timestamp DBDate = boardBean.getDate();	//작성일
	String DBSubject = boardBean.getSubject(); // 글제목 
	String DBContent = "";	//글내용 
	//글내용이 존재 한다면  // 내용 엔터 처리 
	if(boardBean.getContent() != null){
		DBContent = boardBean.getContent().replace("\r\n","<br/>");
	}
	int DBRe_ref = boardBean.getRe_ref(); //답변 
	int DBRe_lev = boardBean.getRe_lev(); //
	int DBRe_seq = boardBean.getRe_seq(); //

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
					
							<!-- Banner -->
					<div id="banner" class="container">
						<section>
							<p>롯데 자이언츠 커뮤니티 게시판</p>
						</section>
					</div>

<div class="container">
	<div class="row">
	<table class="table table-hover" id="tb" style="text-align:center; border: 1px solid white;" bgcolor = "white">
	<thead>
				<tr>
					<th colspan="3" style="background-color:#eeeeee; text-align: center;">게시판 글보기 양식 </th>
				</tr>
	</thead>
	<tbody>	
	<tr>
		<td style="width:20%;">글제목</td>
		<td colspan="2"><%=DBSubject %></td>
	</tr>
	<tr>
		<td>글번호</td>
		<td colspan="2"><%=DBnum %></td>
	</tr>
	<tr>
		<td>조회수</td>
		<td colspan="2"><%=DBReadcount %></td>
	</tr>
	<tr>
		<td>작성자</td>
		<td colspan="2"><%=DBName %></td>
	</tr>
	<tr>
		<td>작성일</td>
		<td colspan="2"><%=DBDate %></td>
	</tr>
	<tr>
		<td>글내용</td>
		<td colspan="2" style="min-height: 200px; text-align: left"><%=DBContent %></td>
	</tr>
	<%-- <tr>
		<td style="width:20%;">글번호 </td>
		<td colspan="2"><%=DBnum %></td>
		<th scope="col">조회수</th>
		<td><%=DBReadcount %></td>
	</tr>
	<tr>
		<th scope="col">작성일</th>
		<td><%=DBDate %></td>
	</tr> --%>
</tbody>
</table>
</div>
</div>
<div id = "table_search" style="text-align: center">
<%
//각각 페이지에서.. 로그인후 이동해 올때.. 세션 id 전달받기 
String id = (String)session.getAttribute("id");
//세션값이 있으면, 수정, 삭제, 답글쓰기 버튼 보이게 설정
if(id!= null){
%>
<input type="button" value="글수정" class="btn" onclick="location.href='update.jsp?pageNum=<%=pageNum%>&num=<%=DBnum%>'">
<input type="button" value="글삭제" class="btn" onclick="location.href='delete.jsp?pageNum=<%=pageNum%>&num=<%=DBnum%>'">
<input type="button" value="댓글달기" class="btn"
onclick="location.href='reWrite.jsp?num=<%=DBnum%>&re_ref=<%=DBRe_ref%>&re_lev=<%=DBRe_lev%>&re_seq=<%=DBRe_seq%>'">
<% 
}
%>
<input type="button" value="목록보기" class="btn" onclick="location.href='board.jsp?pageNum=<%=pageNum%>'">
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