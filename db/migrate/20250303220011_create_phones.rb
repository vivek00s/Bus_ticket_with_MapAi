class CreatePhones < ActiveRecord::Migration[7.1]
  def change
    create_table :phones do |t|
      t.string :name
      t.decimal :price
      t.text :description

      t.timestamps
    end
  end
end
