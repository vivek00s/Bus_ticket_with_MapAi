class CreateSupportTeams < ActiveRecord::Migration[7.1]
  def change
    create_table :support_teams do |t|
      t.string :name
      t.string :role
      t.string :branch
      t.string :phone_number
      t.string :email
      t.string :image

      t.timestamps
    end
  end
end
