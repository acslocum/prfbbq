/*
jQuery addSymbol Plugin
  * Version 1.0
  * 04-30-2010
  * URL: http://github.com/mdbiscan/addSymbol
  * Author: M.Biscan
  * requires jQuery1.4.2
  
  Copyright (c) 2010 M.Biscan

  Permission is hereby granted, free of charge, to any person obtaining
  a copy of this software and associated documentation files (the
  "Software"), to deal in the Software without restriction, including
  without limitation the rights to use, copy, modify, merge, publish,
  distribute, sublicense, and/or sell copies of the Software, and to
  permit persons to whom the Software is furnished to do so, subject to
  the following conditions:

  The above copyright notice and this permission notice shall be
  included in all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
  LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
  OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
  WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/
(function($){
  $.fn.addSymbol = function(options) { 
    var settings = $.extend({}, $.fn.addSymbol.defaults, options); 
   
    return this.each(function() { 
      var $input = $(this);

      $input.focus(function() {
        var value = $input.val();
        $input.val(value.replace(/\D/g, ''));
      }).blur(function() {
        var value = $input.val();
        if($input.val() == '') {
          $input.val('');
        } else {
          if(settings.position == 'before') {
            $input.val(settings.symbol + value);
          } else {
            $input.val(value + settings.symbol);
          }
        }
      });
    });
  };

  ////////////////////
  // Default optons //
  ////////////////////
  $.fn.addSymbol.defaults = {
    symbol:'$',
    position:'before'
  };
})(jQuery);