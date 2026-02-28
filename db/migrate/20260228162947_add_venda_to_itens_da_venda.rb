class AddVendaToItensDaVenda < ActiveRecord::Migration[8.1]
  def change
    add_reference :itens_da_vendas, :venda, null: false, foreign_key: true
  end
end
