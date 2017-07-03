class ContratosController < ApplicationController
  before_action :set_contrato, only: [:show, :update, :destroy]

  # GET /contratos
  def index
    @contratos = Contrato.all

    render json: @contratos
  end

  # GET /contratos/1
  def show
    render json: @contrato
  end

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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contrato
      @contrato = Contrato.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def contrato_params
      params.require(:contrato).permit(:numero_contrato, :numero_cuenta, :fecha_apertura, :monto_contrato, :monto_contrato, :saldo, :saldo, :total_pagos, :pagos_atrasados, :cargo_intereses, :cargo_intereses, :otros_cargos, :otros_cargos, :motivo_otros_cargos, :aviso)
    end
end
