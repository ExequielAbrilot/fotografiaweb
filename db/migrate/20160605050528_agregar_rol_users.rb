class AgregarRolUsers < ActiveRecord::Migration
  def change
  	 add_column :users, :role, :string, default: "Cliente"
  end
end
