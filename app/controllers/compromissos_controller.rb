class CompromissosController < ApplicationController
  
  before_action :authenticate_user!
  load_and_authorize_resource
  
  before_action :set_compromisso, only: [:show,:edit, :update, :destroy]

  # GET /compromissos
  # GET /compromissos.json
  def index
    #inicio compromisso para tenerlo listo en index
    @servicios = Servicio.all
    @compromisso = Compromisso.new
    if params[:searchbox]

       
        
          #@products = Product.search(params[:searchbox])
          @compromissos = Compromisso.search(params[:searchbox])
          #@compromissos = Compromisso.all
          @date = params[:month] ? Date.parse(params[:month]) : Date.today
        
    else

  
        @compromissos = Compromisso.all
        @date = params[:month] ? Date.parse(params[:month]) : Date.today
    end
  end

  # GET /compromissos/1
  # GET /compromissos/1.json
  def show

  end
  

  # GET /compromissos/new
  def new
    @compromisso = Compromisso.new
  end

  # GET /compromissos/1/edit
  def edit
  end

  # POST /compromissos
  # POST /compromissos.json
  def create
    @compromisso = Compromisso.new(compromisso_params)
   
    respond_to do |format|

      if @compromisso.save
        format.html { redirect_to @compromisso, notice: 'Compromiso ha sido guardado con exito' }
        format.json { render :show, status: :created, location: @compromisso }
      else
        format.html { render :new }
        format.json { render json: @compromisso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /compromissos/1
  # PATCH/PUT /compromissos/1.json
  def update
    respond_to do |format|
      if @compromisso.update(compromisso_params)
        format.html { redirect_to @compromisso, notice: 'Compromiso a sido actualizado con exito' }
        format.json { render :show, status: :ok, location: @compromisso }
      else
        format.html { render :edit }
        format.json { render json: @compromisso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /compromissos/1
  # DELETE /compromissos/1.json
  def destroy
    @compromisso.destroy
    respond_to do |format|
      format.html { redirect_to compromissos_url, notice: 'Compromiso a sido eliminado con exito' }
      format.json { head :no_content }
    end

    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_compromisso
      @compromisso = Compromisso.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def compromisso_params
      
      params.require(:compromisso).permit(:titulo, :texto, :date, :hora_inicio,:horas_duracion,:servicio_id,:user_id, :fotografo_id)
    end
end
