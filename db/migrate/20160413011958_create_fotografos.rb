class CreateFotografos < ActiveRecord::Migration
  def change
    create_table :fotografos do |t|
      t.attachment :image
      t.string :nombrePila
      t.string :apellido
      has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
      t.integer :telefono
      t.date :fechaNacimiento
      t.string :rut
      t.string :email
      t.string :comentarios


      t.timestamps null: false
    end
  end

  
  

  
end
