class Fotografo < ActiveRecord::Base
	 has_many :compromisso 

	 has_attached_file :image
	 validates :image, :attachment_presence => true
	
	 validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
	 # Validate filename
	 validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]
	 # Explicitly do not validate
	 do_not_validate_attachment_file_type :image

	def self.existe(buscamos)
		if Fotografo.exists?(['nombre_pila LIKE ?', "%#{buscamos}%"])==false
      		redirect_to compromissos_path
		end
	end

end
