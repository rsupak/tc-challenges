class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.string :lastname
      t.string :firstname
      t.integer :phone, :limit => 8
      t.string :email

      t.timestamps
    end
  end
end
