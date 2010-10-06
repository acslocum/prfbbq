$(function() {
  console.log('hi');
  function VerticalScroller(container) {
    var height = $(container).innerHeight();
    
    console.log('hi');
    
    $(container).css({overflow:'hidden'});

    $(container).mousemove(function(event) {
      $(this).scrollUp();
    });
  };
  
  var verticalScroller = new VerticalScroller();
  verticalScroller('#page-content');
});