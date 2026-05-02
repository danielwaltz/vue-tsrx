import { useSessionStorage } from "@vueuse/core";
import { computed, ref } from "vue";
import { VaporRouterLink, VaporRouterView } from "vue-router";

export component App() {
  <div class="min-h-dvh">
    <header class="bg-base-300 shadow-xl">
      <nav class="navbar flex max-w-4xl mx-auto">
        <VaporRouterLink to="/" class="btn btn-ghost text-xl">
          {"TSRX Vue"}
        </VaporRouterLink>

        <a
          href="https://github.com/danielwaltz/vue-tsrx"
          target="_blank"
          rel="noopener noreferrer"
          class="btn btn-sm btn-link"
        >
          {"View Source"}
        </a>

        <ul class="menu menu-horizontal ms-auto gap-1">
          <li>
            <VaporRouterLink to="/" activeClass="bg-neutral">
              {"Home"}
            </VaporRouterLink>
          </li>

          <li>
            <VaporRouterLink to="/tasks" activeClass="bg-neutral">
              {"Tasks"}
            </VaporRouterLink>
          </li>

          <li>
            <VaporRouterLink to="/health" activeClass="bg-neutral">
              {"Health"}
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
