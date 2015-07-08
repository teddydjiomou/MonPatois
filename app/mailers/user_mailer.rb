class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def welcome_email(user)
    @user = user
    pipo = @user.password 
    mail(:to => user.mail, :subject => t('welcome_mail'))
  end
  
  def reset_credentials_email(user)
    @user = user    
    mail(:to => user.mail, :subject => t('credentials_resetted'))
  end
  
  def reset_password_email(user, new_password)
    @user = user    
    @new_password = new_password
    mail(:to => user.mail, :subject => t('password_resetted'))
  end
  
  def language_created_email(language)
    @language = language        
    mail(:to => 'thierryvianney@yahoo.fr', :subject => t('language_created'))
  end
end
