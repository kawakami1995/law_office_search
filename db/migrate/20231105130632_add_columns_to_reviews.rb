class AddColumnsToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :user_id, :string
    add_column :reviews, :law_office_id, :string
    add_column :reviews, :review, :text
  end
end
