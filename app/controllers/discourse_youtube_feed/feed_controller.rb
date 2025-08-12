# frozen_string_literal: true

module ::DiscourseYoutubeFeed
  class FeedController < ::ApplicationController
    requires_plugin DiscourseYoutubeFeed::PLUGIN_NAME

    def index
      videos = Feed.get_videos
      if videos.blank? || videos.length != SiteSetting.discourse_youtube_feed_max_results
        videos = Feed.refresh_videos(**get_settings)
      end
      render_json_dump(videos)
    end

    def show
    end

    private

    def get_settings
      {
        api_key: SiteSetting.discourse_youtube_feed_api_key,
        channel_id: SiteSetting.discourse_youtube_feed_channel_id,
        max_results: SiteSetting.discourse_youtube_feed_max_results
      }
    end
  end
end
