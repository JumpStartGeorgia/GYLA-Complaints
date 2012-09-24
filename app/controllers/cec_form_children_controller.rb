class CecFormChildrenController < ApplicationController
  before_filter :authenticate_user!
  # GET /cec_form_children
  # GET /cec_form_children.json
  def index
    @cec_form_children = CecFormChild.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cec_form_children }
    end
  end

  # GET /cec_form_children/1
  # GET /cec_form_children/1.json
  def show
    @cec_form_child = CecFormChild.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cec_form_child }
    end
  end

  # GET /cec_form_children/new
  # GET /cec_form_children/new.json
  def new
    @cec_form_child = CecFormChild.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cec_form_child }
    end
  end

  # GET /cec_form_children/1/edit
  def edit
    @cec_form_child = CecFormChild.find(params[:id])
  end

  # POST /cec_form_children
  # POST /cec_form_children.json
  def create
    @cec_form_child = CecFormChild.new(params[:cec_form_child])

    respond_to do |format|
      if @cec_form_child.save
        format.html { redirect_to @cec_form_child, notice: 'Cec form child was successfully created.' }
        format.json { render json: @cec_form_child, status: :created, location: @cec_form_child }
      else
        format.html { render action: "new" }
        format.json { render json: @cec_form_child.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cec_form_children/1
  # PUT /cec_form_children/1.json
  def update
    @cec_form_child = CecFormChild.find(params[:id])

    respond_to do |format|
      if @cec_form_child.update_attributes(params[:cec_form_child])
        format.html { redirect_to @cec_form_child, notice: 'Cec form child was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @cec_form_child.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cec_form_children/1
  # DELETE /cec_form_children/1.json
  def destroy
    @cec_form_child = CecFormChild.find(params[:id])
    @cec_form_child.destroy

    respond_to do |format|
      format.html { redirect_to cec_form_children_url }
      format.json { head :ok }
    end
  end
end
