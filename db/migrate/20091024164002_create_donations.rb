class CreateDonations < ActiveRecord::Migration
  def self.up
    create_table :donations do |t|
      t.integer :amount_cents
      t.string :name
      t.string :email
      t.boolean :escape_pod
      t.boolean :pseudopod
      t.boolean :podcastle
      t.boolean :recurring

      t.timestamps
    end
  end

  def self.down
    drop_table :donations
  end
end
