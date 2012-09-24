class DecFormsController < ApplicationController
  before_filter :authenticate_user!
  # GET /dec_forms
  # GET /dec_forms.json
  def index
    @dec_forms = DecForm.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dec_forms }
    end
  end

  # GET /dec_forms/1
  # GET /dec_forms/1.json
  def show
    @dec_form = DecForm.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dec_form }
    end
  end

  # GET /dec_forms/new
  # GET /dec_forms/new.json
  def new
    @dec_form = DecForm.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dec_form }
    end
  end

  # GET /dec_forms/1/edit
  def edit
    @dec_form = DecForm.find(params[:id])
  end

  # POST /dec_forms
  # POST /dec_forms.json
  def create
    @dec_form = DecForm.new(params[:dec_form])
 
    respond_to do |format|
      if @dec_form.save
        format.html { redirect_to dec_forms_path, notice: 'Dec form was successfully created.' }
        format.json { render json: @dec_form, status: :created, location: @dec_form }
      else
        format.html { render action: "new" }
        format.json { render json: @dec_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /dec_forms/1
  # PUT /dec_forms/1.json
  def update
    @dec_form = DecForm.find(params[:id])

    respond_to do |format|
      if @dec_form.update_attributes(params[:dec_form])
        format.html { redirect_to @dec_form, notice: 'Dec form was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @dec_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dec_forms/1
  # DELETE /dec_forms/1.json
  def destroy
    @dec_form = DecForm.find(params[:id])
    @dec_form.destroy

    respond_to do |format|
      format.html { redirect_to dec_forms_url }
      format.json { head :ok }
    end
  end
end
