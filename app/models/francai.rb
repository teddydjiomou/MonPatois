class Francai < ActiveRecord::Base
  
  attr_accessible :mot
  
  validates_presence_of :mot
  validates_uniqueness_of :mot
end
