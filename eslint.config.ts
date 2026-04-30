import { danielwaltz } from "@danielwaltz/eslint-config";
import tsrx from "@tsrx/eslint-plugin";
import { defineConfig } from "eslint/config";

const tsrxConfig = defineConfig({
  files: ["**/*.tsrx"],
  extends: [tsrx.configs.recommended],
  rules: {
    "no-dupe-args": "off",
    "no-undef": "off",
  },
});

export default danielwaltz().append(tsrxConfig);
