class Word < ActiveRecord::Base
  attr_accessible :english, :french
  
  has_many :translations, :dependent => :destroy
  
  def num_votes
    votes = 0
    self.translations.each do |trans|
      votes += trans.votations.count
    end
    return votes
  end
  
  def get_dictionary(language)
    dictionary = []
    self.translations.each do |trans|
      if trans.language_id == language.id
        dictionary.push(trans)         
      end
    end
    return dictionary    
  end
    
end
