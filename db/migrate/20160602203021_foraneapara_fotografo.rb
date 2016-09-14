class ForaneaparaFotografo < ActiveRecord::Migration
  def change
  	
  	add_foreign_key :compromissos,:fotografos, on_delete: :cascade
  	
  end
end
