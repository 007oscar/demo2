class RegistriesController < ApplicationController
  before_action :set_registry, only: [:show, :edit, :update, :destroy]
  #after_action :actualizar_registros, only: [:update, :create, :destroy]

  # GET /registries
  # GET /registries.json
  def index
    #@registries = Registry.all
    @registries =  Registry.paginate(page: params[:page], per_page: 10 ).includes([:expedient,:authority,:result,:city,:experts]).order(:year_folio, :folio)

  end

  # GET /registries/1
  # GET /registries/1.json
  def show
    #@registry = Registry.order(:year_folio, :folio)
    @fecha_r = @registry.fecha_recepcion
  end

  # GET /registries/new
  def new
    @registry = Registry.new
    @fecha_r = Time.new
    # @registry.build_expedient
    @default_values = {expediente: '', relacionado: ''}
    # @registry.build_expedient
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
    @fecha_r = @registry.fecha_recepcion
    if @registry.expedient.relacionado.nil?
      @default_values = {expediente: @registry.expedient.expediente, relacionado: ''}
    else
      @default_values = {expediente: @registry.expedient.expediente, relacionado: @registry.expedient.relacionado}
    end
  end

  # POST /registries
  # POST /registries.json
  def create
    @registry = Registry.new(registry_params)
    # raise params.to_yalm

    # if Expedient.find_by_expediente(params[:expedient]['expediente']).nil?
    #   @registry.build_expedient(expediente:params[:expedient]['expediente'], relacionado: params[:expedient]['relacionado'] )
    # else
    #   @registry.expedient = Expedient.find_by_expediente(params[:expedient]['expediente'])
    # end

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

    # if Expedient.find_by_expediente(params[:expedient]['expediente']).nil?
    #   @registry.build_expedient(expediente:params[:expedient]['expediente'], relacionado: params[:expedient]['relacionado'] )
    # else
    #   @registry.expedient = Expedient.find_by_expediente(params[:expedient]['expediente'])
    #   @registry.expedient.update(relacionado: params[:expedient]['relacionado'])
    # end
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
                                       :anexos_recibidos, :fecha_recepcion, :fecha_r, :hora_r, :fecha_e, :hora_e, :expediente,
                                       :relacionado,:ciudad, :autoridad,
                                       :fecha_entrega, :result_id, :anexos_entregados, :observaciones, :num_expediente,
                                       expedient_attributes: Expedient.attribute_names.map(&:to_sym).push(:_destroy, :nombre_expediente,:expediente_relacionado),
                                       city_attributes: [:id, :ciudad, :estado, :_destroy], expert_ids: [],
                                       authority_attributes: Authority.attribute_names.map(&:to_sym).push(:_destroy),
                                       experts_attributes: Expert.attribute_names.map(&:to_sym).push(:_destroy),
                                       result_attributes: Result.attribute_names.map(&:to_sym).push(:_destroy))

    end

  def actualizar_registros
    registry = Registry.all.order(:year_folio, :folio) #.where(year_folio: 2018).order(:year_folio, :folio)
    contador = 1
    registry.update(num_expediente: '')
    ultimo = "1"
    ultimo_tmp = ''
    expedients = Expedient.all

    registry.each do |r|
      if expedients.find(r.expedient).relacionado.nil?
        if expedients.find(r.expedient).registries.where.not(num_expediente: '').first.nil?
          if (r.year_folio == ultimo.split("/")[1].to_i)
            ultimo = (ultimo.split("/")[0].to_i + 1).to_s + "/" + ultimo.split("/")[1]
            ultimo_tmp = ultimo
          else
            contador = 1
            ultimo =  "1/" + r.year_folio.to_s
            ultimo_tmp = ultimo
          end
        else  #ya existe un antecedente
          ultimo = expedients.find(r.expedient).registries.where.not(num_expediente: '').first.num_expediente
        end
      else
        ultimo =  expedients.find(expedients.find(r.expedient).relacionado).registries.where.not(num_expediente: '').first.num_expediente
      end
      r.update( consecutivo: contador, num_expediente: ultimo )
      ultimo = ultimo_tmp if ultimo_tmp != ''   #"#{contador}/#{r.year_folio}"  #actualiza al ultimo registro en especial el año por las comparaciones arriba
      contador += 1
    end



    # registry.each do |r|
    #     if Expedient.find(r.expedient).relacionado.nil?
    #       if Expedient.find(r.expedient).registries.where.not(num_expediente: '').first.nil?
    #         if (r.year_folio == ultimo.split("/")[1].to_i)
    #           ultimo = (ultimo.split("/")[0].to_i + 1).to_s + "/" + ultimo.split("/")[1]
    #           ultimo_tmp = ultimo
    #         else
    #           contador = 1
    #           ultimo =  "1/" + r.year_folio.to_s
    #           ultimo_tmp = ultimo
    #         end
    #       else  #ya existe un antecedente
    #         ultimo = Expedient.find(r.expedient).registries.where.not(num_expediente: '').first.num_expediente
    #       end
    #     else
    #       ultimo =  Expedient.find(Expedient.find(r.expedient).relacionado).registries.where.not(num_expediente: '').first.num_expediente
    #     end
    #   r.update( consecutivo: contador, num_expediente: ultimo )
    #   ultimo = ultimo_tmp if ultimo_tmp != ''   #"#{contador}/#{r.year_folio}"  #actualiza al ultimo registro en especial el año por las comparaciones arriba
    #   contador += 1
    # end
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

  def validar_expediente
    if params[:expedient][:expediente][0..2].upcase == "FED"
       temp = params[:expedient][:expediente].split('/')
      if temp.count > 2
        if params[:expedient][:expediente].split('/')[-2].size < 7

        end
      end

      end
  end
end
