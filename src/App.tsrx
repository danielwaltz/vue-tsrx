import { useSessionStorage } from "@vueuse/core";
import { computed, ref } from "vue";

interface Item {
  id: string;
  count: number;
}

interface ListItemProps {
  item: Item;
  local: number;
  multiplier: number;
  onIncrement: () => void;
}

component ListItem(&{ item, local, multiplier, onIncrement }: ListItemProps) {
  const multipliedItem = computed(() => local * multiplier);

  <li class="flex items-center gap-4">
    <div class="stats shadow">
      <div class="stat place-items-center">
        <div class="stat-title">{"Raw"}</div>
        <div class="stat-value">{item.count}</div>
      </div>

      <div class="stat place-items-center">
        <div class="stat-title">{"Inner"}</div>
        <div class="stat-value">{local}</div>
      </div>

      <div class="stat place-items-center">
        <div class="stat-title">{"Multiple"}</div>
        <div class="stat-value">{multipliedItem.value}</div>
      </div>
    </div>

    <button class="btn btn-primary" onClick={onIncrement}>{"Increment"}</button>
  </li>
}

export component App() {
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

  <main class="flex flex-col gap-6 max-w-4xl text-lg mx-auto p-8">
    <h1 class="text-3xl text-primary font-semibold">{"Hello from TSRX Vue"}</h1>

    <p>{"This is a minimal Vue-compatible TSRX snippet."}</p>

    <div class="flex items-center gap-4">
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

      <button class="btn btn-primary" onClick={addToList}>
        {"Add to list"}
      </button>

      <button class="btn btn-error btn-soft" onClick={resetList}>
        {"Reset list"}
      </button>
    </div>

    for (const item of items.value; index i; key item.id) {
      const local = ref(item.count);

      function onIncrement() {
        local.value++;
      }

      <ListItem
        {item}
        local={local.value}
        multiplier={multiplier.value}
        {onIncrement}
      />
    }
  </main>
}
