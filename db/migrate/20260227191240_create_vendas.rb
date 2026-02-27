class CreateVendas < ActiveRecord::Migration[8.1]
  def change
    create_table :vendas do |t|
      t.datetime :data_da_compra
    end
  end
end
