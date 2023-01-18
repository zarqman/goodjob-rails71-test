class EnginesController < ApplicationController
  before_action :set_engine, only: %i[ show edit update destroy ]

  # GET /engines
  def index
    @engines = Engine.all
  end

  # GET /engines/1
  def show
  end

  # GET /engines/new
  def new
    @engine = Engine.new
  end

  # GET /engines/1/edit
  def edit
  end

  # POST /engines
  def create
    @engine = Engine.new(engine_params)

    if @engine.save
      redirect_to @engine, notice: "Engine was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /engines/1
  def update
    if @engine.update(engine_params)
      redirect_to @engine, notice: "Engine was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /engines/1
  def destroy
    @engine.destroy!
    redirect_to engines_url, notice: "Engine was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_engine
      @engine = Engine.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def engine_params
      params.require(:engine).permit(:vehicle_id, :cylinders)
    end
end
