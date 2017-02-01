class Condition < ActiveRecord::Base

  has_many :trips

  validates_presence_of :date

end
