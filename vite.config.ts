import { fileURLToPath, URL } from "node:url";
import tailwindcss from "@tailwindcss/vite";
import tsrxVue from "@tsrx/vite-plugin-vue";
import { Unhead as unhead } from "@unhead/vue/vite";
import { nitro } from "nitro/vite";
import { defineConfig, type Plugin } from "vite";
import vueRouter from "vue-router/vite";

export default defineConfig({
  plugins: [nitro(), tsrxVueRouter(), tsrxVue(), unhead(), tailwindcss()],
  resolve: {
    alias: {
      "@": fileURLToPath(new URL("src", import.meta.url)),
    },
  },
});

const autoRouteModuleIds = new Set([
  "\0vue-router/auto-routes",
  "\0vue-router/auto-resolver",
  "vue-router/auto-routes",
  "vue-router/auto-resolver",
]);

function tsrxVueRouter(
  options: Parameters<typeof vueRouter>[0] = {},
): (Plugin | Plugin[])[] {
  return [
    vueRouter({ extensions: [".tsrx"], ...options }),
    {
      name: "tsrx-vue-router-page-export-compat",
      enforce: "post",
      transform(code, id) {
        if (!autoRouteModuleIds.has(id)) {
          return null;
        }

        const rewritten = code
          .replaceAll(
            /^import\s+([\w$]+)\s+from\s+(["'][^"'][^"'.]*\.[^"']+["']);?$/gm,
            "import { page as $1 } from $2;",
          )
          .replaceAll(
            /\(\)\s*=>\s*import\((["'][^"'][^"'.]*\.[^"']+["'])\)/g,
            "() => import($1).then((module) => module.page)",
          );

        return rewritten === code ? null : rewritten;
      },
    },
  ];
}
