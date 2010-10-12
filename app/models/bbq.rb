class Bbq < ActiveRecord::Base
  belongs_to :venue
  has_many :days, :order => "bbq_date ASC"
  attr_accessor :start_date
  attr_accessor :end_date
  
  def event_date_short
    event_date.strftime("%b '%y") if(!event_date.nil?)
  end
  def event_date_usa
    event_date.strftime("%m/%d/%Y") if(!event_date.nil?)
  end
  def full_title
    title + " : " + date_range
  end
  
  def date_range
    (start_date.to_s + " - " + end_date.to_s) if(!days.empty?)
  end
  
  def start_date
    days.first.bbq_date if(!days.empty?)
  end
  
  def end_date
    days.last.bbq_date if(!days.empty?)
  end
  
  def year
    event_date.year
  end
  
  def permalink
    event_date.strftime("%Y/%m/%d") + "/" + short_name
  end
  
  def short_name
    title[0,3]
  end
  
  def self.find_by_permalink(a_year, a_month, a_day, a_title)
    find(:first,:conditions => ["lower(title) like ? and ","%"<<a_title<<"%"])
  end
      
end
