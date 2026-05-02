import { defineHandler } from "nitro";

export default defineHandler(() => ({
  status: "ok",
  timestamp: new Date().toISOString(),
}));
