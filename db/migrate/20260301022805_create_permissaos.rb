class CreatePermissaos < ActiveRecord::Migration[8.1]
  def change
    create_table :permissaos do |t|
      t.string :acao
      t.string :tabela

      t.timestamps
    end
  end
end
