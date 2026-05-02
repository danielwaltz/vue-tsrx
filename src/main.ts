import { PiniaColada } from "@pinia/colada";
import { createHead } from "@unhead/vue/client";
import { createPinia } from "pinia";
import { createVaporApp } from "vue";
import { createRouter, createWebHistory } from "vue-router";
import { handleHotUpdate, routes } from "vue-router/auto-routes";
import { App } from "./App.tsrx";
import "@/main.css";

const app = createVaporApp(App);

const head = createHead();

app.use(head);

const router = createRouter({
  history: createWebHistory(),
  routes,
});

if (import.meta.hot) {
  handleHotUpdate(router);
}

app.use(router);

const pinia = createPinia();

app.use(pinia);
app.use(PiniaColada);

app.mount("#app");
