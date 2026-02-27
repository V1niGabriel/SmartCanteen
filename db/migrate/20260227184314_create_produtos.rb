class CreateProdutos < ActiveRecord::Migration[8.1]
  def change
    create_table :produtos do |t|
      t.string :nome
      t.string :tipo
      t.decimal :preco
    end
  end
end
