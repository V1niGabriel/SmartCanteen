class AddFuncionarioToVendas < ActiveRecord::Migration[8.1]
  def change
    add_reference :vendas, :funcionario, null: false, foreign_key: true
  end
end
