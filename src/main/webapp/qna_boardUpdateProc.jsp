<%@page import="biz.board.BoardBean"%>
<%@page import="biz.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	request.setCharacterEncoding("utf-8");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정 처리</title>
</head>
<body>
	<jsp:useBean id="boardbean" class="biz.board.BoardBean">
		<jsp:setProperty name="boardbean" property="*" />
	</jsp:useBean>
<%
	BoardDAO bdao = new BoardDAO();
	if(bdao.updateBoard(boardbean)){ 
		System.out.println("수정 후");
%>
	<script>
		alert('수정완료')
		location.href="qna_board_list.jsp";
	</script>
<%
	}
%>
</body>
</html>