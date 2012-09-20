class PecFormsController < ApplicationController
  # GET /pec_forms
  # GET /pec_forms.json
  def index
    @pec_forms = PecForm.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pec_forms }
    end
  end

  # GET /pec_forms/1
  # GET /pec_forms/1.json
  def show
    @pec_form = PecForm.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pec_form }
    end
  end

  # GET /pec_forms/new
  # GET /pec_forms/new.json
  def new
    @pec_form = PecForm.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pec_form }
    end
  end

  # GET /pec_forms/1/edit
  def edit
    @pec_form = PecForm.find(params[:id])
  end

  # POST /pec_forms
  # POST /pec_forms.json
  def create
    @pec_form = PecForm.new(params[:pec_form])

    respond_to do |format|
      if @pec_form.save
        format.html { redirect_to @pec_form, notice: 'Pec form was successfully created.' }
        format.json { render json: @pec_form, status: :created, location: @pec_form }
      else
        format.html { render action: "new" }
        format.json { render json: @pec_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pec_forms/1
  # PUT /pec_forms/1.json
  def update
    @pec_form = PecForm.find(params[:id])

    respond_to do |format|
      if @pec_form.update_attributes(params[:pec_form])
        format.html { redirect_to @pec_form, notice: 'Pec form was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @pec_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pec_forms/1
  # DELETE /pec_forms/1.json
  def destroy
    @pec_form = PecForm.find(params[:id])
    @pec_form.destroy

    respond_to do |format|
      format.html { redirect_to pec_forms_url }
      format.json { head :ok }
    end
  end
end