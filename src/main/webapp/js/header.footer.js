//스크롤 위치에 따라 상단 메뉴 브라우저에 고정
$(window).on('scroll',function(){
  var sc_top = $(this).scrollTop();
  if(sc_top>110){
    $('.line_2nd').css({"position":"fixed",'top':'42px','left':'50%','transform':'translateX(-50%)','z-index':'970'});
    $('header h1').css({"padding-bottom":"52px"});
  }else{
    $('.line_2nd').css({"position":"relative",'top':'0','transform':'translateX(-50%)'});
    $('header h1').css({"padding-bottom":"0"});
  }
});

function logout() {
   if(confirm('로그아웃 하시겠습니까?')){
	   location.href='LogoutCtrl';
	}
}

// 페이지 스크롤 부드럽게
$('.gnb_main .down').click(function(e){
  e.preventDefault();
  $(window).scrollTo(this.hash || 0,500);
})

// 스크롤 100px 이상 되었을때 top버튼 나오기
const sa = 100;  // scroll area px
$(window).scroll(function(){
    var num = $(window).scrollTop();
    //console.log(num);
    if(num>sa){
        $('aside .top').stop().fadeIn();
    }else{
        $('aside .top').stop().fadeOut();
    }
});

 /*animate  탑버튼 누를시 부드러운 스크롤탑 이동*/
  $('.top').click(function(e){
    e.preventDefault();
    $('html,body').stop().animate({scrollTop:0},1000,'swing');
});