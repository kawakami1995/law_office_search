class ChangeDataTypesInReviews < ActiveRecord::Migration[6.1]
  def change
    reversible do |dir|
      change_table :reviews do |t|
        dir.up do
          # SQLite用の変更
          change_column :reviews, :user_id, :integer
          change_column :reviews, :law_office_id, :integer
        end

        dir.down do
          # ロールバック時の処理（SQLite）
          change_column :reviews, :user_id, :text
          change_column :reviews, :law_office_id, :text
        end
      end
    end

    reversible do |dir|
      change_table :reviews do |t|
        dir.up do
          # PostgreSQL用の変更
          change_column :reviews, :user_id, :integer
          change_column :reviews, :law_office_id, :integer
        end

        dir.down do
          # ロールバック時の処理（PostgreSQL）
          change_column :reviews, :user_id, :text
          change_column :reviews, :law_office_id, :text
        end
      end
    end
  end
end
