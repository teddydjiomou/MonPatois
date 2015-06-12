class AnglaisController < ApplicationController
  # GET /anglais
  # GET /anglais.json
  def index
    @anglais = Anglai.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @anglais }
    end
  end

  # GET /anglais/1
  # GET /anglais/1.json
  def show
    @anglai = Anglai.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @anglai }
    end
  end

  # GET /anglais/new
  # GET /anglais/new.json
  def new
    @anglai = Anglai.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @anglai }
    end
  end

  # GET /anglais/1/edit
  def edit
    @anglai = Anglai.find(params[:id])
  end

  # POST /anglais
  # POST /anglais.json
  def create
    @anglai = Anglai.new(params[:anglai])

    respond_to do |format|
      if @anglai.save
        format.html { redirect_to @anglai, notice: 'Anglai was successfully created.' }
        format.json { render json: @anglai, status: :created, location: @anglai }
      else
        format.html { render action: "new" }
        format.json { render json: @anglai.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /anglais/1
  # PUT /anglais/1.json
  def update
    @anglai = Anglai.find(params[:id])

    respond_to do |format|
      if @anglai.update_attributes(params[:anglai])
        format.html { redirect_to @anglai, notice: 'Anglai was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @anglai.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /anglais/1
  # DELETE /anglais/1.json
  def destroy
    @anglai = Anglai.find(params[:id])
    @anglai.destroy

    respond_to do |format|
      format.html { redirect_to anglais_url }
      format.json { head :no_content }
    end
  end
end
