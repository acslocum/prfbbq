class Bbq < ActiveRecord::Base
  belongs_to :venue
  has_and_belongs_to_many :bands
  
  def event_date_short
    event_date.strftime("%b '%y")
  end
  def event_date_usa
    event_date.strftime("%m/%d/%Y")
  end
  def full_title
    title + " - " + event_date_usa
  end
  
end
