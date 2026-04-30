import { fileURLToPath, URL } from "node:url";
import tsrxVue from "@tsrx/vite-plugin-vue";
import { defineConfig } from "vite";
import vueJsxVapor from "vue-jsx-vapor/vite";

// https://vite.dev/config/
export default defineConfig({
  plugins: [
    tsrxVue(),
    vueJsxVapor({
      macros: true,
      compiler: { runtimeModuleName: "vue-jsx-vapor" },
    }),
  ],
  resolve: {
    alias: {
      "@": fileURLToPath(new URL("src", import.meta.url)),
    },
  },
});
