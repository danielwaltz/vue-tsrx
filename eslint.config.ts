import { danielwaltz } from "@danielwaltz/eslint-config";
import tsrx from "@tsrx/eslint-plugin";
import { defineConfig } from "eslint/config";

const tsrxConfig = defineConfig({
  files: ["**/*.tsrx"],
  extends: [tsrx.configs.recommended],
  rules: {
    "no-dupe-args": "off",
    "no-undef": "off",
    "unused-imports/no-unused-imports": "off",
    "unused-imports/no-unused-vars": "off",
  },
});

export default danielwaltz().append(tsrxConfig);
