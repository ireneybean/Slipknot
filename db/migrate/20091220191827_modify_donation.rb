class ModifyDonation < ActiveRecord::Migration
  def self.up
      add_column :donations, :type, :string,{ :null => false, :default => "OneTimeDonation" }
      remove_column :donations, :recurring
  end

  def self.down
    remove_column :donations, :type
    add_column :donations, :recurring, :boolean
  end
end
