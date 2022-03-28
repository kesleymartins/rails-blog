class AddSlugToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :string, :string
    add_index :users, :string, unique: true
  end
end
