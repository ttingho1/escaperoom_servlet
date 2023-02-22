<%@page import="biz.board.BoardDAO"%>
<%@page import="biz.board.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	// 한글처리
	request.setCharacterEncoding("utf-8");
	String name = session.getAttribute("name") == null ? "" : session.getAttribute("name").toString();
%>
	

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>무한대의 즐거움</title>
    <!-- 폰트어썸 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- 웹페이지 타이틀 로고 넣기 (PNG 파일로 해야함.) -->
    
    <!-- 웹페이지 저장시 아이콘 생성 코드 (PNG 파일로 해야함.) -->
    
    <!--부트 스트랩-->
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <!-- 리셋 -->
    <link rel="stylesheet" href="./css/reset.css">
    <!-- 폰트 적용 -->
    <link rel="stylesheet" href="./css/notosans_kr_CDN.css">
    <!-- 페이지 CSS -->
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/header.footer.css">
    <link rel="stylesheet" href="./css/qna_board.css">
    <!-- JS 플러그인 파일 -->
    <script src="./js/jquery-1.12.4.min.js"></script>
    <script src="./js/jquery-3.3.1.min.js"></script>
    <script src="./js/prefixfree.min.js"></script>  <!-- 접두어 자동완성 -->
    <!-- 페이지 JS -->
<%
	if(name=="") {
%>
	<script>
		alert('로그인이 필요한 페이지 입니다.');
		location.href = 'login.jsp';
	</script>
<%
	}
%>
</head>
<body>
	<div class="wrap">
		<header>
			<jsp:include page="/include/header.jsp"/>
		</header>
		<main role="main" class="w1260">
	        <div id="qna">
	            <div class="top_sub cf">
	                <ul>
	                    <li>
	                        <!-- # : main home -->
	                        <a href="#"><img src="./images/home.jpg" alt="home"></a>
	                    </li>
	                    <li>
	                        <img src="./images/v.jpg" alt="v"><strong>문의게시판</strong>
	                    </li>
	                </ul>
	            </div>
	            <div class="top_title cf">
	                <ul>
	                    <li>
	                        <img src="./images/title_bar.jpg" alt="title_bar">
	                    </li>
	                    <li>
	                        <h2>문의게시판</h2>
	                    </li>
	                </ul>
	            </div>
	        </div>
	        <div id="qna_list">
	            <table class="item_board">
	                <tr>
	                    <th width="90">번호</th>
	                    <th width="910">제목</th>
	                    <th width="100">작성자</th>
	                    <th width="90">작성일</th>
	                    <th width="70">조회수</th>
	                </tr>
<%
	BoardDAO bdao = new BoardDAO();
	ArrayList<BoardBean> vbean = bdao.getAllBoardB(1,10);
%>
<%
	for(int i=0;i<vbean.size();i++){
		BoardBean bean = vbean.get(i);
%>
	                <tr class="qna_title">
	                    <th width="90"><%=bean.getNum() %></th>
	                    <th width="910">
	                    	<a href="qna_board_info.jsp?num=<%=bean.getNum()%>">
						<%=bean.getSubject() %></a>
	                    </th>
	                    <th width="100"><%=bean.getWriter() %></th> 
	                    <th width="90"><%=bean.getReg_date() %></th>
	                    <th width="70"><%=bean.getReadcount() %></th>
<%
	}
%>	                
				    </tr>
			          <tr>
	            </table>
			    <div class="addbtn cf">
			       <input type="button" onclick="location.href='qna_board_write.jsp'" value="글쓰기">        
			    </div>
	            <!-- 글번호 -->
	        </div>
		</main>
		<footer>
			<jsp:include page="/include/footer.jsp"/>
		</footer>
	</div>

</body>
<script src="./js/header.footer.js"></script>
</html>