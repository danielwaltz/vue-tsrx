import { useHead } from "@unhead/vue";
import { VaporRouterLink, VaporRouterView } from "vue-router";

export component App() {
  useHead({ titleTemplate: "%s | Vue TSRX" });

  <div class="min-h-dvh">
    <header class="bg-base-200 font-semibold shadow-sm">
      <nav class="navbar flex-wrap max-w-4xl mx-auto">
        <VaporRouterLink to="/" class="btn btn-ghost text-xl">
          {"TSRX Vue"}
        </VaporRouterLink>

        <a
          href="https://github.com/danielwaltz/vue-tsrx"
          target="_blank"
          rel="noopener noreferrer"
          class="btn btn-link me-auto"
        >
          {"View Source"}
        </a>

        <ul class="menu menu-horizontal gap-1">
          <li>
            <VaporRouterLink to="/" activeClass="bg-base-300">
              {"Home"}
            </VaporRouterLink>
          </li>

          <li>
            <VaporRouterLink to="/routing" activeClass="bg-base-300">
              {"Routing"}
            </VaporRouterLink>
          </li>

          <li>
            <VaporRouterLink to="/dom" activeClass="bg-base-300">
              {"DOM"}
            </VaporRouterLink>
          </li>

          <li>
            <VaporRouterLink to="/data" activeClass="bg-base-300">
              {"Data"}
            </VaporRouterLink>
          </li>
        </ul>
      </nav>
    </header>

    <main class="flex flex-col gap-6 max-w-4xl text-lg mx-auto p-8">
      <VaporRouterView />
    </main>
  </div>
}
