class TweetsTable < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.text :text
      t.string :created_at
      t.references :twitteruser
    end
  end
end
