// $('document').ready(function(){
// 	$('.top-header').click(function(){
// 		console.log('hey there')
// 		$('.top-letters').toggle();	
// 	});

// 	$('.collapse').on('show.bs.collapse', function () {
// 			console.log('hey');
// 	    $('.collapse.in').collapse('hide');
// 	});
// 	$('.bottom-header').on('click', showBottom);
	
// })



// var showBottom = function(){
// 	$('.bottom-letters').toggle();
// }

$(document).ready(function() {
	console.log("this is working")
  $('a[href*=#]').each(function() {
    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'')
    	&& location.hostname == this.hostname
    	&& this.hash.replace(/#/,'') ) {
 				var $targetId = $(this.hash), $targetAnchor = $('[name=' + this.hash.slice(1) +']');
 				var $target = $targetId.length ? $targetId : $targetAnchor.length ? $targetAnchor : false;
       	if ($target) {
 					var targetOffset = $target.offset().top;
					$(this).click(function() {
          $("#nav li a").removeClass("active");
            $(this).addClass('active');
           $('html, body').animate({scrollTop: targetOffset}, 1000);
           return false;
         });
      }
    }
  });
  $('.top-header').click(function(){
   console.log('hey there')
   $('.top-letters').toggle(); 
  });

  $('.collapse').on('show.bs.collapse', function () {
    console.log('hey');
    $('.collapse.in').collapse('hide');
  });
  $('.bottom-header').on('click', function(){
    console.log('clicked bottom');
    $('.bottom-letters').toggle();
  });
  $('.new-letter-cta').on('click', function(){
    $('#slide2-half').slideToggle();
  })
  $(function() {
   $(".letters_list").mousewheel(function(event, delta) {
    this.scrollLeft -= (delta * 30);
    event.preventDefault();
   });
  });
  $('.right-arrow').on('click', function(){
    $('.letters1').addClass('animated bounceOutLeft');
  });
  $('.right-arrow-2').on('click', function(){
    $('.letters2').removeClass('bounceInLeft').addClass('animated bounceOutLeft');
  });
  $('.left-arrow-2').on('click', function(){
    $('.letters2').removeClass('bounceOutLeft').addClass('bounceInLeft');
  });
  $('.left-arrow').on('click', function(){
    $('.letters1').removeClass('bounceOutLeft').addClass('bounceInLeft');
  });

  TweenMax.to("#letter_inventory", 2, {x:100, ease:Bounce.easeOut});
  TweenMax.staggerFrom("#letter_inventory", 1, {opacity:0, y:300, rotation:360, scale: 5, delay: 2}, 0.2)
});