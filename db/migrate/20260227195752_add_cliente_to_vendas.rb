class AddClienteToVendas < ActiveRecord::Migration[8.1]
  def change
    add_reference :vendas, :cliente, null: false, foreign_key: true
  end
end
