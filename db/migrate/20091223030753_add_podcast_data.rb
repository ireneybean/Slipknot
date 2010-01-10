require 'active_record/fixtures'

class AddPodcastData < ActiveRecord::Migration
  def self.up
    down
    directory = File.join(File.dirname(__FILE__), "data")
    Fixtures.create_fixtures(directory, "podcasts")
  end

  def self.down
    Podcast.delete_all
  end
end
