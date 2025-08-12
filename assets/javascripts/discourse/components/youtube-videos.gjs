import Component from "@glimmer/component";
import { tracked } from "@glimmer/tracking";
import { action } from "@ember/object";
import DButton from "discourse/components/d-button";
import formatDate from "discourse/helpers/format-date";
import { ajax } from "discourse/lib/ajax";

export default class YoutubeVideos extends Component {
  @tracked videos = [];

  constructor() {
    super(...arguments);
    this.loadVideos();
  }

  @action
  async loadVideos() {
    try {
      const data = await ajax("/youtube-feed/videos");
      this.videos = data;
    } catch {
      this.videos = [];
    }
  }

  @action
  openYoutube() {
    window.open("https://www.youtube.com/@DailyMaverickSA/videos", "_blank");
  }

  <template>
    <div class="youtube-videos-container">
      {{#if this.videos.length}}
        <div class="videos-grid">
          {{#each this.videos as |video|}}
            <a
              href="https://www.youtube.com/watch?v={{video.id}}"
              target="_blank"
              rel="noopener noreferrer"
              class="youtube-video-item"
              style="text-decoration: none; color: inherit; display: block;"
            >
              <iframe
                src="https://www.youtube.com/embed/{{video.id}}"
                frameborder="0"
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                allowfullscreen
                title={{video.title}}
              ></iframe>
              <h4 class="video-title">{{video.title}}</h4>
              <p class="video-date">{{formatDate video.published_at}}</p>
            </a>

          {{/each}}
        </div>
        <div class="open-youtube-button-container">
          <DButton
            @action={{this.openYoutube}}
            @label="button.label"
            type="submit"
            class="btn-primary"
          />
        </div>
      {{else}}
        <p class="no-videos-message">
          No YouTube videos to show.
        </p>
      {{/if}}
    </div>
  </template>
}
