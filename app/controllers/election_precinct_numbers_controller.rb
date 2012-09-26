class ElectionPrecinctNumbersController < ApplicationController
  before_filter :authenticate_user!
  # GET /election_precinct_numbers
  # GET /election_precinct_numbers.json
  def index
    @election_precinct_numbers = ElectionPrecinctNumber.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @election_precinct_numbers }
    end
  end

  # GET /election_precinct_numbers/1
  # GET /election_precinct_numbers/1.json
  def show
    @election_precinct_number = ElectionPrecinctNumber.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @election_precinct_number }
    end
  end

  # GET /election_precinct_numbers/new
  # GET /election_precinct_numbers/new.json
  def new
    @election_precinct_number = ElectionPrecinctNumber.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @election_precinct_number }
    end
  end

  # GET /election_precinct_numbers/1/edit
  def edit
    @election_precinct_number = ElectionPrecinctNumber.find(params[:id])
  end

  # POST /election_precinct_numbers
  # POST /election_precinct_numbers.json
  def create
    @election_precinct_number = ElectionPrecinctNumber.new(params[:election_precinct_number])

    respond_to do |format|
      if @election_precinct_number.save
        format.html { redirect_to @election_precinct_number, notice: I18n.t('election_precinct_number.notice.create') }
        format.json { render json: @election_precinct_number, status: :created, location: @election_precinct_number }
      else
        format.html { render action: "new" }
        format.json { render json: @election_precinct_number.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /election_precinct_numbers/1
  # PUT /election_precinct_numbers/1.json
  def update
    @election_precinct_number = ElectionPrecinctNumber.find(params[:id])

    respond_to do |format|
      if @election_precinct_number.update_attributes(params[:election_precinct_number])
        format.html { redirect_to @election_precinct_number, notice: I18n.t('election_precinct_number.notice.update') }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @election_precinct_number.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /election_precinct_numbers/1
  # DELETE /election_precinct_numbers/1.json
  def destroy
    @election_precinct_number = ElectionPrecinctNumber.find(params[:id])
    @election_precinct_number.destroy

    respond_to do |format|
      format.html { redirect_to election_precinct_numbers_url }
      format.json { head :ok }
    end
  end
end
