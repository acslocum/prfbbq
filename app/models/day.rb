class Day < ActiveRecord::Base
  has_many :bands
  belongs_to :bbq
end
