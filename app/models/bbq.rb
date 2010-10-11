class Bbq < ActiveRecord::Base
  belongs_to :venue
  has_many :days, :order => "bbq_date ASC"
  
  def event_date_short
    event_date.strftime("%b '%y") if(!event_date.nil?)
  end
  def event_date_usa
    event_date.strftime("%m/%d/%Y") if(!event_date.nil?)
  end
  def full_title
    title || " - " || event_date_usa
  end
  
  def date_range
    (days.first.bbq_date || " - " || days.last.bbq_date) if(!days.empty?)
  end
  
  def event_date
    days.first.bbq_date if(!days.empty?)
  end
  
  def year
    event_date.year
  end
end
