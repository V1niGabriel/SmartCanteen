class RenameCargoPermissaosToCargoPermissoes < ActiveRecord::Migration[8.1]
  def up
    rename_table :permissaos, :permissoes
    rename_table :cargo_permissaos, :cargo_permissoes
  end

  def down
    rename_table :permissoes, :permissaos
    rename_table :cargo_permissoes, :cargo_permissaos
  end
end
