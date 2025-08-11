# frozen_string_literal: true

# name: discourse-youtube-feed
# about: TODO
# meta_topic_id: TODO
# version: 0.0.1
# authors: Discourse
# url: TODO
# required_version: 2.7.0

enabled_site_setting :discourse_youtube_feed_enabled

module ::DiscourseYoutubeFeed
  PLUGIN_NAME = "discourse-youtube-feed"
end

require_relative "lib/discourse_youtube_feed/engine"

after_initialize do
  # Code which should run after Rails has finished booting
end
