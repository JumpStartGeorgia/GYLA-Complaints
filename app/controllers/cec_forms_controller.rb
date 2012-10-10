class CecFormsController < ApplicationController
  before_filter :authenticate_user!
  # GET /cec_forms
  # GET /cec_forms.json
  def index
    @cec_forms = CecForm.sorted

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cec_forms }
    end
  end

  # GET /cec_forms/1
  # GET /cec_forms/1.json
  def show
    @cec_form = CecForm.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cec_form }
    end
  end

  # GET /cec_forms/new
  # GET /cec_forms/new.json
  def new
    @cec_form = CecForm.new
    gon.edit_cec_form = true

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cec_form }
    end
  end

  # GET /cec_forms/1/edit
  def edit
    @cec_form = CecForm.find(params[:id])
    gon.edit_cec_form = true
  end

  # POST /cec_forms
  # POST /cec_forms.json
  def create

    @cec_form = CecForm.new(params[:cec_form])

    respond_to do |format|
      if @cec_form.save
        format.html { redirect_to cec_forms_path, notice: I18n.t('cec_form.notice.create') }
        format.json { render json: @cec_form, status: :created, location: @cec_form }
      else
		    gon.edit_cec_form = true
        format.html { render action: "new" }
        format.json { render json: @cec_form.errors, status: :unprocessable_entity }
      end
    end

  end

  # PUT /cec_forms/1
  # PUT /cec_forms/1.json
  def update
    @cec_form = CecForm.find(params[:id])

    respond_to do |format|
      if @cec_form.update_attributes(params[:cec_form])
        format.html { redirect_to @cec_form, notice: I18n.t('cec_form.notice.update') }
        format.json { head :ok }
      else
		    gon.edit_cec_form = true
        format.html { render action: "edit" }
        format.json { render json: @cec_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cec_forms/1
  # DELETE /cec_forms/1.json
  def destroy
    @cec_form = CecForm.find(params[:id])
    @cec_form.destroy

    respond_to do |format|
      format.html { redirect_to cec_forms_url }
      format.json { head :ok }
    end
  end
end
