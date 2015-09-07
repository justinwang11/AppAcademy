class AddTypeToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :recorded, :string
  end
end
