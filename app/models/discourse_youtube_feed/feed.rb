# frozen_string_literal: true

module ::DiscourseYoutubeFeed
  class Feed
    def self.save_videos(videos)
      data = { "latest_videos" => videos, "last_updated" => Time.now }
      PluginStore.set(DiscourseYoutubeFeed::PLUGIN_NAME, DiscourseYoutubeFeed::STORE_KEY, data)
    end

    def self.get_videos
      data = PluginStore.get(DiscourseYoutubeFeed::PLUGIN_NAME, DiscourseYoutubeFeed::STORE_KEY) || {}
      data["latest_videos"] || []
    end

    def self.clear_data
      PluginStore.remove(DiscourseYoutubeFeed::PLUGIN_NAME, DiscourseYoutubeFeed::STORE_KEY)
    end

    def self.refresh_videos(api_key:, channel_id:, max_results:)
      return [] if api_key.blank? || channel_id.blank?

      url = "https://www.googleapis.com/youtube/v3/search?key=#{api_key}&channelId=#{channel_id}&part=snippet,id&order=date&maxResults=#{max_results}"

      begin
        response = Net::HTTP.get(URI(url))
        json = JSON.parse(response)

        videos = json["items"].map do |item|
          next unless item["id"]["videoId"]
          {
            "id" => item["id"]["videoId"],
            "title" => item["snippet"]["title"],
            "thumbnail" => item["snippet"]["thumbnails"]["high"]["url"],
            "published_at" => item["snippet"]["publishedAt"]
          }
        end.compact

        save_videos(videos)
        videos
      rescue => e
        []
      end
    end
  end
end
