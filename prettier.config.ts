import type { Config } from "prettier";
import type { PluginOptions } from "prettier-plugin-tailwindcss";

export default {
  plugins: ["@tsrx/prettier-plugin", "prettier-plugin-tailwindcss"],
  tailwindStylesheet: "./src/main.css",
} satisfies Config & PluginOptions;
