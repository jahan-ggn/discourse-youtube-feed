import { apiInitializer } from "discourse/lib/api";

export default apiInitializer((api) => {
  api.addNavigationBarItem({
    name: "youtube_feed",
    displayName: "Youtube",
    title: "Youtube",
    href: "/youtube-feed",
    forceActive: (category, args, router) =>
      router.currentURL.includes("/youtube-feed"),
  });
});
