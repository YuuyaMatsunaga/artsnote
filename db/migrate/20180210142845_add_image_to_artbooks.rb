class AddImageToArtbooks < ActiveRecord::Migration[5.0]
  def change
    add_column :artbooks, :image, :string
  end
end
