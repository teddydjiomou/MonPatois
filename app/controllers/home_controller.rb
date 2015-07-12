class HomeController < ApplicationController
  
  def index
    
  end
  
  def contact_form
    respond_to do |format|
      format.html { render :layout => false} 
    end
  end
  
  def contact_us
    mail = params[:mail]
    name = params[:name]
    message = params[:message]
    
    respond_to do |format|
      if mail.nil? or name.nil? or message.nil? or mail.empty? or name.empty? or message.empty?
        format.json { render json: t(:please_fill_all_data) }        
      else
        UserMailer.contact_us_email(mail, name, message).deliver
        format.json { render json: t(:thanks_for_contact) }
      end
    end        
  end
end
