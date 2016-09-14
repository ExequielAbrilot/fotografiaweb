class FotografosController < ApplicationController
	before_action :set_fotografo, only:[:show,:edit, :update , :destroy]

	def index
    	@fotografo=Fotografo.all
  	end

	def edit
    end

    def update
	    @fotografo = Fotografo.find(params[:id])
	 
	    if @fotografo.update(article_params)
	      redirect_to @fotografo
	    else
	      render 'edit'
	    end
	end

    def destroy
    	@fotografo.destroy
 
  		redirect_to fotografos_path
    end
    
    def edit
    end
	
	def new
		@fotografo=Fotografo.new
	end

	def create
		@fotografo=Fotografo.new(article_params)

  		@fotografo.save
  		redirect_to @fotografo
	end

	def show
	end

	private
	  def set_fotografo
	  	@fotografo=Fotografo.find(params[:id])
	  end

	  def article_params
	  	## aqui se define los atributos que seran utilizados por seguridad
	    params.require(:fotografo).permit(:image,:nombre_pila,:apellido,:telefono,:fecha_nacimiento,:rut,:email,:comentarios,:precio_servicio,:dato_facebook,:dato_instagram,:dato_twitter)
	  	
	  
	  end

end
