class ComplaintsController < ApplicationController
  before_filter :authenticate_user!
  # GET /complaints
  # GET /complaints.json
  def index
    @complaints = Complaint.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @complaints }
    end
  end

  # GET /complaints/1
  # GET /complaints/1.json
  def show
    @complaint = Complaint.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @complaint }
    end
  end

  # GET /complaints/new
  # GET /complaints/new.json
  def new
    @complaint = Complaint.new
		# create an empty additional info model
		@complaint.complaint_additional_infos.build

		# to initialize the datetime fields
    gon.edit_complaint = true

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @complaint }
    end
  end

  # GET /complaints/1/edit
  def edit
    @complaint = Complaint.find(params[:id])

    @level_editable = false

		# to initialize the datetime fields
    gon.edit_complaint = true
    info2 = @complaint.additional.latest
		gon.violation_time = @complaint.violation_time.strftime('%m/%d/%Y %H:%M') if @complaint.violation_time

  end

  # POST /complaints
  # POST /complaints.json
  def create

    @complaint = Complaint.new(params[:complaint])
logger.debug "------- add info records = #{params[:complaint][:complaint_additional_infos_attributes]}"


    respond_to do |format|
      if @complaint.save
        format.html { redirect_to @complaint, notice: I18n.t('complaints.notice.create') }
        format.json { render json: @complaint, status: :created, location: @complaint }
      else
				# to initialize the datetime fields
				gon.edit_complaint = true
				gon.violation_time = @complaint.violation_time.strftime('%m/%d/%Y %H:%M') if @complaint.violation_time

        format.html { render action: "new" }
        format.json { render json: @complaint.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /complaints/1
  # PUT /complaints/1.json
  def update
    @complaint = Complaint.find(params[:id])

    respond_to do |format|
      if @complaint.update_attributes(params[:complaint])
        format.html { redirect_to @complaint, notice: I18n.t('complaints.notice.update') }
        format.json { head :ok }
      else
				# to initialize the datetime fields
				gon.edit_complaint = true
				gon.violation_time = @complaint.violation_time.strftime('%m/%d/%Y %H:%M') if @complaint.violation_time

        format.html { render action: "edit" }
        format.json { render json: @complaint.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /complaints/1
  # DELETE /complaints/1.json
  def destroy
    @complaint = Complaint.find(params[:id])
    @complaint.destroy

    respond_to do |format|
      format.html { redirect_to complaints_url }
      format.json { head :ok }
    end
  end


  def unlink
    c = ComplaintFile.find(params[:file_id])
    c.file = nil
    c.save
    c.delete
    respond_to do |format|
      format.html { render json: true }
      format.json { render json: true }
    end
  end


  def move_to_higher_level
    c = Complaint.find(params[:id])

    case c.level.downcase
    when 'pec'
      c.level = 'dec'
    when 'dec'
      c.level = 'cec'
    when 'cec'
      c.level = 'court'
    when 'court'
      redirect_to c, :alert => 'Complaint has highest level possible'
    else
      c.level = 'pec'
    end

    c.save

    redirect_to c
  end

end
