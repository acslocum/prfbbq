var FormNav = {
  init: function(form) {
    this.form = $(form);
    this.selectYear = this.form.find('#year');
    this.selectPlace = this.form.find('#place');
    this.selectDay = this.form.find('#day');
    this.submit = this.form.find('button[type=submit]');
    
    if(this.selectDay.val() == 'prompt') {
      this.submit.addClass('disabled');
    }
    this.bindEvents();
  },
  
  bindEvents: function() {
    var that = this;
    
    this.submit.click(function() {
      if($(this).hasClass('disabled')) {
        return false;
      }
    });
    
    this.selectYear.change(function() {
      that.updateNextSelect(this, that.selectPlace);
    });
    
    this.selectPlace.change(function() {
      that.updateNextSelect(this, that.selectDay);
    });
    
    this.selectDay.change(function() {
      if($(this).val() != 'prompt') {
        that.submit.removeClass('disabled');
      } else {
        that.submit.addClass('disabled');
      }
    });
  },
  
  updateNextSelect: function(select, nextSelect) {
    if($(select).val() != 'prompt') {
      $(nextSelect).customSelects.enableSelect(nextSelect);
    } else {
      $(nextSelect).customSelects.disableSelect(nextSelect);
    }
    
    // $.ajax(function() {
    //   url:url
    // });
  }
};