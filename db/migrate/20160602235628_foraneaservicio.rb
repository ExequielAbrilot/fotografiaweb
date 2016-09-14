class Foraneaservicio < ActiveRecord::Migration
  def change
  	add_foreign_key :compromissos,:servicios, on_delete: :cascade
  end
end
