class CreateItensDaVendas < ActiveRecord::Migration[8.1]
  def change
    create_table :itens_da_vendas do |t|
      t.integer :quantidade
    end
  end
end
