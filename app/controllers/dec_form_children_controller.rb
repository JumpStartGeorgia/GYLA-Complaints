class DecFormChildrenController < ApplicationController
  # GET /dec_form_children
  # GET /dec_form_children.json
  def index
    @dec_form_children = DecFormChild.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dec_form_children }
    end
  end

  # GET /dec_form_children/1
  # GET /dec_form_children/1.json
  def show
    @dec_form_child = DecFormChild.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dec_form_child }
    end
  end

  # GET /dec_form_children/new
  # GET /dec_form_children/new.json
  def new
    @dec_form_child = DecFormChild.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dec_form_child }
    end
  end

  # GET /dec_form_children/1/edit
  def edit
    @dec_form_child = DecFormChild.find(params[:id])
  end

  # POST /dec_form_children
  # POST /dec_form_children.json
  def create
    @dec_form_child = DecFormChild.new(params[:dec_form_child])

    respond_to do |format|
      if @dec_form_child.save
        format.html { redirect_to @dec_form_child, notice: 'Dec form child was successfully created.' }
        format.json { render json: @dec_form_child, status: :created, location: @dec_form_child }
      else
        format.html { render action: "new" }
        format.json { render json: @dec_form_child.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /dec_form_children/1
  # PUT /dec_form_children/1.json
  def update
    @dec_form_child = DecFormChild.find(params[:id])

    respond_to do |format|
      if @dec_form_child.update_attributes(params[:dec_form_child])
        format.html { redirect_to @dec_form_child, notice: 'Dec form child was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @dec_form_child.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dec_form_children/1
  # DELETE /dec_form_children/1.json
  def destroy
    @dec_form_child = DecFormChild.find(params[:id])
    @dec_form_child.destroy

    respond_to do |format|
      format.html { redirect_to dec_form_children_url }
      format.json { head :ok }
    end
  end
end
