class ContratosController < ApplicationController
  before_action :set_cobrador
  before_action :set_cobrador_contrato, only: [:show]

  # GET /cobradores/:cobradore_id/contratos
  def index
    #render json: @cobrador.contratos
    json_response(@cobrador.contratos)
  end

  # GET /cobradores/:cobradore_id/contratos/1
  def show
    render json: @contrato
  end

=begin
  # POST /contratos
  def create
    @contrato = Contrato.new(contrato_params)

    if @contrato.save
      render json: @contrato, status: :created, location: @contrato
    else
      render json: @contrato.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contratos/1
  def update
    if @contrato.update(contrato_params)
      render json: @contrato
    else
      render json: @contrato.errors, status: :unprocessable_entity
    end
  end

  # DELETE /contratos/1
  def destroy
    @contrato.destroy
  end
=end
  private
    def set_cobrador
      @cobrador = Cobrador.find(params[:cobradore_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_cobrador_contrato
      @contrato = @cobrador.contratos.find_by!(id: params[:id]) if @cobrador
    end

    # Only allow a trusted parameter "white list" through.
    def contrato_params
      params.require(:contrato).permit(:numero_contrato, :numero_cuenta, :fecha_apertura, :monto_contrato, :monto_contrato, :saldo, :saldo, :total_pagos, :pagos_atrasados, :cargo_intereses, :cargo_intereses, :otros_cargos, :otros_cargos, :motivo_otros_cargos, :aviso)
    end
end
