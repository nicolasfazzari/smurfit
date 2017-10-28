class KpisController < ApplicationController
  before_action :set_kpi, only: [:show, :edit, :update, :destroy]
  before_filter :must_be_admin, only: [:new,:create,:edit,:update,:destroy]
  # GET /kpis
  # GET /kpis.json
  def index
    @kpis = Kpi.all
  end

  # GET /kpis/1
  # GET /kpis/1.json
  def show
  end

  # GET /kpis/new
  def new
    @kpi = Kpi.new
  end

  # GET /kpis/1/edit
  def edit
  end

  # POST /kpis
  # POST /kpis.json
  def create
    @kpi = Kpi.new(kpi_params)

    respond_to do |format|
      if @kpi.save
        format.html { redirect_to root_path}
        format.json { render :show, status: :created, location: @kpi }
      else
        format.html { render :new }
        format.json { render json: @kpi.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kpis/1
  # PATCH/PUT /kpis/1.json
  def update
    respond_to do |format|
      if @kpi.update(kpi_params)
        format.html { redirect_to root_path }
        format.json { render :show, status: :ok, location: @kpi }
      else
        format.html { render :edit }
        format.json { render json: @kpi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kpis/1
  # DELETE /kpis/1.json
  def destroy
    @kpi.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end

  def must_be_admin
      unless current_user && current_user.admin?
        redirect_to root_path, notice: "must be admin"
      end
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kpi
      @kpi = Kpi.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kpi_params
      params.require(:kpi).permit(:name, :datum, :color)
    end
end
