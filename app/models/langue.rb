class Langue < ActiveRecord::Base
  attr_accessible :nome, :description, :origine
  
  has_many :expressions, :inverse_of => :langue
  has_many :mots, :inverse_of => :langue
  
  validates_presence_of :nome, :description, :origine
  validates :nome, :uniqueness => {:case_sensitive => false}
end
