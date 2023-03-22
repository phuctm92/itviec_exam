class AddSubscribtionStatusToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :subscription_status, :integer, default: 1 # active
  end
end
