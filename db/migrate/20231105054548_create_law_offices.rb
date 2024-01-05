class CreateLawOffices < ActiveRecord::Migration[6.1]
  def change
    create_table :law_offices do |t|

      t.timestamps
    end
  end
end
