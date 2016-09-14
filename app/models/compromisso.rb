class Compromisso < ActiveRecord::Base
	belongs_to :fotografo # compromisso tendra fotografo_id
	belongs_to :servicio 
    belongs_to :user
	 # busqueda por texto

	 def self.search(search)

		 if search 
		 	
		 	
		   Compromisso.joins(:fotografo).where('nombre_pila LIKE ?', "%#{search}%")

		 
		 	

		 end


	end

    def self.buscando(id)

		 
		 	
		 	
		   Compromisso.where(["user_id = ?",1])

		 
		 	

		 
	end

	
end
