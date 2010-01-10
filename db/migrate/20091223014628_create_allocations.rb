class CreateAllocations < ActiveRecord::Migration
  def self.up
    create_table :allocations do |t|
      t.integer :donation_id, :required=>true
      t.integer :podcast_id, :required=>true
      t.integer :amount_cents, :required=>true
      t.timestamps
    end  
  end

  def self.down
    drop_table :allocations
  end
end
