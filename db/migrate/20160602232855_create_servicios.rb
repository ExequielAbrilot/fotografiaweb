class CreateServicios < ActiveRecord::Migration
  def change
    create_table :servicios do |t|
      t.string :nombre
      t.text :comentario

      t.timestamps null: false
    end
  end
end
