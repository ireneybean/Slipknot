class CreatePodcast < ActiveRecord::Migration
  def self.up
    create_table :podcasts do |t|
      t.string :name
      t.string :image
      t.string :description
      t.string :url
      t.timestamps
      end
  end

  def self.down
    drop_table :podcasts
  end
end
