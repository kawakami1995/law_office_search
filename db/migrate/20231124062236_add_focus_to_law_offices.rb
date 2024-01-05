class AddFocusToLawOffices < ActiveRecord::Migration[6.1]
  def change
    add_column :law_offices, :focus, :string
  end
end
