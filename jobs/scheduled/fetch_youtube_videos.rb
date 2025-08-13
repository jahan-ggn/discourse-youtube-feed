# frozen_string_literal: true

module Jobs
  class FetchYoutubeVideos < ::Jobs::Scheduled
    every 12.hours

    def execute(args)
      return unless SiteSetting.discourse_youtube_feed_enabled

      ::DiscourseYoutubeFeed::Feed.clear_data
      ::DiscourseYoutubeFeed::Feed.refresh_videos(
        api_key: SiteSetting.discourse_youtube_feed_api_key,
        channel_id: SiteSetting.discourse_youtube_feed_channel_id,
        max_results: SiteSetting.discourse_youtube_feed_max_results
      )
    end
  end
end
