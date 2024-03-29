class DecFormsController < ApplicationController
  before_filter :authenticate_user!
  # GET /dec_forms
  # GET /dec_forms.json
  def index
    @dec_forms = DecForm.sorted

		gon.highlight_first_form_field = false

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
    gon.edit_dec_form = true

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dec_form }
    end
  end

  # GET /dec_forms/1/edit
  def edit
    @dec_form = DecForm.find(params[:id])
    gon.edit_dec_form = true
  end

  # POST /dec_forms
  # POST /dec_forms.json
  def create
    @dec_form = DecForm.new(params[:dec_form])

    respond_to do |format|
      if @dec_form.save
        format.html { redirect_to dec_forms_path, notice: I18n.t('dec_form.notice.create') }
        format.json { render json: @dec_form, status: :created, location: @dec_form }
      else
		    gon.edit_dec_form = true
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
        format.html { redirect_to @dec_form, notice: I18n.t('dec_form.notice.update') }
        format.json { head :ok }
      else
		    gon.edit_dec_form = true
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
