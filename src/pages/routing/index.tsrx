import { useSeoMeta } from "@unhead/vue";
import { VaporRouterLink } from "vue-router";
import { TASKS } from "@/constants";

export default component() {
  useSeoMeta({ title: "Routing" });

  <h1 class="text-3xl font-semibold">{"Routing"}</h1>

  <p>{"This page demonstrates routing."}</p>

  for (const task of TASKS) {
    const { id, title, description } = task;

    <div class="card bg-base-200 shadow-md">
      <div class="card-body">
        <h2 class="card-title">{title}</h2>

        <p>{description}</p>

        <div class="card-actions justify-end">
          <VaporRouterLink to={`/routing/${id}`} class="btn btn-primary">
            {"View Details →"}
          </VaporRouterLink>
        </div>
      </div>
    </div>
  }
}
