class AddMarcaIdToAnuncios < ActiveRecord::Migration
  def change
    add_column :anuncios, :marca_id, :integer
    add_index :anuncios, :marca_id
  end
end
