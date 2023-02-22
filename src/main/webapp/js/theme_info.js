// 텝메뉴
$('.container .tabs li').click(function(){
    // 변수선언
    const tab_id = $(this).attr('data-tab');
    $('ul.tabs li').removeClass('current');
      $('.tab-content').removeClass('current');
      $(this).addClass('current');
      $("#"+tab_id).addClass('current');
})






