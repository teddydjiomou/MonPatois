class LanguagesController < ApplicationController
  #before_filter :authorize, :except => [:show]
  load_and_authorize_resource :except => [:show, :create_votation]
  # GET /languages
  # GET /languages.json
  def index
    @languages = Language.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @languages }
    end
  end

  # GET /languages/1
  # GET /languages/1.json
  def show
    @language = Language.find(params[:id])

    respond_to do |format|
      format.html {render 'show_lexique'}# show.html.erb
      format.json { render json: @language }
    end
  end

  # GET /languages/new
  # GET /languages/new.json
  def new
    @language = Language.new
    if @language.user_id
      @user = @language.user_id
    else
      @user = current_user.id
    end

    respond_to do |format|
      format.html { render :layout => false}# new.html.erb
      format.json { render json: @language }
    end
  end

  # GET /languages/1/edit
  def edit
    @language = Language.find(params[:id])
    
    respond_to do |format|
      format.html { render :layout => false}
    end
  end

  # POST /languages
  # POST /languages.json
  def create
    @language = Language.new(params[:language])
    if current_user.is_admin?
      @language.verify = 'true'
    end

    respond_to do |format|
      if @language.save
        UserMailer.language_created_email(@language).deliver
        format.html { redirect_to :back, notice: t(:thanks_for_your_contribution_wait_verifying) }
        format.json { render json: @language, status: :created, location: @language }
      else
        format.html { redirect_to :back, alert: @language.errors.full_messages }
        format.json { render json: @language.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /languages/1
  # PUT /languages/1.json
  def update
    @language = Language.find(params[:id])

    respond_to do |format|
      if @language.update_attributes(params[:language])
        format.html { redirect_to :back, notice: t(:modification_registered) }
        format.json { head :no_content }
      else
        format.html { redirect_to :back, alert: @language.errors }
        format.json { render json: @language.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /languages/1
  # DELETE /languages/1.json
  def delete
    @language = Language.find(params[:id])
    @language.destroy

    respond_to do |format|
      format.html { redirect_to root_url, notice: t(:language_deleted) }
      format.json { head :no_content }
    end
  end
  
  def load_dictionary
    num = 100
    @page = params[:page] || '1'
    @letter = params[:letter]
    @language = Language.where('name = ?', params[:language]).first
    all_words = Word.all :conditions => ['substr(french,1,1) = ?', params[:letter]]
    all_words = all_words.sort_by!{ |m| m.french.downcase }
    @words = all_words[(@page.to_i-1)*num..(@page.to_i*num-1)]
    @num_pages = (all_words.count/num+1).ceil.to_s
    if all_words.count%num
      @num_pages = (all_words.count/num+1).ceil.to_s
    end
      
    respond_to do |format|
      format.html { render :layout => false} #action: "dictionary" }
      #format.json { render json: @language }
    end
  end
  
  def load_expressions
    num = 100
    @page = params[:page] || '1'
    @language = Language.where('name = ?', params[:language]).first
    all_expressions = @language.expressions
    @expressions = all_expressions[(@page.to_i-1)*num..(@page.to_i*num-1)]
    @num_pages = (all_expressions.count/num+1).ceil.to_s
    if all_expressions.count%num
      @num_pages = (all_expressions.count/num+1).ceil.to_s
    end
    
    respond_to do |format|
      format.html { render :layout => false} 
      #format.json { render json: @language }
    end
  end
  
  def load_discussions
    num = 100
    @page = params[:page] || '1'
    @language = Language.where('name = ?', params[:language]).first
    all_discussions = @language.discussions
    @discussions = all_discussions[(@page.to_i-1)*num..(@page.to_i*num-1)]
    @num_pages = (all_discussions.count/num+1).ceil.to_s
    if all_discussions.count%num
      @num_pages = (all_discussions.count/num+1).ceil.to_s
    end
    
    respond_to do |format|
      format.html { render :layout => false} 
      #format.json { render json: @language }
    end
  end
  
  def create_votation
    @votation = Votation.new#(params[:votation])
    if current_user
      @votation.user_id = current_user.id
      @votation.translation_id = params[:translation]
      @votation.expression_id = params[:expression]
      @votation.state = params[:state]
      unless @votation.save    
        respond_to do |format|
          format.json { render json: @votation.errors[:error].first }
        end
      end
    else
      respond_to do |format|
        format.json { render json: t(:must_be_logged_in_to_vote) }
      end
    end
  end
  
end
