class CreateCargos < ActiveRecord::Migration[8.1]
  def change
    create_table :cargos do |t|
      t.string :nome_cargo
    end
  end
end
