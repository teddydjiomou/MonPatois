class CommentsController < ApplicationController
  load_and_authorize_resource #:except => :show
  
  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html { render :layout => false} # show.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    @comment = Comment.new
    @expression = params[:expression]
    @discussion = params[:discussion]

    respond_to do |format|
      format.html { render :layout => false} # new.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
    @expression = @comment.expression_id
    @discussion = @comment.discussion_id
    
    respond_to do |format|
      format.html { render :layout => false}
    end
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(params[:comment])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to :back }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { redirect_to :back, alert: @comment.errors.full_messages}
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to :back, notice: t(:modification_registered)}
        format.json { head :no_content }
      else
        format.html { redirect_to :back, alert: @comment.errors.full_messages}
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def delete
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to :back, notice: t(:comment_deleted) }
      format.json { head :no_content }
    end
  end
end
