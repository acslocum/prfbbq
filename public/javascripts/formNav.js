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
        error = 'ajax/ajax_error.html',
        customSelect = $(select).parents('.customSelects_container'),
        loader = $('<div>').text('Loading').addClass('navLoader');
        that = this;
        
        
    var options = [];
    if($(nextSelect).attr('id') == 'place') {
      options.push($('<option>').val('aus-mar').text('AUS/MAR'));
      options.push($('<option>').val('chi-jun').text('CHI/JUN'));
    } else {
      options.push($('<option>').val('wed').text('Wednesday'));
      options.push($('<option>').val('thu').text('Thursday'));
    }
        
    $(customSelect).append(loader);
    this.selects.parents('.customSelects_container').addClass('disabled');
    
    $.ajax({
      type:'get',
      //url:action,
      success: function() {
        that.replaceOptions(nextSelect, options);    
        that.selects.parents('.customSelects_container').removeClass('disabled');
        loader.remove();
      },
      error: function() {
        that.selects.parents('.customSelects_container').removeClass('disabled');
        loader.remove();
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
  }
};