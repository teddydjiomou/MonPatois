class User < ActiveRecord::Base
  attr_accessor :password, :password_confirmation
  attr_accessible :hashed_password, :mail, :name, :username, :role
  validates :password, :presence     => true,
                       :confirmation => true,
                        :length       => { :minimum => 4 },
                        :if           => :password # only validate if password changed!
  #validates_length_of :username, minimum: 2, maximum: 32
  #validates_presence_of :username
  #validates_uniqueness_of :username
  validates_length_of :name, minimum: 2, maximum: 64
  #validates_presence_of :name
  #validates_uniqueness_of :name  
  validates_format_of :mail, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  
  has_many :translations, :inverse_of => :user
  has_many :languages
  has_many :votations, :inverse_of => :user
  has_many :expressions, :inverse_of => :user
  has_many :discussions, :inverse_of => :user
  has_many :comments, :inverse_of => :user
  has_many :authorizations, :inverse_of => :user
  validates :name, :mail, :presence => true
  validates_uniqueness_of :mail
  
  def surname
    return (self.username || self.name)
  end
  
  def self.try_to_login(mail, password)
    hashed_password = Digest::SHA1.hexdigest(password || "")
    User.where(:mail=>mail, :hashed_password=>hashed_password).first
  end

  def to_session
    {:user_id => self.id, :first_interaction => Time.now, :last_interaction => Time.now, :mail => self.mail}
  end     
  
  def is_admin?
    if self.role == "admin"
      return true
    else
      return false
    end
  end
  
  def level
    score = self.votations.count + self.languages.count*2 + self.translations.count*4 + self.expressions.count*8 + self.feedback
    if score < 200
      return I18n.t(:villager)
    elsif score < 400
      return I18n.t(:householder)
    elsif score < 700
      return I18n.t(:notable)
    elsif score < 1100
      return I18n.t(:head_of_village)
    else return I18n.t(:linguist)
      
    end 
    
  end
  
  def votations_received
    votes = 0
    self.translations.each do |trans|
      votes += trans.votations.count
    end
    self.expressions.each do |exp|
      votes += exp.votations.count
    end
    
    return votes
  end
  
  def feedback
    score = 0
    
    self.translations.each do |trans|
      score += trans.score      
    end
    self.expressions.each do |exp|
      score += exp.score      
    end
    return score
  end
  
  def reset_password
    #setta anche l'attr password, che serve per il mailer
    begin
      self.password = Array.new(8){[*'0'..'9', *'a'..'z', *'A'..'Z'].sample}.join
      self.hashed_password = Digest::SHA1.hexdigest(self.password || "")
    end while User.where(:hashed_password=>self.hashed_password).exists?
    return self.password
  end
  
  #def num_votes
  #  votes = 0
  #  self.translations.each do |trans|
  #    votes += trans.votations.count
  #  end
  #  return votes
  #end
    
end
