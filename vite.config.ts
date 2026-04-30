import { fileURLToPath, URL } from "node:url";
import tailwindcss from "@tailwindcss/vite";
import tsrxVue from "@tsrx/vite-plugin-vue";
import { defineConfig } from "vite";
import vueJsxVapor from "vue-jsx-vapor/vite";

export default defineConfig({
  plugins: [
    tsrxVue(),
    vueJsxVapor({
      macros: true,
      compiler: { runtimeModuleName: "vue-jsx-vapor" },
    }),
    tailwindcss(),
  ],
  resolve: {
    alias: {
      "@": fileURLToPath(new URL("src", import.meta.url)),
    },
  },
});
