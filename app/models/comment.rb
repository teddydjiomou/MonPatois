class Comment < ActiveRecord::Base
  attr_accessible :text, :user_id, :expression_id, :discussion_id
  
  belongs_to :user, :inverse_of => :comments
  belongs_to :expression, :inverse_of => :comments
  belongs_to :discussion, :inverse_of => :comments
  
  validates_presence_of :text, {message: I18n.t(:text_is_required)}
end
