import { apiInitializer } from "discourse/lib/api";

export default apiInitializer((api) => {
  api.addNavigationBarItem({
    name: "video_feed",
    displayName: "Video",
    title: "Youtube Videos",
    href: "/youtube-feed",
    forceActive: (category, args, router) =>
      router.currentURL.includes("/youtube-feed"),
  });
});
