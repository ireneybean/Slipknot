class AlterDonation < ActiveRecord::Migration
  def self.up
     change_column_default(:donations, :escape_pod, true)
     change_column_default(:donations, :podcastle, true)
     change_column_default(:donations, :pseudopod, true)
  end

  def self.down
     change_column_default(:donations, :escape_pod, false)
     change_column_default(:donations, :podcastle, false)
     change_column_default(:donations, :pseudopod, false)
  end
end
