import { PiniaColada } from "@pinia/colada";
import { createPinia } from "pinia";
import { createVaporApp } from "vue";
import { App } from "./App.tsrx";
import "@/main.css";

const app = createVaporApp(App);

app.use(createPinia());
app.use(PiniaColada);

app.mount("#app");
