class Votation < ActiveRecord::Base
  attr_accessible :state, :translation_id, :expression_id, :user_id
  
  belongs_to :translation, :inverse_of => :votations
  belongs_to :expression, :inverse_of => :votations   
  belongs_to :user, :inverse_of => :votations
  
  validate :uniqueness_of_vote
  validate :non_creator
  
  def uniqueness_of_vote
    if self.translation_id
      Votation.all.each do |vote|
        if (vote.translation_id == self.translation_id and vote.user_id == self.user_id)
          errors.add(:error, I18n.t(:already_voted))
        end
      end
    end
    
    if self.expression_id
      Votation.all.each do |vote|
        if (vote.expression_id == self.expression_id and vote.user_id == self.user_id)
          errors.add(:error, I18n.t(:already_voted))
        end
      end
    end        
  end
  
  def non_creator    
    if self.translation_id
      element = Translation.find(self.translation_id)
    end
    
    if self.expression_id
      element = Expression.find(self.expression_id)
    end
    
    if(element.user_id == self.user_id)
      errors.add(:error, I18n.t(:you_are_creator))
    end
  end
  
end
