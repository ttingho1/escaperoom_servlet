<%@page import="biz.board.BoardBean"%>
<%@page import="biz.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	// 한글처리
	request.setCharacterEncoding("utf-8");
	int num = Integer.parseInt(request.getParameter("num"));
	// 세션받아오기
	String id = (String)session.getAttribute("id");
	String name = (String)session.getAttribute("name");
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
    <script>
    	function confirmDelete(){
    		const frm = document.getElementById('frm');
    		if(!confirm("삭제하시겠습니까?")){
    			return false;
    		}
    		frm.action = "qna_boardDeleteProc.jsp";
    		frm.submit();
    	}
    </script>
</head>

<body>
<%
	// 로직 처리를 위한 객체접근
	BoardDAO bdao = new BoardDAO();
	// 로직처리 메서드 호출
	BoardBean bean = bdao.getOneBoard(num);
%>
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
        <div id="qna_write">
            <!-- action : 글 수정 -->
            <form id="frm" method="post">
            <input type="hidden" name="num" value="<%=bean.getNum() %>"/>
                <table class="item_board">
                    <tr>
                        <th>제목</th>
                        <td>
                            <%=bean.getSubject() %>
                        </td>
                    </tr>
                    <tr>
                        <th>작성자</th>
                        <td>
                            ${sessionScope.name}
                        </td>
                    </tr>
                    <tr>
                        <td height="440" colspan="2"><%=bean.getContent() %></td>
                    </tr>
                    
                </table>
                <div class="update_btn cf">
                	<div class="update_btn_left">
                    	<input type="button" onclick="location.href='qna_board_list.jsp'" value="목록">
                    </div>
                    <div class="update_btn_right">
                    <% if(id.equals(bean.getId())){%>
	                    <input type="button" onclick="location.href='qna_board_update.jsp?num=<%=bean.getNum() %>'" value="수정">
	                    <input type="button" onclick="confirmDelete()" value="삭제">
                    <%} %>
                    </div>
                </div>
                </form>
        </div>
		</main>
		<footer>
			<jsp:include page="/include/footer.jsp"/>
		</footer>
	</div>

</body>
<script src="./js/header.footer.js"></script>
</html>