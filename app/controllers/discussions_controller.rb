class DiscussionsController < ApplicationController
  #before_filter :set_discussion, only: [:show, :edit, :update, :destroy]

  #respond_to :html
  
  load_and_authorize_resource :except => :index

  def index_ori
    @discussions = Discussion.all
    #respond_with(@discussions)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @discussions }
    end
  end
  
  def index
    num = 100
    @page = params[:page] || '1'
    @language = Language.find(params[:language])
    all_discussions = @language.discussions
    @discussions = all_discussions[(@page.to_i-1)*num..(@page.to_i*num-1)]
    @num_pages = (all_discussions.count/num+1).ceil.to_s
    if all_discussions.count%num
      @num_pages = (all_discussions.count/num+1).ceil.to_s
    end
    
    respond_to do |format|
      format.html #{ render :layout => false} 
      #format.json { render json: @language }
    end
  end

  def show
    #respond_with(@discussion)
    @discussion = Discussion.find(params[:id])

    respond_to do |format|
      format.html { render :layout => false} # show.html.erb
      format.json { render json: @discussion }
    end
  end

  def new
    @discussion = Discussion.new
    @language = params[:language]
    respond_to do |format|
      format.html { render :layout => false} # new.html.erb
      format.json { render json: @discussion }
    end
  end

  def edit
    @discussion = Discussion.find(params[:id])
    @language = @discussion.language_id    
    respond_to do |format|
      format.html { render :layout => false}
    end
  end
  
  def create
    @discussion = Discussion.new(params[:discussion])

    respond_to do |format|
      if @discussion.save
        format.html { redirect_to :back }
        format.json { render json: @discussion, status: :created, location: @discussion }
      else
        format.html { redirect_to :back, alert: @discussion.errors.full_messages}
        format.json { render json: @discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
    #@discussion = Discussion.new(params[:discussion])
    #@discussion.save
    #respond_with(@discussion)
    @discussion = Discussion.find(params[:id])
    @discussion.destroy

    respond_to do |format|
      format.html { redirect_to :back, notice: t(:discussion_deleted) }
      format.json { head :no_content }
    end
  end

  def update
    #@discussion.update_attributes(params[:discussion])
    #respond_with(@discussion)
    @discussion = Discussion.find(params[:id])

    respond_to do |format|
      if @discussion.update_attributes(params[:discussion])
        format.html { redirect_to :back, notice: t(:modification_registered)}
        format.json { head :no_content }
      else
        format.html { redirect_to :back, alert: @discussion.errors.full_messages}
        format.json { render json: @discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  #def destroy
   # @discussion.destroy
    #respond_with(@discussion)
  #end

  #private
  #  def set_discussion
  #    @discussion = Discussion.find(params[:id])
  #  end
end
