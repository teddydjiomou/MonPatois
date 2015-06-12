class LanguesController < ApplicationController
  # GET /langues
  # GET /langues.json
  def index
    @langues = Langue.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @langues }
    end
  end

  # GET /langues/1
  # GET /langues/1.json
  def show
    @langue = Langue.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @langue }
    end
  end

  # GET /langues/new
  # GET /langues/new.json
  def new
    @langue = Langue.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @langue }
    end
  end

  # GET /langues/1/edit
  def edit
    @langue = Langue.find(params[:id])
  end

  # POST /langues
  # POST /langues.json
  def create
    @langue = Langue.new(params[:langue])

    respond_to do |format|
      if @langue.save
        format.html { redirect_to @langue, notice: 'Langue was successfully created.' }
        format.json { render json: @langue, status: :created, location: @langue }
      else
        format.html { render action: "new" }
        format.json { render json: @langue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /langues/1
  # PUT /langues/1.json
  def update
    @langue = Langue.find(params[:id])

    respond_to do |format|
      if @langue.update_attributes(params[:langue])
        format.html { redirect_to @langue, notice: 'Langue was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @langue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /langues/1
  # DELETE /langues/1.json
  def destroy
    @langue = Langue.find(params[:id])
    @langue.destroy

    respond_to do |format|
      format.html { redirect_to langues_url }
      format.json { head :no_content }
    end
  end
end
