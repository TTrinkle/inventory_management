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
});