class CreatePayments < ActiveRecord::Migration
  def self.up
    create_table :payments do |t|
      t.integer :donation_id, :required=>true
      t.integer :gross_amount_cents
      t.integer :fees_cents
      t.datetime :paypal_timestamp
      t.timestamps
    end
  end

  def self.down
    drop_table :payments
  end
end
