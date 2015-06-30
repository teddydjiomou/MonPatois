class Language < ActiveRecord::Base
  attr_accessible :description, :name, :origin, :verify, :user_id
  
  has_many :translations, :dependent => :destroy
  has_many :expressions, :dependent => :destroy
  has_many :discussions, :dependent => :destroy
  belongs_to :user, :inverse_of => :languages
  
  validates_presence_of :name, {message: I18n.t(:name_is_required)}
  validates_presence_of :origin, {message: I18n.t(:origin_is_required)}
  validates_uniqueness_of :name
  
  def verify?
    if self.verify == 'true'
      return true
    else
      return false
    end
  end
end
