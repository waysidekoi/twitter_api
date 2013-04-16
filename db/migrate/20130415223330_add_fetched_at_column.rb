class AddFetchedAtColumn < ActiveRecord::Migration
  def change
    add_column :twitterusers, :fetched_at, :datetime
  end
end
