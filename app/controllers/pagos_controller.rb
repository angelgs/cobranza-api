class PagosController < ApplicationController
  before_action :set_cobrador
  before_action :set_cobrador_pago, only: [:show, :update, :destroy]

  # GET /cobradores/:cobradore_id/pagos
  def index
    render json: @cobrador.pagos
  end

  # GET /cobradores/:cobradore_id/pagos/1
  def show
    render json: @pago
  end

  # POST /cobradores/:cobradore_id/pagos
  def create
    puts "**********************************"
    @cobradore_id = params[:cobradore_id]

    pagos = params[:_json].collect {|key,params|
      Pago.create(contrato_id: key[:contrato_id], fecha_pago: key[:fecha_pago], monto_pago: key[:monto_pago], numero_pago: key[:numero_pago]) }

    pagos.each do |pago|
      p pago
    end
    puts "**********************************"



=begin
    @pago = Pago.new(pago_params)

    if @pago.save
      render json: @pago, status: :created, location: @pago
    else
      render json: @pago.errors, status: :unprocessable_entity
    end
=end
    head :no_content
  end

  # PATCH/PUT /cobradores/:cobradore_id/pagos/1
  def update
    if @pago.update(pago_params)
      render json: @pago
    else
      render json: @pago.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pagos/1
  #def destroy
  #  @pago.destroy
  #end

  private

    def set_cobrador
      @cobrador = Cobrador.find(params[:cobradore_id])
    end

    def set_cobrador_pago
      @pago = @cobrador.pagos.find_by!(id: params[:id]) if @cobrador
    end

    # Only allow a trusted parameter "white list" through.
=begin
    def pago_params
      params.require(:pago).permit(permit_for_each_pago)
    end

    def permit_for_each_pago
      params[:pago].keys.inject({}){|h,k| h[k] = attributes_to_permit; h}
    end

    def attributes_to_permit
      [:contrato_id, :fecha_pago, :monto_pago, :monto_pago, :numero_pago]
    end
=end
    def pago_params
      params.require(:pago).permit!
      #(:contrato_id, :fecha_pago, :monto_pago, :monto_pago, :numero_pago)
    end

    def pagos_params
      params.require(:_json)
      #params.permit(:cobradore_id, pago: [], _json: {})

      #params.require(:pago)
      params.permit(:cobradore_id, pago: [:contrato_id, :fecha_pago, :monto_pago, :numero_pago], _json: [:contrato_id, :fecha_pago, :monto_pago, :numero_pago])
      #params.permit(:cobradore_id, pago: [:contrato_id, :fecha_pago, :monto_pago, :numero_pago])

      #params.require(:_json).map do |param|
        #p param
        #param.permit(pago: [:contrato_id, :fecha_pago, :monto_pago, :numero_pago])
        #p param
        #ActionController::Parameters.new(param.to_hash).permit(:contrato_id, :fecha_pago, :monto_pago, :numero_pago)
      #end
      #params.permit(pagos: [:contrato_id, :fecha_pago, :monto_pago, :numero_pago])
    end
=begin
    def post_params
        ActiveModelSerializers::Deserialization.jsonapi_parse(params)
        #// or (params.to_unsafe_h) in some cases like in my example below...
    end
=end
end
