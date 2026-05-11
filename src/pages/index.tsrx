import { useSeoMeta } from "@unhead/vue";
import { useSessionStorage } from "@vueuse/core";
import { computed, ref } from "vue";

interface Item {
  id: string;
  count: number;
}

interface ListItemProps {
  item: Item;
  multiplier: number;
}

component ListItem(&{ item, multiplier }: ListItemProps) {
  const local = ref(item.count);

  function onIncrement() {
    local.value++;
  }

  const multipliedItem = computed(() => local.value * multiplier);

  <li class="flex items-center gap-4">
    <div class="stats bg-base-200 shadow-md">
      <div class="stat place-items-center">
        <div class="stat-title">{"Raw"}</div>
        <div class="stat-value">{item.count}</div>
      </div>

      <div class="stat place-items-center">
        <div class="stat-title">{"Inner"}</div>
        <div class="stat-value">{local.value}</div>
      </div>

      <div class="stat place-items-center">
        <div class="stat-title">{"Multiple"}</div>
        <div class="stat-value">{multipliedItem.value}</div>
      </div>
    </div>

    <button class="btn btn-primary btn-outline" onClick={onIncrement}>
      {"Increment"}
    </button>
  </li>
}

export default component() {
  useSeoMeta({ title: "Home" });

  const count = ref(0);
  const multiplier = ref(2);
  const items = useSessionStorage<Item[]>("items", []);

  function addToList() {
    items.value.push({ id: crypto.randomUUID(), count: count.value });
    count.value = 0;
  }

  function resetList() {
    items.value = [];
  }

  <h1 class="text-3xl font-semibold">{"Home"}</h1>

  <p>{"This page demonstrates state management and reactive updates."}</p>

  <div class="flex flex-wrap items-center gap-4">
    <button class="btn btn-primary btn-outline" onClick={() => count.value++}>
      {"Count: "}
      {count.value}
    </button>

    <button
      class="btn btn-primary btn-outline"
      onClick={() => multiplier.value++}
    >
      {"Multiplier: "}
      {multiplier.value}
    </button>

    <button class="btn btn-primary" onClick={addToList}>{"Add to list"}</button>

    <button class="btn btn-error btn-soft" onClick={resetList}>
      {"Reset list"}
    </button>
  </div>

  if (items.value.length > 0) {
    <ul class="flex flex-col gap-4">
      for (const item of items.value; key item.id) {
        <ListItem {item} multiplier={multiplier.value} />
      }
    </ul>
  }
}
