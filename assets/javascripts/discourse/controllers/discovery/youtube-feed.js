import Controller from "@ember/controller";
import { action } from "@ember/object";
import { service } from "@ember/service";

export default class YoutubeFeedController extends Controller {
  @service composer;

  @action
  createTopic() {
    this.composer.openNewTopic();
  }
}
