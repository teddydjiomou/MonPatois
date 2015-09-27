class Expression < ActiveRecord::Base
  attr_accessible :english, :french, :trans, :user_id, :language_id
  
  has_many :votations, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  belongs_to :user, :inverse_of => :expressions
  belongs_to :language, :inverse_of => :expressions
  
  validates_presence_of :trans
  validates_uniqueness_of :trans
  validate :english_or_french
  
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
  
  def english_or_french
    if self.french.nil? and self.english.nil?
      errors.add(:englih_or_french, I18n.t(:insert_englih_or_french))
    end
  end
  
end
