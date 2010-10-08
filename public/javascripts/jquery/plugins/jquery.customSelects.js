/*
jQuery customSelects Plugin
  * Version 1.0
  * 04-30-2010
  * URL: http://github.com/mdbiscan/customSelects
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
  $.fn.customSelects = function(options) { 
    var settings = $.extend({}, $.fn.customSelects.defaults, options); 
    
    return this.each(function(index) {
      var $select = $(this),
          $options = $select.children(),
          $container = $('<div class="customSelects_container">'),
          $title = $('<div class="customSelects_title">'),
          $list = $('<ul class="customSelects_list">');

      ///////////
      // Setup //
      ///////////
      buildCustomSelectOptions();
      var $items = $list.children();
      
      $select
        .before($container)
        .appendTo($container);
      
      $container.css({ position:'relative' });
        
      if($select.attr('id') != '') {
        $container.attr('id', 'customSelect_' + $select.attr('id'));
      }

      $title
        .css({ cursor:'pointer' })
        .text($.data($options.filter(':selected'), 'data', $options.filter(':selected').text()))
        .appendTo($container);

      $list
        .css({
          position:'absolute',
          zIndex:settings.zIndex
        })
        .hide();
        
      if($.browser.msie && $.browser.version <= '7.0') {
        $list.appendTo('body');
      } else {
        $list.appendTo($container); 
      }
      
      $items
        .css({
          cursor:'pointer'
        })
        .eq($options.filter(':selected').index())
        .addClass('selected');
      
      $select.hide();
       
      $([$title, $list]).each(function() {
        unselectableText(this);
      }); 
        
      if($select.attr('disabled') == true) {
        $container.addClass('disabled');
      }
      
      ////////////
      // Events //
      //////////// 
      $title.click(function(event) {         
        if($container.hasClass('disabled')) {
          pulseCustomSelect();
        } else {
          if($list.hasClass('opened')) {
            closeList();
          } else {
            openList();
          }
        }
      });
    
      $list.mouseleave(function() {  
        closeList();
      });
    
      $items.each(function() {            
        $(this).mousedown(function() { 
          selectItem(this);
        }).mouseenter(function() {
          hoverOver(this);
        });
      });
      
      $(document).click(function(event) {
        if($list.hasClass('opened')) {
          closeList();
        }
      });
      
      ///////////////////////
      // Private functions //
      ///////////////////////
      function buildCustomSelectOptions() {
        (function loop(index) {
          var data, className;
          if(index == $options.length) {
            return;
          } else {
            data = $.data($options.eq(index), 'option', $options.eq(index).text());
            className = $options.eq(index).attr('class');
            
            $('<li>')
              .text(data)
              .addClass(className)
              .appendTo($list);
          }

          loop(index+1);
        }(0));
      };
      
      function openList() {        
        hoverOver($items.eq(0));
        
        $list
          .slideDown(settings.speed, function() {
            $(this).addClass('opened');
            $list.scrollTop(0);
          })
          .css({
            zIndex:settings.zIndex
          });
        $title.addClass('active');
        $container.addClass('active');
        
        if($.browser.msie && $.browser.version <= '7.0') {
          positionFix();
        }
      };
      
      function closeList() {        
        $list.slideUp(settings.speed, function() {
            $(this).removeClass('opened');
            $list.css({
              zIndex:0
            });
            $title.removeClass('active');
            $container.removeClass('active');
            $items.removeClass('hover');
          });
      };
      
      function selectItem(item) {
        var value = $.data(item, 'text', $(item).text());
        
        $items
          .removeClass('selected')
          .filter(item)
          .addClass('selected');
        $title.text(value);
        $options
          .eq($(item).index())
          .attr({selected:'selected'});
          
        $select.change();        
        closeList();
      };
      
      function hoverOver(item) {
        $items.removeClass('hover');
        $(item).addClass('hover');
      };
      
      function moveUp(trigger, item) {
        $(trigger).removeClass('stopDown');
        
        if($items.filter(':first').hasClass('hover')) {
          $(trigger).addClass('stopUp');
        }
        
        if(!$(trigger).hasClass('stopUp')) {
          var prevItem = $(item).prev();
          
          scrollList(prevItem);
          hoverOver(prevItem);
        }
      };
      
      function moveDown(trigger, item) {
        $(trigger).removeClass('stopUp');
        
        if($items.filter(':last').hasClass('hover')) {
          $(trigger).addClass('stopDown');
        }
        
        if(!$(trigger).hasClass('stopDown')) {
          var nextItem = $(item).next();  
          
          scrollList(nextItem);
          hoverOver(nextItem);
        }
      };
      
      function scrollList(item) {
        var height = $(item).innerHeight(),
            scrollBy = $(item).index();
            
        $list.scrollTop(height*scrollBy);
      }
      
      // Disabled customSelect feedback
      function pulseCustomSelect() {
        var opacity = $container.css('opacity');
        $container.fadeTo(150, opacity/2, function() {
          $(this).fadeTo(150, opacity);
        });
      };
      
      // Fixes text select when clicking into an element
      function unselectableText(target) {
        $(target)
  				.css('-moz-user-select', 'none')
  				.css('-khtml-user-select', 'none')
  				.css('user-select', 'none');

  			if($.browser.msie) {
  				$(target).each(function() {
  					this.ondrag = function() {
  						return false;
  					};
  				});
  				
  				$(target).each(function() {
  					this.onselectstart = function() {
  						return (false);
  					};
  				});
  			} else if($.browser.opera) {
  				$(target).attr('unselectable', 'on');
  			}
      };
      
      // fixes IE6/7 positioning bug
      function positionFix() {
        var top = $container.offset().top + $container.innerHeight() + 2,
            left = $container.offset().left,
            width = $container.innerWidth();
        
        $list
          .css({
            left:left,
            top:top,
            width:width
          });
      };
      
      // Remote Update for public functions
      function remoteUpdate(select, value, string) {
        var customSelect = $(select),
            options = customSelect.children(),
            title = customSelect.parent().find('.customSelects_title');
        
        var selectOption = function(option) {  
          $(option).attr({selected:'selected'});
        };
        
        options.each(function() {
          var val;
          if(string == 'value') {
            val = $(this).val();
          } else if(string == 'text') {
            val = $(this).text();       
          }
          
          if(value == val) {
            selectOption(this);
          }
        });
        
        var selectedOptionHTML = options.filter(':selected').html(),
            listItems = customSelect.parent().find('li');
        
        listItems.each(function() {
          if($(this).html() == selectedOptionHTML) {
            var selectedText = $(this).html();
                     
            $(this).addClass('selected');
            title.text(selectedText);
          } else {
            $(this).removeClass('selected');
          }
        });
      };

      //////////////////////
      // Public functions //
      //////////////////////
      $.fn.customSelects.enableSelect = function(select) {
        var container = $(select).parent();
        $(container).removeClass('disabled');
        $(select).attr('disabled', false);
      };
      $.fn.customSelects.disableSelect = function(select) {
        var container = $(select).parent();
        $(container).addClass('disabled');
        $(select).attr('disabled', true);
      };
      $.fn.customSelects.resetSelect = function(select) {
        var container = $(select).parent(),
            firstOption = $(select).children().filter(':first'),
            title = $(container).find('.customSelects_title'),
            value = firstOption.text();
        
        firstOption.attr({selected:'selected'});
        title.html(value);
      };
      $.fn.customSelects.remoteUpdateSelectByValue = function(select, value) {
        remoteUpdate(select, value, 'value');
      };
      $.fn.customSelects.remoteUpdateSelectByText = function(select, text) {
        remoteUpdate(select, text, 'text');
      };
      // Useful for selects that are updated via Ajax
      $.fn.customSelects.rebuildList = function(select) {
        var customSelect = $(select),
            container = customSelect.parent(),
            inputContainer = container.parent();
            
        customSelect.detach();
        container.remove();
        
        customSelect.appendTo(inputContainer);
        customSelect.customSelects({
          zIndex:settings.zIndex,
          speed:settings.speed
        });
      };
      $.fn.customSelects.returnCustomSelectTitle = function(select) {
        var customSelect = $(select).parent().find('.customSelects_title');
        return customSelect;
      };
    });
  };

  ////////////////////
  // Default optons //
  ////////////////////
  $.fn.customSelects.defaults = {
    zIndex:100,
    speed:100
  };
})(jQuery);