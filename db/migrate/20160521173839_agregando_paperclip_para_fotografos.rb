class AgregandoPaperclipParaFotografos < ActiveRecord::Migration
  
  
  def up
    add_attachment :fotografos, :image
  end

  def down
    remove_attachment :fotografos, :image
  end
end
