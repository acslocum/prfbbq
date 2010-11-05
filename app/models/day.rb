class Day < ActiveRecord::Base
  has_many :bands
  belongs_to :bbq
  belongs_to :venue
  
  def long_date
    bbq_date.strftime("%A, %m/%d")
  end
  
  def year
    bbq_date.year
  end
  
  def month
    bbq_date.month
  end
  
  def day
    bbq_date.day
  end
end
