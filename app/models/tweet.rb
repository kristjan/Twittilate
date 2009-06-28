require 'rubygems'
require 'twitter'
require 'rtranslate'

class Tweet < ActiveRecord::Base
  def self.translate_all(to_echo, user, pass)
    httpauth = Twitter::HTTPAuth.new(user, pass)
    client = Twitter::Base.new(httpauth)

    Twitter::Search.new.from(to_echo).sort_by do |tweet|
      Time.parse(tweet.created_at)
    end.each do |tweet|
      unless Tweet.exists?(:twitter_id => tweet.id)
        text = CGI.unescapeHTML(tweet.text)
        Rails.logger.info("Translating: #{text}")
        translation = Translate.t(text, Language::ENGLISH, Language::CHINESE_SIMPLIFIED)
        retranslation = Translate.t(translation, Language::CHINESE, Language::ENGLISH)
        Tweet.create!(:twitter_id => tweet.id,
                       :text => text,
                       :retranslation => retranslation)
        Rails.logger.info("Tweeting: #{retranslation}")
        client.update(retranslation)
      end
    end
  end
end
