class AddCommentFieldToDonation < ActiveRecord::Migration
  def self.up
    add_column :donations, :comment, :string
  end

  def self.down
    remove_column :donations, :comment
  end
end
