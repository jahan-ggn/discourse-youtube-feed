# frozen_string_literal: true

DiscourseYoutubeFeed::Engine.routes.draw do
  get "/examples" => "examples#index"
  # define routes here
end

Discourse::Application.routes.draw { mount ::DiscourseYoutubeFeed::Engine, at: "discourse-youtube-feed" }
