class TwitterusersTable < ActiveRecord::Migration
  def change
    create_table :twitterusers do |t|
      t.string :username, :description, :name
      t.integer :followers_count, :friends_count
      t.timestamps
    end
  end
end
