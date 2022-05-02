class GroupsController < ApplicationController
  before_action :set_group, only: %i[ show edit update destroy ]
  before_action :set_devices

  # GET /groups or /groups.json
  def index
    @groups = Group.where(account_id: current_account.id)
  end

  # GET /groups/1 or /groups/1.json
  def show
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups or /groups.json
  def create

    @devices = params["devices_ids"]
    
    @group = Group.new(group_params)
    @group.account_id = current_account.id

    @devices.each do |device_id|
      @group.devices << Device.find(device_id)
    end


    respond_to do |format|
      if @group.save
        format.html { redirect_to group_url(@group), notice: "Group was successfully created." }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1 or /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to group_url(@group), notice: "Group was successfully updated." }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1 or /groups/1.json
  def destroy
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_url, notice: "Group was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def group_params
      params.require(:group).permit(:name, :devices_ids, :account_id)
    end

    def set_devices
      @devices = Device.where(account_id: current_account.id)
    end

    def old_create
      @devices = params["devices_ids"]
      result = {}
  
      @devices.each do |device_id|
        @group = Group.new(group_params)
        @group.account_id = current_account.id
        @group.device_id = device_id
        result[device_id] = @group.save
      end
  
      respond_to do |format|
        if result.has_value?(false)
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @group.errors, status: :unprocessable_entity }
        else
          format.html { redirect_to group_url(@group), notice: "Group was successfully created." }
          format.json { render :show, status: :created, location: @group }
  
        end
      end
    end
end