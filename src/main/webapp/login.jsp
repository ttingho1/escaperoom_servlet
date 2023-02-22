<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <!-- 메타검색 -->
   <meta name="author" content="kmh">
   <meta name="description" content="Portfolio, Float, Montblanc Templage">
   <title>무한의 즐거움 - 방탈출카페</title>
   <!-- 폰트어썸 -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
   <!-- 파비콘 -->
   <!-- 리셋, 폰트 CSS -->
   <link rel="stylesheet" href="./css/reset.css">
   <link rel="stylesheet" href="./css/notosans_kr_CDN.css">
   <!-- 페이지CSS -->
   <link rel="stylesheet" href="./css/projectA.css">
   <link rel="stylesheet" href="./css/header.footer.css">
   <script src="./js/projectA.js"></script>
   <!-- JS 플러그인 파일 -->
   <script src="./js/jquery-1.12.4.min.js"></script>
   <script src="./js/jquery-3.3.1.min.js"></script>
   <script src="./js/prefixfree.min.js"></script>
   <script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
   <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
   <script src="./js/jquery.bxslider.js"></script>
   <script src="./js/jquery.scrollTo.min.js"></script>
   <!-- 부트스트렙 -->
  <style>
  	header .gnb_main .button>ul>li:nth-child(2){
	  height: 460px;
	}
  </style>
</head>
<body>
    <div id="wrap"> 
    	<header>
			<jsp:include page="/include/header.jsp"/>
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
		</header>
			<div class="w1280 cf">
		        <p class="home2"><a href="index.jsp"><img src="./images/Home.PNG" alt="홈아이콘"></a>> 로그인</p>
		    </div>
		    <section class="login">
		        <h1>LOGIN</h1>
		        <h3>WELCOM BACK</h3>
		        <form method="post" action="LoginCtrl.do">
		            <table class="table2">
		                <tr>
		                    <td><input type="text" name="id" placeholder="아이디"></td>
		                </tr>
		                <tr>
		                    <td><input type="password" name="password" placeholder="비밀번호"></td>
		                </tr>
		                <tr class="login_btn">
		                    <td colspan="1">
		                        <input type="submit" value="로그인" class="btn btn-primary">
		                    </td>
		                </tr>
		                <tr class="serch">
		                    <td style="border:none">
		                        <a href="signup.jsp">회원가입</a> 
		                    </td>
		                </tr>
		            </table>
		        </form>
		    </section>
        <footer class="F_include">
			<jsp:include page="/include/footer.jsp"/>
		</footer>
        <!-- /4.Footer -->
    </div>
</body>
<script src="./js/header.footer.js"></script>
<script src="./js/slide.js"></script>
</html>