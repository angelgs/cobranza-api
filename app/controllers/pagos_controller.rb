class PagosController < ApplicationController
  before_action :set_pago, only: [:show, :update, :destroy]

  # GET /pagos
  def index
    @pagos = Pago.all

    render json: @pagos
  end

  # GET /pagos/1
  def show
    render json: @pago
  end

  # POST /pagos
  def create
    @pago = Pago.new(pago_params)

    if @pago.save
      render json: @pago, status: :created, location: @pago
    else
      render json: @pago.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pagos/1
  def update
    if @pago.update(pago_params)
      render json: @pago
    else
      render json: @pago.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pagos/1
  def destroy
    @pago.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pago
      @pago = Pago.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def pago_params
      params.require(:pago).permit(:contrato_id, :fecha_pago, :monto_pago, :monto_pago, :numero_pago)
    end
end
