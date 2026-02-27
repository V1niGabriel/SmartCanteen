class CreateClientes < ActiveRecord::Migration[8.1]
  def change
    create_table :clientes do |t|
      t.string :nome
    end
  end
end
