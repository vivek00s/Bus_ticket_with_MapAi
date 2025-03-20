class RemovePhoneIdFromLineItems < ActiveRecord::Migration[7.1]
  def change
    remove_column :line_items, :phone_id, :integer
  end
end
