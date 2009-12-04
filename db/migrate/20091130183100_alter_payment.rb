class AlterPayment < ActiveRecord::Migration
  def self.up
     rename_column(:payments, :gross_amount_cents, :payment_gross_cents)
     rename_column(:payments, :fees_cents, :payment_fee_cents)
     rename_column(:payments, :paypal_timestamp, :payment_date)
     add_column(:payments, :mc_currency, :string)
     add_column(:payments, :mc_gross_cents, :integer)
     add_column(:payments, :mc_fee_cents, :integer)
     add_column(:payments, :action, :string)
     add_column(:payments, :item_number, :integer)

  end

  def self.down
     rename_column(:payments, :payment_gross_cents, :gross_amount_cents)
     rename_column(:payments,:payment_fee_cents, :fees_cents )
     rename_column(:payments, :payment_date, :paypal_timestamp)
     remove_column(:payments, :mc_currency)
     remove_column(:payments, :mc_gross_cents)
     remove_column(:payments, :mc_fee_cents)
     remove_column(:payments, :action)
     remove_column(:payments, :item_number)

  end
end
