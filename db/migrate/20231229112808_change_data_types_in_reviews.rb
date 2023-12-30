class ChangeDataTypesInReviews < ActiveRecord::Migration[6.1]
  def change
    change_column :reviews, :user_id, 'integer USING CAST(user_id AS integer)'
    change_column :reviews, :law_office_id, 'integer USING CAST(law_office_id AS integer)'
  end
end
