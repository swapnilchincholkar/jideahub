class User < ActiveRecord::Base
  attr_accessible :name, :email, :screen_name
  has_many :services, :dependent => :destroy
  has_many :idea_users
  has_many :ideas, :through => :idea_users
  
  def tweet(msg)
    twitter_user = Twitter::Client.new(oauth_token: Setting.oauth_token, oauth_token_secret: Setting.oauth_token_secret)
    twitter_user.update(msg)
  end

end
