<%@page import="java.io.PrintWriter"%>
<%@page import="biz.board.BoardBean"%>
<%@page import="biz.board.BoardDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	request.setCharacterEncoding("utf-8");
 	int num = Integer.parseInt(request.getParameter("num"));
 	
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 삭제 처리</title>
</head>
<body>
	<jsp:useBean id="boardbean" class="biz.board.BoardBean">
		<jsp:setProperty name="boardbean" property="*" />
	</jsp:useBean>
<%
	BoardDAO bdao = new BoardDAO();
	BoardBean bean = bdao.getOneUpdateBoard(num);
	response.setContentType("text/html; charset=utf-8");
	PrintWriter printWriter = response.getWriter(); 
	String sessionId = session.getAttribute("id").toString();
	String writer = bean.getId();
	
	if(!sessionId.equals(writer)){
		printWriter.println("<script>alert('잘못된 접근입니다.'); location.href = '/escaperoom/qna_board_list.jsp';</script>");
		printWriter.flush();
	}else{
		if(bdao.deleteBoard(num)){
%>
	<script>
		alert('삭제완료');
			location.href="qna_board_list.jsp";
	</script>
<%
	 	}
	}
%>
</body>
</html>