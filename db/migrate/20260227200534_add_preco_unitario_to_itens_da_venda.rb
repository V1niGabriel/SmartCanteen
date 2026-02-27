class AddPrecoUnitarioToItensDaVenda < ActiveRecord::Migration[8.1]
  def change
    add_column :itens_da_vendas, :precounitario, :decimal
  end
end
