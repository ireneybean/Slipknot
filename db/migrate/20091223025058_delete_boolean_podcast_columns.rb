class DeleteBooleanPodcastColumns < ActiveRecord::Migration
  def self.up
    remove_column :donations, :escape_pod
    remove_column :donations, :podcastle
    remove_column :donations, :psuedopod
  end

  def self.down
    add_column :donations, :escape_pod, :boolean, :default => true
    add_column :donations, :podcastle, :boolean, :default => true
    add_column :donations, :pseudopod, :boolean, :default => true
  end
end
