import { useSeoMeta } from "@unhead/vue";
import { computed } from "vue";
import { useRoute, VaporRouterLink } from "vue-router";
import { TASKS } from "@/constants";

export default component() {
  const route = useRoute("/tasks/[id]");

  const task = computed(() => TASKS.find((t) => t.id === route.params.id));

  useSeoMeta({ title: () => task.value?.title || "Task Details" });

  <VaporRouterLink to="/tasks" class="btn btn-primary btn-outline self-start">
    {"← Back to Tasks"}
  </VaporRouterLink>

  if (!task.value) {
    <p>{"Task not found."}</p>
    return;
  }

  <h1 class="text-3xl font-semibold">{task.value.title}</h1>

  <p>{task.value.description}</p>
}
