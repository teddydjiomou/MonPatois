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
  
  def discussion_created_email(discussion)
    @discussion = discussion        
    mail(:to => 'thierryvianney@yahoo.fr', :subject => t('discussion_created'))
  end
  
  def contact_us_email(mail, name, message)
    @mail = mail
    @name = name
    @message = message
    mail(:to => 'thierryvianney@yahoo.fr', :subject => t('new_message'))
  end
  
end
