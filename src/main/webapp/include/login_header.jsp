<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<div class="line">
   <aside class="gnb_head w1260">
     <div class="login_btn">
       <ul>
<%
	String name = (String) session.getAttribute("name");
	if(name == null){ // name 세션값이 없으면, 로그인 표시
%>
         <li><a href="login.jsp">로그인</a></li>|
         <li><a href="signup.jsp">회원가입</a></li>|
         <li><a href="qna_board_list.jsp">Q&amp;A</a></li>|
<%
	} else { // 세션값이 있으면, 로그아웃 표시
%>
         <li><a onclick="logout();">${name }님 로그아웃</a></li>|
         <li><a href="qna_board_list.jsp">Q&amp;A</a></li>|
<%		
	}
%>
         <li class="gnb_2dtp">
       </ul>
     </div>
   </aside>
 </div>
 <h1><a href="index.jsp"><img src="images/escape_logo.png" alt="로고이미지" /></a></h1>
 <div class="line_2nd">
   <div class="gnb_main">
     <ul class="w1260">
       <li>
         <ul>
           <li class="gnb_2dtp">
             <a href="#theme" class="down" class="login_header">로그인해서 더 많은 혜택을 누려보세요</a>
           </li>
         </ul>
       </li>
     </ul>
   </div>
 </div>