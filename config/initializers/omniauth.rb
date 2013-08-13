Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['TWITTER_USER_KEY'], ENV['TWITTER_SECRET_KEY']
  OmniAuth.config.logger = Rails.logger
end
