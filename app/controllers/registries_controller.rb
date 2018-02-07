class RegistriesController < ApplicationController
  before_action :set_registry, only: [:show, :edit, :update, :destroy]
  after_action :actualizar_registros, only: [:update, :create, :destroy]

  # GET /registries
  # GET /registries.json
  def index
    #@registries = Registry.all
    @registries =  Registry.all.order(:year_folio, :folio)
  end

  # GET /registries/1
  # GET /registries/1.json
  def show
    #@registry = Registry.order(:year_folio, :folio)
  end

  # GET /registries/new
  def new
    @registry = Registry.new
    @registry.consecutivo = Registry.count + 1
  end

  # GET /registries/1/edit
  def edit
  end

  # POST /registries
  # POST /registries.json
  def create
    @registry = Registry.new(registry_params)
   # @registry[:registry][:expert_ids]= @registry[:registry][:expert_ids].reject{|e| e.empty?}

    #raise params.to_yalm
    respond_to do |format|
      if @registry.save
        format.html { redirect_to @registry, notice: 'Registry was successfully created.' }
        format.json { render :show, status: :created, location: @registry }
      else
        format.html { render :new }
        format.json { render json: @registry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /registries/1
  # PATCH/PUT /registries/1.json
  def update
    respond_to do |format|
      if @registry.update(registry_params)
        format.html { redirect_to @registry, notice: 'Registry was successfully updated.' }
        format.json { render :show, status: :ok, location: @registry }
      else
        format.html { render :edit }
        format.json { render json: @registry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registries/1
  # DELETE /registries/1.json
  def destroy
    @registry.destroy
    respond_to do |format|
      format.html { redirect_to registries_url, notice: 'Registry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registry
      @registry = Registry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def registry_params
      params.require(:registry).permit(:consecutivo, :folio, :year_folio, :detenido, :expedient_id, :city_id, :authority_id, :anexos_recibidos, :fecha_recepcion,
                                       :fecha_entrega, :result_id, :anexos_entregados, :observaciones, :num_expediente, expedient_attributes: [:id, :expediente, :hojas, :a_inicial, :a_final, :_destroy],
                                       city_attributes: [:id, :ciudad, :estado, :_destroy], expert_ids: [],
                                       authority_attributes: Authority.attribute_names.map(&:to_sym).push(:_destroy),
                                       experts_attributes: Expert.attribute_names.map(&:to_sym).push(:_destroy),
                                       result_attributes: Result.attribute_names.map(&:to_sym).push(:_destroy))

    end

  def actualizar_registros
    # buscar todos los registros y ordenearlos por Folio
    contador = 1
    Registry.update(:consecutivo => '')
    ultimo = ""
    Registry.order(:year_folio, :folio).each do | r |
      if (contador == 1)
        r.update(:consecutivo => contador, :num_expediente => contador.to_s + "/" + r.year_folio.to_s)
      else
        b = Registry.where("expedient_id = ? and consecutivo < ?", r.expedient_id, contador)
        if b.count > 0
          r.update(:consecutivo => contador, :num_expediente => b.first.num_expediente)
        else
          if ultimo.scan(/\d+/)[-1].to_i == r.year_folio
            r.update(:consecutivo => contador, :num_expediente => (ultimo.scan(/\d+/)[0].to_i + 1).to_s + "/" + r.year_folio.to_s)
          else
            r.update(:consecutivo => contador, :num_expediente => "1/" + r.year_folio.to_s)
          end
        end
      end
      if ultimo = "" or (ultimo.scan(/\d+/)[-1].to_i < r.num_expediente.scan(/\d+/)[-1].to_i)
        ultimo = r.num_expediente
      end
      contador += 1
    end
  end
end
