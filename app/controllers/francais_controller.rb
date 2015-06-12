class FrancaisController < ApplicationController
  # GET /francais
  # GET /francais.json
  def index
    @francais = Francai.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @francais }
    end
  end

  # GET /francais/1
  # GET /francais/1.json
  def show
    @francai = Francai.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @francai }
    end
  end

  # GET /francais/new
  # GET /francais/new.json
  def new
    @francai = Francai.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @francai }
    end
  end

  # GET /francais/1/edit
  def edit
    @francai = Francai.find(params[:id])
  end

  # POST /francais
  # POST /francais.json
  def create
    @francai = Francai.new(params[:francai])

    respond_to do |format|
      if @francai.save
        format.html { redirect_to @francai, notice: 'Francai was successfully created.' }
        format.json { render json: @francai, status: :created, location: @francai }
      else
        format.html { render action: "new" }
        format.json { render json: @francai.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /francais/1
  # PUT /francais/1.json
  def update
    @francai = Francai.find(params[:id])

    respond_to do |format|
      if @francai.update_attributes(params[:francai])
        format.html { redirect_to @francai, notice: 'Francai was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @francai.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /francais/1
  # DELETE /francais/1.json
  def destroy
    @francai = Francai.find(params[:id])
    @francai.destroy

    respond_to do |format|
      format.html { redirect_to francais_url }
      format.json { head :no_content }
    end
  end
end
