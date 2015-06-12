class MotsController < ApplicationController
  # GET /mots
  # GET /mots.json
  def index
    @mots = Mot.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mots }
    end
  end

  # GET /mots/1
  # GET /mots/1.json
  def show
    @mot = Mot.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mot }
    end
  end

  # GET /mots/new
  # GET /mots/new.json
  def new
    @mot = Mot.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mot }
    end
  end

  # GET /mots/1/edit
  def edit
    @mot = Mot.find(params[:id])
  end

  # POST /mots
  # POST /mots.json
  def create
    @mot = Mot.new(params[:mot])

    respond_to do |format|
      if @mot.save
        format.html { redirect_to @mot, notice: 'Mot was successfully created.' }
        format.json { render json: @mot, status: :created, location: @mot }
      else
        format.html { render action: "new" }
        format.json { render json: @mot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mots/1
  # PUT /mots/1.json
  def update
    @mot = Mot.find(params[:id])

    respond_to do |format|
      if @mot.update_attributes(params[:mot])
        format.html { redirect_to @mot, notice: 'Mot was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mots/1
  # DELETE /mots/1.json
  def destroy
    @mot = Mot.find(params[:id])
    @mot.destroy

    respond_to do |format|
      format.html { redirect_to mots_url }
      format.json { head :no_content }
    end
  end
end
