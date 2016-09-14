class ArticlesController < ApplicationController
	

	before_action :authenticate_user!
    load_and_authorize_resource
	## aqui es para decir que en edit , show, update , destroy se usa el comando @fotografos=Fotografo.find(params[:id])
	before_action :set_fotografo, only:[:edit, :update , :destroy]

	def index
		@fotografo=Fotografo.all
	end

    def edit
    end

    def create
		@fotografo=Fotografo.new(article_params)

  		@fotografo.save
  		redirect_to @fotografo
	end

	def show
		@fotografo=Fotografo.all
    end

	def new
		@fotografo=Fotografo.new
	end
 
    def destroy
    	@fotografo.destroy
 
  		redirect_to articles_path
    end
	

	private
	  def set_fotografo
	  	@fotografo=Fotografo.find(params[:id])
	  end

	  def article_params
	  	## aqui se define los atributos que seran utilizados por seguridad
	    params.require(:fotografo).permit(:image,:nombre_pila,:apellido,:telefono,:fecha_nacimiento,:rut,:email,:comentarios)
	  end

	
	
end
