$(document).ready(function() {


  setTimeout(function(){
    $('a.page-scroll').bind('click', function(event) {
        var $anchor = $(this);
        $('html, body').stop().animate({
            scrollTop: ($($anchor.attr('href')).offset().top - 80)
        }, 1250, 'easeInOutExpo');
        event.preventDefault();
    });

    // Highlight the top nav as scrolling occurs
    $('body').scrollspy({
        target: '.navbar-fixed-top',
        offset: 51
    });

    // Closes the Responsive Menu on Menu Item Click
    $('.navbar-collapse ul li a').click(function(){
            $('.navbar-toggle:visible').click();
    });

    // Offset for Main Navigation
    $('#mainNav').affix({
        offset: {
            top: 1
        }
    });

    if (screen.width > 992) {
      $w = $('.grid-sizer').width();
      $('.grid-item').height($w*1.5);
      $('.grid-item--heigth2').height($w*1);
      $('.grid-item--heigth3').height($w*0.5);
      $('.grid-item--heigth4').height($w*0.5-36);
      console.log($w*2);
    };



    $('.grid-masonry').masonry({
      itemSelector: '.grid-item',
      columnWidth: '.grid-sizer',
      gutter: '.gutter-sizer',
      transitionDuration: '0.8s',
      rowHeight: 15,
      percentPosition: true
    });

  }, 1000);


  $u = $('.gutter-sizer').width();
  $('.grid-masonry').css('margin-top', $u);
  $('.grid-item').each(function() {
    $(this).css('margin-bottom', $u);
  });
  $('.grid-item-top').each(function() {
    $(this).css('margin-top', $u);
  });
  if (screen.width > 768) {
    $('.grid-item a').hover(function(){
      $('.hover', this).fadeToggle('slow');
    });

  }

  if (window.location.href.indexOf("#") > -1){
    var speed = 750;
    var reg = window.location.href.match(/\#(.*)$/);
    var page = reg[0];
    console.log(page);
    $('html, body').animate( { scrollTop: $(page).offset().top - 110}, speed );
  };
  setTimeout(function(){
  $('.alert').fadeOut(1000);
   }, 5000);
  setTimeout(function(){
  $('.alert-notice').fadeOut(1000);
   }, 5000);
    setTimeout(function(){
  $('.alert-alert').fadeOut(1000);
   }, 5000);
  $('#email_true').modal();

  $('#myModalSuccess button').click(function() {
    $('#snackbar').removeClass("show");
  });

  if ( ! Modernizr.objectfit ) {
    $('.post-cover__image-container').each(function () {
      var $container = $(this),
          imgUrl = $container.find('img').prop('src');
      if (imgUrl) {
        $container
          .css('backgroundImage', 'url(' + imgUrl + ')')
          .addClass('compat-object-fit');
      }
    });
  }
    $().button('toggle');

    function snackbar() {
      var x = document.getElementById("snackbar")
      x.className = "show";
      $('#snackbar .close').click(function() {
         x.className = x.className.replace("show", "");
      });
    }
  $('.follow').click(function(){
   $('.fa-star', this).toggleClass('dore');
  });


// $('#add-to-cart-button').click(function(e) {
//   e.preventDefault();
//   var data = $( "#cart-form form" ).serialize();
//   $.ajax({
//     type: "POST",
//     url: "/orders/populate",
//     data: data})
//     .done(function(response){ //same as .success (depricated as of 1.8)
//       Spree.fetch_cart();
//       console.log("done");
//       $('#resume-cart').append('variant_id');
//       $('#resume-cart').fadeIn();
//       setTimeout(function(){
//         $('#resume-cart').fadeOut();
//       }, 5000);

//     })
//     .fail(function(){ //replaces .error
//       console.log("error");
//     })
//     .always(function(/*data|jqXHR, textStatus, jqXHR|errorThrown*/){ //replaces .complete
//       console.log("always");
//     });
//   });
// $('#add-to-cart-button').click(function(e) {
//       e.preventDefault();
//       var data = $( "#cart-form form" ).serialize();
//       $.ajax({
//         type: "POST",
//         url: "/orders/populate",
//         data: data})
//         .done(function(response){ //same as .success (depricated as of 1.8)
//           Spree.fetch_cart();
//           console.log("done");

//           $('#resume-cart').append('variant_id');
//           $('#resume-cart').fadeIn();
//           setTimeout(function(){
//             $('#resume-cart').fadeOut();
//           }, 5000);

//         })
//         .fail(function(){ //replaces .error
//           console.log("error");
//         })
//         .always(function(/*data|jqXHR, textStatus, jqXHR|errorThrown*/){ //replaces .complete
//           console.log("always");
//         });
//       });
  $('#FBModal').fadeIn();
    $('.closenow').click(function() {
      $('#FBModal .modal-dialog').fadeOut();
    });

});

