class CreateCargoPermissaos < ActiveRecord::Migration[8.1]
  def change
    create_table :cargo_permissaos do |t|
      t.references :cargo, null: false, foreign_key: true
      t.references :permissao, null: false, foreign_key: true

      t.timestamps
    end
  end
end
