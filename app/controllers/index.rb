get '/' do
end

get '/:username' do
  @user = Twitteruser.find_or_create_by_username(params[:username])
  session[:username] = params[:username]
  erb :loading
end

get '/latest' do
  @user = Twitteruser.find(session[:username])

  if @user.tweets_stale?
    @user.fetch_tweets!
  end

  @tweets = @user.tweets.limit(10)

  erb :index
end
