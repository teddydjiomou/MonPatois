class Translation < ActiveRecord::Base
  attr_accessible :trans, :word_id, :language_id, :user_id
  
  has_many :votations, :dependent => :destroy
  belongs_to :word, :inverse_of => :translations
  belongs_to :language, :inverse_of => :translations
  belongs_to :user, :inverse_of => :translations
  
  validates_presence_of :trans
  validates_uniqueness_of :trans
  
  def score
    pos_votes = 0
    neg_votes = 0
    self.votations.each do |vote|
      if vote.state == 'positive'
        pos_votes += 1
      end
      if vote.state == 'negative'
        neg_votes += 1
      end
    end
    return pos_votes - neg_votes
  end
end
