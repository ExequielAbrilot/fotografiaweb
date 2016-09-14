class ForaneCompromisoUsuario < ActiveRecord::Migration
  def change
  	add_foreign_key :compromissos,:users, on_delete: :cascade
  end
end
