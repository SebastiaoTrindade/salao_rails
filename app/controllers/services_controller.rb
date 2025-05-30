class ServicesController < ApplicationController
  before_action :set_service, only:[ :show, :edit, :update, :destroy ]

  # GET /services or /services.json
  def index
    @services = Service.all
    @service = Service.new
  end

  # GET /services/1 or /services/1.json
  def show
  end

  # GET /services/new
  def new
    @service = Service.new
  end

  # GET /services/1/edit
  def edit
  end

  # POST /services or /services.json
  def create
    @service = Service.new(service_params)

    if @service.save
      flash[:success] = "Serviço criado com sucesso!"
      redirect_to services_path
    else
      render 'new'
    end
  end

  # PATCH/PUT /services/1 or /services/1.json
  def update
    if @service.update(service_params)
      flash[:success] = "Serviço atualizado com sucesso!"
      redirect_to services_path
    else
      render 'edit'
    end
  end

  # DELETE /services/1 or /services/1.json
  def destroy
    @service.destroy
    flash[:success] = "Serviço excluído com sucesso!"
    redirect_to services_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def service_params
      params.require(:service).permit(:name, :description, :price)
    end
end
