import { danielwaltz } from "@danielwaltz/eslint-config";
import tsrx from "@tsrx/eslint-plugin";
import * as unhead from "@unhead/eslint-plugin";
import { defineConfig } from "eslint/config";

const projectConfig = defineConfig(
  {
    files: ["**/*.tsrx"],
    extends: [tsrx.configs.recommended],
    rules: {
      "no-dupe-args": "off",
      "no-undef": "off",
      "no-useless-assignment": "off",
      "unicorn/consistent-function-scoping": "off",
      "unused-imports/no-unused-imports": "off",
      "unused-imports/no-unused-vars": "off",
    },
  },
  {
    files: ["**/pages/**/*.tsrx"],
    extends: [unhead.configs.recommended],
    rules: {
      "import/no-default-export": "off",
    },
  },
);

export default danielwaltz().append(projectConfig);
