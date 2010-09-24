/*
jQuery simpleCarousel Plugin
  * Version 1.0
  * 04-30-2010
  * URL: http://github.com/mdbiscan/simpleCarousel
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
  $.fn.simpleCarousel = function(options) {
    var settings = $.extend({}, $.fn.simpleCarousel.defaults, options);
    
    return this.each(function(index) {
      var $list = $(this),
          $items = $list.children();
          // Generated elements for the carousel
      var $container = $('<div class="simpleCarouselContainer">'),
          $wrapper = $('<div class="simpleCarouselWrapper">'),
          $nextControl = $('<a href="#" class="simpleCarouselNext">next</a>'),
          $prevControl = $('<a href="#" class="simpleCarouselPrev">prev</a>');
          // sizes
      var $currentPage = 1,
          $pages = Math.ceil($items.length/settings.showItems);
      
      ////////////
      // Set up //
      ////////////
      $container
        .css({
          height:settings.height,
          width:settings.width*settings.showItems
        })
        .addClass(settings.customClass);
      $list.replaceWith($container);
      
      if($pages > 1) {
        $([$nextControl, $prevControl]).appendTo($container);
      };
      
      $wrapper
        .appendTo($container)
        .css({
          'overflow':'hidden',
          height:settings.height,
          width:settings.width*settings.showItems
        })
        .scrollLeft(0);
      $list
        .css({
          height:settings.height,
          width:settings.width*$items.length
        })
        .appendTo($wrapper);
      $items.each(function() {
        $(this).css({
          'display':'block',
          'float':'left',
          height:settings.height,
          width:settings.width
        });
      });
      
      $wrapper.filter(':not(:animated)').animate({scrollLeft:0}, 0);

      ////////////////////
      // Function calls //
      ////////////////////
      updateControlHref($currentPage);
      // Loop option
      if(settings.loop == false) {
        setControls($currentPage);
      }
      
      /////////////
      // Events //
      ////////////
      $nextControl.click(function() {
        controlContext(this, $currentPage+1);
        return false;
      });
      $prevControl.click(function() {
        controlContext(this, $currentPage-1);
        return false;
      });
      
      
      ///////////////////////
      // Private functions //
      ///////////////////////
      function controlContext(control, page) {
        if(!$(control).hasClass('disabled')) {
          if(!$(control).hasClass('active')) {
            $(control).addClass('active');
            gotoPage(control, page);
          }
        }
      };

      function setControls(page) {
        if(page == $pages) {
          $nextControl.addClass('disabled');
          $prevControl.removeClass('disabled');
        } else if(page == 1) {
          $nextControl.removeClass('disabled');
          $prevControl.addClass('disabled');         
        } else {
          $nextControl.removeClass('disabled');
          $prevControl.removeClass('disabled');
        }
      };

      function updateControlHref(currentPage) { 
        var nextPage,
            prevPage;
        if(currentPage == $pages) {
          nextPage = 1;
          prevPage = $currentPage-1;
        } else if(currentPage == 1) {
          nextPage = $currentPage+1;
          prevPage = $pages;
        } else {
          nextPage = currentPage+1;
          prevPage = currentPage-1;
        }

        if(!$nextControl.hasClass('disabled')) {
          $nextControl.attr('href', nextPage);
        }
        if(!$prevControl.hasClass('disabled')) {
          $prevControl.attr('href', prevPage);
        }
      };

      function gotoPage(control, page) {
        if(settings.loop == true) {
          if(page > $pages) {
            page = 1;
          } else if(page == 0) {
            page = $pages;
          }
        } else {
          setControls(page);
        }

        var dir = page < $currentPage ? -1 : 1,
            n = Math.abs($currentPage - page),
            left = settings.width*dir*settings.showItems*n;

        var that = this;
        $wrapper.filter(':not(:animated)').animate({
          scrollLeft:'+='+left
          }, 
          settings.animationSpeed, 
          function() {
            $currentPage = page;
            updateControlHref($currentPage);
            if(control != 'externalPager') {
              $(control).removeClass('active');
            }
        });
      };
      
      //////////////////////
      // Public functions //
      //////////////////////
      $.fn.simpleCarousel.externalPager = function(page) {
        gotoPage('externalPager', page);
      };
      $.fn.simpleCarousel.getDimensions = function() {
        return {width: settings.width, height: settings.height};
      };
      $.fn.simpleCarousel.getControls = function() {
        return {next: $nextControl, prev: $prevControl};
      };
    });
  };
  
  ////////////////////
  // Default optons //
  ////////////////////
  $.fn.simpleCarousel.defaults = {
    width:'auto',
    height:'auto',
    showItems:1,
    animationSpeed:250,
    loop:false,
    customClass:'simpleCarousel'
  };
})(jQuery);