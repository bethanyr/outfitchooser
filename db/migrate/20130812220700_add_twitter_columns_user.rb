class AddTwitterColumnsUser < ActiveRecord::Migration
  def change
    add_column :users, :twitter_name, :string
    add_column :users, :twitter_img, :string
  end
end
