import RouteTemplate from "ember-route-template";
import Layout from "discourse/components/discovery/layout";
import Navigation from "discourse/components/discovery/navigation";
import YoutubeVideos from "../../components/youtube-videos";

export default RouteTemplate(
  <template>
    <Layout @model={{@controller.model}}>
      <:navigation>
        <Navigation @createTopic={{@controller.createTopic}} />
      </:navigation>

      <:list>
        <YoutubeVideos />
      </:list>
    </Layout>
  </template>
);
