# frozen_string_literal: true

# name: discourse-youtube-feed
# about: Fetch and display the latest videos from a YouTube channel inside Discourse.
# version: 0.0.1
# authors: Jahan Gagan
# url: https://github.com/jahan-ggn/discourse-youtube-feed

enabled_site_setting :discourse_youtube_feed_enabled

module ::DiscourseYoutubeFeed
  PLUGIN_NAME = "discourse-youtube-feed"
  STORE_KEY = "youtube_feed_data"
end

require_relative "lib/discourse_youtube_feed/engine"
require_relative "app/models/discourse_youtube_feed/feed"
register_asset "stylesheets/youtube-videos.scss"

after_initialize do
  if SiteSetting.discourse_youtube_feed_enabled
    require File.expand_path('../jobs/scheduled/fetch_youtube_videos.rb', __FILE__)

    Discourse::Application.routes.append do
      get "/youtube-feed" => "discourse_youtube_feed/feed#show"
    end
  end
end
