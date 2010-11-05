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
    start_date.year
  end
  
  def short_name
    title[0,3]
  end
  
  def self.find_by_permalink(a_year, a_month, a_day)
    a_date = Date.civil(a_year,a_month,a_day)
    find(:first, :conditions => ["days.bbq_date == ?", a_date], :joins => "inner join days on bbqs.id = days.bbq_id")
  end
  
  def self.find_present_bbqs
    find(:all, :conditions => ["days.bbq_date >= ?", Date.today], :joins => "inner join days on bbqs.id = days.bbq_id").uniq
  end
      
  def self.find_past_bbqs
    find(:all, :conditions => ["days.bbq_date < ?", Date.today], :joins => "inner join days on bbqs.id = days.bbq_id").uniq
  end
      
end
