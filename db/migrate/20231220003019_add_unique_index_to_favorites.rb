class AddUniqueIndexToFavorites < ActiveRecord::Migration[6.1]
  def change
    add_index :favorites, [:user_id, :law_office_id], unique: true
  end
end
