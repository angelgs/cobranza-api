class CobradorController < ApplicationController
  before_action :set_cobrador, only: [:show, :update, :destroy]

  # GET /cobradores
  def index
    @cobradores = Cobrador.all

    render json: @cobradores
  end

  # GET /cobradores/1
  def show
    render json: @cobrador
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cobrador
      @cobrador = Cobrador.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cobrador_params
      params.require(:cobrador).permit(:clave, :nombre, :zona, :ruta)
    end
end
