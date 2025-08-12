# frozen_string_literal: true

DiscourseYoutubeFeed::Engine.routes.draw do
  get "/videos" => "feed#index"
end

Discourse::Application.routes.draw { mount ::DiscourseYoutubeFeed::Engine, at: "youtube-feed" }
