class Band < ActiveRecord::Base
  belongs_to :day
  
  def <=>(otherBand)
    #date_compare = day.bbq_date <=> otherBand.day.bbq_date
    #return date_compare unless date_compare == 0
    
    time_cmp = time_compare(start_time, otherBand.start_time)
    return time_cmp unless time_cmp == 0
    
    return id <=> otherBand.id
  end
  
  # sort bands by start time, such that "saturday morning 11 am" < "saturday night 10pm" < "saturday night 1am"
  # implemented as "everything before 5am is tonight. everything after 5 am is tomorrow morning"
  def time_compare(time, otherTime)
    now_as_string = Date.today().strftime()
    dateTime = DateTime.strptime((now_as_string+"T"+time),"%FT%l:%M %p")
    otherDateTime = DateTime.strptime((now_as_string+"T"+otherTime),"%FT%l:%M %p")
    dateTime += sort_factor(dateTime)
    otherDateTime += sort_factor(otherDateTime)
    return dateTime <=> otherDateTime
  end
  
  def sort_factor(dateTime)
    if(dateTime.hour < 5)
      1
    else
      0
    end
  end
  
end
