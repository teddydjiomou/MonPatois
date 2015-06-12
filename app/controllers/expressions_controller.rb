class ExpressionsController < ApplicationController
  load_and_authorize_resource
  
  # GET /expressions
  # GET /expressions.json
  def index
    @expressions = Expression.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @expressions }
    end
  end

  # GET /expressions/1
  # GET /expressions/1.json
  def show
    @expression = Expression.find(params[:id])

    respond_to do |format|
      format.html { render :layout => false} # show.html.erb
      format.json { render json: @expression }
    end
  end

  # GET /expressions/new
  # GET /expressions/new.json
  def new
    @expression = Expression.new
    @language = params[:language]
    respond_to do |format|
      format.html { render :layout => false} # new.html.erb
      format.json { render json: @expression }
    end
  end

  # GET /expressions/1/edit
  def edit
    @expression = Expression.find(params[:id])
    @language = @expression.language_id    
    respond_to do |format|
      format.html { render :layout => false}
    end
  end

  # POST /expressions
  # POST /expressions.json
  def create
    @expression = Expression.new(params[:expression])

    respond_to do |format|
      if @expression.save
        format.html { redirect_to :back, notice: t(:thanks_for_your_contribution) }
        format.json { render json: @expression, status: :created, location: @expression }
      else
        format.html { redirect_to :back, alert: @expression.errors.full_messages}
        format.json { render json: @expression.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /expressions/1
  # PUT /expressions/1.json
  def update
    @expression = Expression.find(params[:id])

    respond_to do |format|
      if @expression.update_attributes(params[:expression])
        format.html { redirect_to :back, notice: t(:modification_registered)}
        format.json { head :no_content }
      else
        format.html { redirect_to :back, alert: @expression.errors.full_messages}
        format.json { render json: @expression.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expressions/1
  # DELETE /expressions/1.json
  def delete
    @expression = Expression.find(params[:id])
    @expression.destroy

    respond_to do |format|
      format.html { redirect_to :back, notice: t(:expression_deleted) }
      format.json { head :no_content }
    end
  end
end
