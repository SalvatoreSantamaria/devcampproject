module SocialTool
    def self.twitter_search
        client = Twitter::REST::Client.new do | config | 
            config.consumer_key = Env.fetch("TWITTER_CONSUMER_KEY")
            config.consumer_secret = Env.fetch("TWITTER_CONSUMER_SECRET")
            config.access_token = Env.fetch("TWITTER_ACCESS_TOKEN")
            config.access_token_secret = Env.fetch("TWITTER_ACCESS_SECRET")
        end
    end
end

#need to set TWITTER_ACCESS_SECRET, etc, in env file, but abandoning this tutorial. 