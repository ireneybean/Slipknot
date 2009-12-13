class AddFieldsToPayments < ActiveRecord::Migration
  def self.up
    add_column :payments, :payment_status, :string
    add_column :payments, :txn_type, :string
    add_column :payments, :txn_id, :string
    add_column :payments, :payment_type, :string
    remove_column :payments, :action
  end

  def self.down
    remove_column :payments, :payment_type
    remove_column :payments, :txn_id
    remove_column :payments, :txn_type
    remove_column :payments, :payment_status
    add_column :payments, :action, :string
  end
end
