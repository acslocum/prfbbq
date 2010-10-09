var FormNav = {
  init: function(form) { 
    this.form = $(form);
    this.selects = this.form.find('select');
    this.selectYear = this.form.find('#year');
    this.selectPlace = this.form.find('#place');
    this.selectDay = this.form.find('#day');
    this.submit = this.form.find('button[type=submit]');
    
    this.bindEvents();
  },
  
  bindEvents: function() {
    var that = this;
    
    this.submit.click(function() {
      var action = that.rebuildFormAction();
      that.form.attr('action', action).submit();  
      return false;
    });
    
    this.selectYear.change(function() {
      that.updateNextSelect(this, that.selectPlace);
    });
    
    this.selectPlace.change(function() {
      that.updateNextSelect(this, that.selectDay);
    });
    
    this.selectDay.change(function() {
      that.submit.removeClass('disabled');
    });
  },
  
  updateNextSelect: function(select, nextSelect) {    
    // $.ajax(function() {
    //   url:url
    // });
    
    //$(nextSelect).customSelects.rebuildList(nextSelect);
    $(nextSelect).customSelects.enableSelect(nextSelect);
  },
  
  rebuildFormAction: function() {
    var action = this.form.attr('action'),
        year = this.selectYear.val(),
        place = this.selectPlace.val(),
        day = this.selectDay.val();
        
    return action + '/' + year + '/' + place + '/' + day;
  }
};