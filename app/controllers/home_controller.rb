class HomeController < ApplicationController
  
  def index
    
  end
  
  def search
    @string = params[:search_string][:attr]
    @words = Word.where("french like ?", "%#{@string}%")
    @words += Word.where("english like ?", "%#{@string}%")
    
    @translations = Translation.where("trans like ?", "%#{@string}%")
    
    @expressions = Expression.where("french like ?", "%#{@string}%")
    @expressions += Expression.where("english like ?", "%#{@string}%")
    @expressions += Expression.where("trans like ?", "%#{@string}%")
    
    @languages = Language.where("name like ?", "%#{@string}%")
    
    respond_to do |format|
      format.html #{ render :layout => false} 
    end
  end
  
  def contact_form
    respond_to do |format|
      format.html { render :layout => false} 
    end
  end
  
  def invite_friend_form
        respond_to do |format|
      format.html { render :layout => false} 
    end
  end
  
  def login_form
        respond_to do |format|
      format.html { render :layout => false} 
    end
  end
  
  def register_form
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
  
  def invite
    mail = params[:mail]
    name = params[:name]
    inviter = current_user.name
    url = root_url
    #message = params[:message]
    
    respond_to do |format|
      #if mail.nil? or name.nil? or message.nil? or mail.empty? or name.empty? or message.empty?
      if mail.nil? or name.nil? or mail.empty? or name.empty?
        format.json { render json: t(:please_fill_all_data) }        
      else
        UserMailer.invite_friend_email(mail, name, inviter, url).deliver
        format.json { render json: t(:invitation_sent) }
      end
    end        
  end
  
end
