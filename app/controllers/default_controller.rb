class DefaultController < ApplicationController
  
  
  before_action :authenticate_user!
  load_and_authorize_resource
 
  before_action :set_compromisso, only: [:show,:edit, :update, :destroy]
  def index
  	#@comiso= Compromisso.all
  	
    @comiso = Compromisso.page(params[:page]).per(10)
    
  	
  end
  
  def edit
  end

  def show
  end

  def destroy
  end

  
  
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
  
   private
    # Use callbacks to share common setup or constraints between actions.
    def set_compromisso
      @compromisso = Compromisso.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def compromisso_params
      
      params.require(:compromisso).permit(:titulo, :texto, :date, :servicio_id,:user_id, :fotografo_id)
    end
    # le avisa cada cuanto muestra en la pagina
    
end
