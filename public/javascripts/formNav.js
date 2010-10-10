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
    var action = this.form.attr('action'),
        options = [],
        error = 'ajax/ajax_error.html',
        that = this;
        
    if($(nextSelect).attr('id') == 'place') {
      options.push($('<option>').val('aus-mar').text('AUS/MAR'));
      options.push($('<option>').val('chi-jun').text('CHI/JUN'));
    } else {
      options.push($('<option>').val('wed').text('Wednesday'));
      options.push($('<option>').val('thu').text('Thursday'));
    }
        
    this.addLoader(select);
    
    $.ajax({
      type:'get',
      //url:action,
      success: function() {
        that.replaceOptions(nextSelect, options);
        that.removeLoader(select);
      },
      error: function() {
        //
      }
    });   
  },
  
  replaceOptions: function(nextSelect, options) {
    $(nextSelect).empty();
    
    $(options).each(function() {
      $(nextSelect).append(this);
    });

    $(nextSelect).customSelects.rebuildList(nextSelect);
    $(nextSelect).change();
  },
  
  rebuildFormAction: function() {
    var action = this.form.attr('action'),
        year = this.selectYear.val(),
        place = this.selectPlace.val(),
        day = this.selectDay.val();
        
    return action + '/' + year + '/' + place + '/' + day;
  },

  addLoader: function(select) {
    console.log('addLoader', select);
  },
  
  removeLoader: function(select) {
    console.log('removeLoader', select);
  }
};