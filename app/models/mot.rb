class Mot < ActiveRecord::Base
  
  attr_accessible :francais, :patois, :commentaire, :anglais
  
  belongs_to :langue
  
  validates_presence_of :patois
  validates :francais_ou_anglais
  
  def francais_ou_anglais
    if francais.blank? and anglais.blank?
      errors.add_to_base("La traduction en Francais ou en Anglais est requise")
    end
  end
end
