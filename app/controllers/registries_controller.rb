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
    if Registry.count < 1
      @registry.consecutivo = 1
    elsif Registry.last.consecutivo.nil?
            @registry.consecutivo = 1
    else
      @registry.consecutivo = Registry.last.consecutivo + 1
    end

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
      params.require(:registry).permit(:consecutivo, :folio, :year_folio, :detenido, :expedient_id, :city_id, :authority_id,
                                       :anexos_recibidos, :fecha_recepcion,
                                       :fecha_entrega, :result_id, :anexos_entregados, :observaciones, :num_expediente,
                                       expedient_attributes: Expedient.attribute_names.map(&:to_sym).push(:_destroy),
                                       city_attributes: [:id, :ciudad, :estado, :_destroy], expert_ids: [],
                                       authority_attributes: Authority.attribute_names.map(&:to_sym).push(:_destroy),
                                       experts_attributes: Expert.attribute_names.map(&:to_sym).push(:_destroy),
                                       result_attributes: Result.attribute_names.map(&:to_sym).push(:_destroy))

    end

  def actualizar_registros
    registry = Registry.order(:year_folio, :folio)
    contador = 1
    Registry.update(num_expediente: '')
    ultimo = "1"

    registry.each do |r|
      # contador += 1

      if ultimo == "1"
        ultimo += "/" + r.year_folio.to_s
      else
        # ultimo = Expedient.find(r.expedient).registries.where.not(:num_expediente => '').first.num_expediente
        if Expedient.find(r.expedient).relacionado.nil?
          #ultimo = Expedient.find(r.expedient).registries.where.not(num_expediente: '').first.num_expediente
          if Expedient.find(r.expedient).registries.where.not(num_expediente: '').first.nil?
            if (r.year_folio == ultimo.split("/")[1].to_i)
              ultimo = (ultimo.split("/")[0].to_i + 1).to_s + "/" + ultimo.split("/")[1]
            else
              contador = 1
              ultimo =  "1/" + r.year_folio.to_s
            end
          else
            ultimo = Expedient.find(r.expedient).registries.where.not(num_expediente: '').first.num_expediente
          end
        else
          ultimo =  Expedient.find(Expedient.find(r.expedient).relacionado).registries.where.not(num_expediente: '').first.num_expediente
        end
        # if ultimo == ""
        #   if (r.year_folio == ultimo.split("/")[1].to_i)
        #     ultimo = (ultimo.split("/")[0].to_i + 1).to_s + "/" + ultimo.split("/")[1]
        #   else
        #     contador = 1
        #     ultimo =  "1/" + r.year_folio.to_s
        #   end
        # elsif r.year_folio > ultimo.split("/")[1].to_i
        #     contador = 1   #nuevo año, nuevo consecutivo
        # end
      end
      r.update( consecutivo: contador, num_expediente: ultimo )
      contador += 1
    end

    # for r in (0..registry.count-1)
    #   contador += 1
    #   # r.update(consecutivo: contador)
    #   if ultimo == "1"
    #     ultimo += "/" + registry[r].year_folio.to_s
    #   elsif registry[r].num_expediente == '' and (registry[r].year_folio == ultimo.split("/")[1].to_i)
    #     ultimo = (ultimo.split("/")[0].to_i + 1).to_s + "/" + ultimo.split("/")[1]
    #   elsif registry[r].num_expediente == '' and (registry[r].year_folio > ultimo.split("/")[1].to_i)
    #     contador = 1
    #     ultimo =  "1/" + registry[r].year_folio.to_s
    #   end
    #   if registry[r].num_expediente == ''
    #     registry.where(expedient_id: registry[r].expedient_id).update(num_expediente: ultimo)
    #     registry.reload  #it is necessary to update the registries during iterations
    #   end
    # end
  end

end
