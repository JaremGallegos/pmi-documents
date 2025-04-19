import pluginSass from "@jgarber/eleventy-plugin-sass";

export default function(eleventyConfig) {
  eleventyConfig.addPlugin(pluginSass, {
    outputDir: "assets/css",
  });
  return {
    dir: { input: ".", includes: "_includes", data: "_data", output: "site" },
    templateFormats: ["liquid", "md", "njk"],
    markdownTemplateEngine: "liquid",
    htmlTemplateEngine: "liquid",
  };
}