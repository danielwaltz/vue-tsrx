import { fileURLToPath, URL } from "node:url";
import tailwindcss from "@tailwindcss/vite";
import tsrxVue from "@tsrx/vite-plugin-vue";
import { nitro } from "nitro/vite";
import { defineConfig } from "vite";
import vueJsxVapor from "vue-jsx-vapor/vite";
import vueRouter from "vue-router/vite";

export default defineConfig({
  plugins: [
    vueRouter({ extensions: [".tsrx"] }),
    tsrxVue(),
    vueJsxVapor({
      macros: true,
      compiler: { runtimeModuleName: "vue-jsx-vapor" },
    }),
    tailwindcss(),
    nitro(),
  ],
  resolve: {
    alias: {
      "@": fileURLToPath(new URL("src", import.meta.url)),
    },
  },
});
