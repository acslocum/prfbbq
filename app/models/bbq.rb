class Bbq < ActiveRecord::Base
  belongs_to :venue
  has_and_belongs_to_many :bands
end
