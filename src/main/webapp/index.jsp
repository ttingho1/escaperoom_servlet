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
   <link rel="stylesheet" href="./css/header.footer.css">
   <link rel="stylesheet" href="./css/pordect_purchase.css">
   <link rel="stylesheet" href="./css/main.css">
   <link rel="stylesheet" href="./css/swiper-bundle.css">
   <link rel="stylesheet" href="./css/swiper-bundle_img.css">
   <link rel="stylesheet" href="./css/theme_info.css">
   <link rel="stylesheet" href="./css/becareful.css">
   <!-- JS 플러그인 파일 -->
   <script src="./js/
   jquery-1.12.4.min.js"></script>
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
	/* TOP 버튼 */
    aside .top {
        width: 60px;
        height: 60px;
        line-height: 60px;
        background-color: #fff;
        color: black;
        opacity: 0.7;
        text-align: center;
        border-radius: 10px;
        border: 1px solid #ccc;
        /* 포지션 */
        position: fixed;
        right: 20px;
        bottom: 20px;
        z-index: 100;
        font-weight: bold;
        /* 로딩시 숨기기 */
        /* display: none; */
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
			             <a href="#theme" class="down">THEME</a>
			           </li>
			           <li class="gnb_2dtp">
			             <a href="#preview" class="down">PREVIEW</a>
			           </li>
			           <li class="gnb_2dtp">
			             <a href="#notice" class="down">NOTICE</a>
			           </li>
			         </ul>
			       </li>
			     </ul>
			   </div>
			 </div>
		</header>
        <!-- 2.Slider -->
        <article>
            <div class="slider">
                <ul class="bg_slider">
                    <li id="li1"><a href="#" onclick="return false"><img src="./images/main_images/1_a.jpg" alt="배경슬라이드이미지1" id="bg1"></a></li>
                    <li id="li2"><a href="#" onclick="return false"><img src="./images/main_images/2_a.jpg" alt="배경슬라이드이미지2" id="bg2"></a></li>
                </ul>
            </div>
        </article>
    <!-- /2.Slider -->
    	<hr id="theme">
        <hr class="divider">
        <p class="dvider_p">THEME</p>
    <!-- 3.Contents -->
        <main role="main">
        <!-- Section_01 -->
        <section>
    	    <jsp:include page="/include/swiper_container.jsp" />
        </section>
        <!-- /Section_01 -->
        <!-- Section_02 -->
        <hr id="preview">
        <section>
	   		<jsp:include page="/include/theme_info.jsp"/>        
        </section>            
        <!-- /Section_02 -->
        <!-- Section_03 -->
        <hr id="notice">
   		<section>
   			<jsp:include page="/include/becareful.jsp"/>
   		</section>
        <!-- /Section_03 -->
			<div class="pline"></div>
        </main>
    <!-- /3.Contents -->
    	<aside>
    		<div>
    			<a href="#" class="top">TOP</a>
    		</div>
    	</aside>
    <!-- 4.Footer -->
        <footer>
			<jsp:include page="/include/footer.jsp"/>
		</footer>
        <!-- /4.Footer -->
    </div>
</body>
<script src="./js/header.footer.js"></script>
<script src="./js/slide.js"></script>
<!-- 제이쿼리 플러그인 추가 -->
<script src="./js/swiper-bundle.js"></script>
<!-- 페이지 JS -->
<script src="./js/slide_section.js"></script>
<script src="./js/theme_info.js"></script>
</html>