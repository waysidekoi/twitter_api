class Twitteruser < ActiveRecord::Base
  has_many :tweets
  after_create :populate_twitter_information

  def populate_twitter_information
    first_tweet = Twitter.user_timeline(self.username).first

    self.update_attributes(name: first_tweet.user.name, description: first_tweet.user.description, followers_count: first_tweet.user.followers_count, friends_count: first_tweet.user.friends_count)
  end

  def fetch_tweets!
    self.update_attributes(fetched_at: DateTime.now)
    @tweets = Twitter.user_timeline(self.username)

    @tweets.each do |tweet|
      self.tweets << Tweet.create(text: tweet.text, created_at: tweet.created_at)
    end
  end

  def tweets_stale?
    self.fetched_at.nil? ? true : Time.now - self.fetched_at > (15*60)
  end 

end
