function CleanValue(input) {
  var value = $(input).val(),
    valueArray = value.split('');
    
  if(valueArray[0] == 0) {
    var newValue = valueArray[1] + valueArray[2] + valueArray[3] + valueArray[4] + valueArray[5] + valueArray[6];
    $(input).val(newValue);
  }
};