class DevicesController < ApplicationController
  before_action :set_device, only: %i[ show edit update destroy ]

  # GET /devices or /devices.json
  def index
    @devices = Device.where(account_id: current_account.id)
  end

  # GET /devices/1 or /devices/1.json
  def show
  end

  # GET /devices/new
  def new
    @device = Device.new
  end

  # GET /devices/1/edit
  def edit
  end

  # POST /devices or /devices.json
  def create
    @user = current_account
    @device = Device.new(device_params)

    @device.account_id = @user.id
    @device.trigger_id = Trigger.find(2).id
    

    #<Device id: nil, name: "Teste", ip: "", created_at: nil, updated_at: nil, messaging_addr: nil, account_id: nil, trigger_id: nil>

    respond_to do |format|
      if @device.save
        format.html { redirect_to device_url(@device), notice: "Device was successfully created." }
        format.json { render :show, status: :created, location: @device }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /devices/1 or /devices/1.json
  def update
    respond_to do |format|
      if @device.update(device_params)
        format.html { redirect_to device_url(@device), notice: "Device was successfully updated." }
        format.json { render :show, status: :ok, location: @device }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /devices/1 or /devices/1.json
  def destroy
    @device.destroy

    respond_to do |format|
      format.html { redirect_to devices_url, notice: "Device was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device
      @device = Device.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def device_params
      params.require(:device).permit(:name, :ip)
    end
end
