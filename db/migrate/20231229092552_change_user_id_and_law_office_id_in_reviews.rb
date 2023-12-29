class ChangeUserIdAndLawOfficeIdInReviews < ActiveRecord::Migration[6.1]
  def change
    change_column :reviews, :user_id, :integer
    change_column :reviews, :law_office_id, :integer
  end
end
