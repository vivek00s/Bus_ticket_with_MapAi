class CreateStores < ActiveRecord::Migration[7.1]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :category
      t.integer :price
      t.text :description

      t.timestamps
    end
  end
end
