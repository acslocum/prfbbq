class Day < ActiveRecord::Base
  has_many :bands
  belongs_to :bbq
  belongs_to :venue
  
  def long_date
    bbq_date.strftime("%A, %m/%d")
  end
end
