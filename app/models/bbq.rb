class Bbq < ActiveRecord::Base
  belongs_to :venue
  has_many :bands, :order => "sort_order ASC, id ASC"
  
  def event_date_short
    event_date.strftime("%b '%y")
  end
  def event_date_usa
    event_date.strftime("%m/%d/%Y")
  end
  def full_title
    title + " - " + event_date_usa
  end
  
  def year
    event_date.year
  end
end
