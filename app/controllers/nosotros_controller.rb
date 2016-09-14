class NosotrosController < ApplicationController
  
  def show
  		@fotografo= Fotografo.all
  end

  def informacion
    	@fotografo = Fotografo.page(params[:page]).per(3)
  	end


  def servicios
  		@servicios= Servicio.page(params[:page]).per(1)
  	end
end
