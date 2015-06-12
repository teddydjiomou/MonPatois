class SessionsController < ApplicationController

  # POST /sessions
  # POST /sessions.json
  def new
    
  end
  
  def create
    auth_hash = request.env['omniauth.auth']
    
    @authorization = Authorization.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
    if @authorization
      logged_in_user = @authorization.user
    else
      unless auth_hash["provider"] == "twitter"
        unless (user = User.find_by_mail(auth_hash["info"]["email"]))
          user = User.new :name => auth_hash["info"]["name"], :mail => auth_hash["info"]["email"]
        end
      else
        user = User.new :name => auth_hash["info"]["name"], :mail => auth_hash["info"]["name"].gsub(/\s+/, "")+'@'+auth_hash["info"]["nickname"]+'.com'
      end
      user.authorizations.build :provider => auth_hash["provider"], :uid => auth_hash["uid"]
      #user.save
      
        if user.save
          logged_in_user = user
        else
          respond_to do |format|
            format.json { render json: t(:Error_occur) }
          end
          #redirect_to root_path, notice: t(:Error_occur)
          return false
        end
      #render :text => "Hi #{user.name}! You've signed up."

    end
      session.merge!(logged_in_user.to_session)
        session[:ip_addr] = request.env['REMOTE_ADDR']
        if session[:original_request].nil?
          redirect_to root_url
        else
          original_request=session[:original_request]
          session[:original_request]=nil
          redirect_to(original_request)
        end
      #render :text => "Welcome back #{@authorization.user.name}! You have already signed up."
    
    #render :text => auth_hash.inspect
  end
  
  def create_by_mail
      logged_in_user = User.try_to_login(params[:mail],params[:password])
      if logged_in_user
        session.merge!(logged_in_user.to_session)
        session[:ip_addr] = request.env['REMOTE_ADDR']
        if session[:original_request].nil?
          redirect_to root_url
        else
          original_request=session[:original_request]
          session[:original_request]=nil
          redirect_to(original_request)
        end
      else
        respond_to do |format|
            format.json { render json: t(:wrong_mail_password) }
        end
        #redirect_to root_url, :alert => t(:wrong_mail_password)
      end   
  end
  
  def reset_password
    render 'sessions/reset_password'
  end

  # GET /logout
  def logout
    session[:user_id] = nil
    redirect_to root_url, :notice => t(:loggedout)
  end

end
