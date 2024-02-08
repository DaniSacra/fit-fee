class AddSubscriptionFeeToCustomers < ActiveRecord::Migration[7.1]
  def change
    add_column :customers, :subscription_fee, :decimal, precision: 10, scale: 2
  end
end
