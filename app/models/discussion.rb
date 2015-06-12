class Discussion < ActiveRecord::Base
  attr_accessible :language_id, :title, :user_id
  
  has_many :comments, :dependent => :destroy
  belongs_to :user, :inverse_of => :expressions
  belongs_to :language, :inverse_of => :expressions
  
  validates_presence_of :title, {message: I18n.t(:title_is_required)}
end
