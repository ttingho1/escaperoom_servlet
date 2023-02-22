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
<title>글쓰기 처리</title>
</head>
<body>
	<jsp:useBean id="boardbean" class="biz.board.BoardBean">
		<jsp:setProperty name="boardbean" property="*" />
	</jsp:useBean>
<%
	boardbean.setId(session.getAttribute("id").toString());
	// DAO 생성
	BoardDAO bdao = new BoardDAO();

	// 새글등록 메서드
	bdao.insertBoard(boardbean);
	
	// 게시글 저장후 전체글 목록으로 이동
	response.sendRedirect("qna_board_list.jsp");
%>
</body>
</html>