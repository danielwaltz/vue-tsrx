import { PiniaColada } from "@pinia/colada";
import { createPinia } from "pinia";
import { createVaporApp } from "vue";
import { createRouter, createWebHistory } from "vue-router";
import { handleHotUpdate, routes } from "vue-router/auto-routes";
import { App } from "./App.tsrx";
import "@/main.css";

const app = createVaporApp(App);

const router = createRouter({
  history: createWebHistory(),
  routes,
});

if (import.meta.hot) {
  handleHotUpdate(router);
}

app.use(router);
app.use(createPinia());
app.use(PiniaColada);

app.mount("#app");
