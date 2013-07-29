class CreateOutfits < ActiveRecord::Migration
  def change
    create_table :outfits do |t|
      t.string :dayworn
      t.datetime :dateworn
      t.references :user
      t.references :shirt
      t.timestamps
    end
  end
end
