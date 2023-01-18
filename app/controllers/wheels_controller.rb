class WheelsController < ApplicationController
  before_action :set_wheel, only: %i[ show edit update destroy ]

  # GET /wheels
  def index
    @wheels = Wheel.all
  end

  # GET /wheels/1
  def show
  end

  # GET /wheels/new
  def new
    @wheel = Wheel.new
  end

  # GET /wheels/1/edit
  def edit
  end

  # POST /wheels
  def create
    @wheel = Wheel.new(wheel_params)

    if @wheel.save
      redirect_to @wheel, notice: "Wheel was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /wheels/1
  def update
    if @wheel.update(wheel_params)
      redirect_to @wheel, notice: "Wheel was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /wheels/1
  def destroy
    @wheel.destroy!
    redirect_to wheels_url, notice: "Wheel was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wheel
      @wheel = Wheel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def wheel_params
      params.require(:wheel).permit(:vehicle_id, :wheel_size)
    end
end
