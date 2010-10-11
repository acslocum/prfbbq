function AddAMPM(input) {
  var ampm = $('<ul>').addClass('ampm'),
      item = $('<li>'),
      offset = $(input).offset();
      
  var am = item.clone().text('AM').appendTo(ampm).css({'cursor':'pointer'}),
      pm = item.clone().text('PM').appendTo(ampm).css({'cursor':'pointer'});
      
  var items = ampm.children();
  items.click(function() {
    var text = $(this).text(),
        value = $(input).val().split(' '),
        newValue = value[0] + ' ' + text;         
    
    if(value != '') {
      $(input).val(newValue);
      items.removeClass('selected');
      $(this).addClass('selected');
    } else {
      $(input).focus();
    }
  });
    
  ampm
    .css({
      left:offset.left  + $(input).innerWidth(),
      'position':'absolute',
      top:offset.top
    })
    .appendTo('body')
    .hide()
    .fadeIn(150);
};