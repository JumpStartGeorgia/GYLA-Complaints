class ElectionDistrictNamesController < ApplicationController
  before_filter :authenticate_user!
  # GET /election_district_names
  # GET /election_district_names.json
  def index
    @election_district_names = ElectionDistrictName.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @election_district_names }
    end
  end

  # GET /election_district_names/1
  # GET /election_district_names/1.json
  def show
    @election_district_name = ElectionDistrictName.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @election_district_name }
    end
  end

  # GET /election_district_names/new
  # GET /election_district_names/new.json
  def new
    @election_district_name = ElectionDistrictName.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @election_district_name }
    end
  end

  # GET /election_district_names/1/edit
  def edit
    @election_district_name = ElectionDistrictName.find(params[:id])
  end

  # POST /election_district_names
  # POST /election_district_names.json
  def create
    @election_district_name = ElectionDistrictName.new(params[:election_district_name])

    respond_to do |format|
      if @election_district_name.save
        format.html { redirect_to @election_district_name, notice: 'Election district name was successfully created.' }
        format.json { render json: @election_district_name, status: :created, location: @election_district_name }
      else
        format.html { render action: "new" }
        format.json { render json: @election_district_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /election_district_names/1
  # PUT /election_district_names/1.json
  def update
    @election_district_name = ElectionDistrictName.find(params[:id])

    respond_to do |format|
      if @election_district_name.update_attributes(params[:election_district_name])
        format.html { redirect_to @election_district_name, notice: 'Election district name was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @election_district_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /election_district_names/1
  # DELETE /election_district_names/1.json
  def destroy
    @election_district_name = ElectionDistrictName.find(params[:id])
    @election_district_name.destroy

    respond_to do |format|
      format.html { redirect_to election_district_names_url }
      format.json { head :ok }
    end
  end
end
