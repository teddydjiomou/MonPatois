class VotationController < ApplicationController
  load_and_authorize_resource
  
  def new
    @votation = Votation.new
    #@word = Word.find(params[:word]).french
    #@language = Language.find(params[:language]).name
    respond_to do |format|
      format.html { render :nothing} # new.html.erb
      #format.json { render json: @translation }
    end
  end

  def create
    @votation = Votation.new#(params[:votation])
    if current_user
      @votation.user_id = current_user.id
      @votation.translation_id = params[:translation]
      @votation.expression_id = params[:expression]
      @votation.state = params[:state]
      unless @votation.save    
        respond_to do |format|
          format.json { render json: @votation.errors[:error] }
        end
      end
    else
      respond_to do |format|
        format.json { render json: t(:must_be_logged_in_to_vote) }
      end
    end
    
  end
end
