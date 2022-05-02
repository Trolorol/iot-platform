class SchedulingsController < ApplicationController
  before_action :set_scheduling, only: %i[ show edit update destroy ]

  # GET /schedulings or /schedulings.json
  def index
    @schedulings = Scheduling.all
  end

  # GET /schedulings/1 or /schedulings/1.json
  def show
  end

  # GET /schedulings/new
  def new
    @scheduling = Scheduling.new
  end

  # GET /schedulings/1/edit
  def edit
  end

  # POST /schedulings or /schedulings.json
  def create
    @scheduling = Scheduling.new(scheduling_params)

    respond_to do |format|
      if @scheduling.save
        format.html { redirect_to scheduling_url(@scheduling), notice: "Scheduling was successfully created." }
        format.json { render :show, status: :created, location: @scheduling }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @scheduling.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schedulings/1 or /schedulings/1.json
  def update
    respond_to do |format|
      if @scheduling.update(scheduling_params)
        format.html { redirect_to scheduling_url(@scheduling), notice: "Scheduling was successfully updated." }
        format.json { render :show, status: :ok, location: @scheduling }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @scheduling.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedulings/1 or /schedulings/1.json
  def destroy
    @scheduling.destroy

    respond_to do |format|
      format.html { redirect_to schedulings_url, notice: "Scheduling was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scheduling
      @scheduling = Scheduling.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def scheduling_params
      params.require(:scheduling).permit(:account_id, :device_id, :group_id, :schedule_time)
    end
end
