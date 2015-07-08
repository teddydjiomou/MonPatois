class UsersController < ApplicationController
  load_and_authorize_resource :except => :create
  
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    @type = params[:type]
    respond_to do |format|
        format.html { render :layout => false}
      end
  end

  # POST /users
  # POST /users.json
  def create
    if params[:user][:password].eql?(params[:user][:password_confirmation])
        @user = User.new({:name=>params[:user][:name], :mail=>params[:user][:mail], :username=>params[:user][:username], :hashed_password=>Digest::SHA1.hexdigest(params[:user][:password])})
        #password = params[:user][:password]
        #mail = params[:user][:mail]
  
      respond_to do |format|
        if @user.save
          UserMailer.welcome_email(@user).deliver
          format.json { render json: t(:congratulations_can_now_log_in) } #@user, status: :created, location: @user }
        else
          format.json { render json: t(:error_while_registering) } #@user.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.json { render json: t(:Password_must_be_the_same) }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        UserMailer.reset_credentials_email(@user).deliver
        format.html { redirect_to :back, :layout => false, notice: t(:modification_registered)}
        format.json {render inline: "location.reload();" }#{ head :no_content }
      else
        format.html { redirect_to :back, alert: @user.errors.full_messages}
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
  
  def update_password
    @user = current_user #User.find(params[:id])
    
    old_password = params[:user][:old_password]
    new_password = params[:user][:new_password]
    confirm_password = params[:user][:password_confirmation]    
    
    respond_to do |format|
      if new_password == confirm_password and @user.hashed_password == Digest::SHA1.hexdigest(old_password) and @user.update_attributes(:hashed_password=>Digest::SHA1.hexdigest(new_password))#set_password(old_password, new_password, confirm_password)
        UserMailer.reset_credentials_email(@user).deliver
        format.html { redirect_to :back, notice: t(:modification_registered)}
        format.json { head :no_content }
      else
        format.html { redirect_to :back, alert: @user.errors.full_messages}
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end 
  end
  
  def reset_password
    user = params[:id].nil? ? User.where(:mail=>params[:mail]).first : User.find(params[:id])   
        
    respond_to do |format|     
        if user   
          new_password = user.reset_password() 
          if new_password and user.save
            UserMailer.reset_password_email(user, new_password).deliver     
            format.json { render json: t(:check_email) }
            #format.html { redirect_to :back, notice: t(:password_sent) }      
            #format.json { head :no_content }
          else
            #format.html { redirect_to :back, notice: t(:generic_error) }
            format.json { render json: t(:reset_mail_generic_error) }
          end   
        else     
          #format.html { redirect_to :back, notice: t(:user_not_exists) }
          format.json { render json: t(:user_not_exists) }
        end
    end
           
  end
end
