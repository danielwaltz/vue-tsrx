import { computed, ref } from "vue";

interface Item {
  id: string;
  count: number;
}

interface ListItemProps {
  item: Item;
  multiplier: number;
  onIncrement: (value: number) => void;
}

component ListItem(&{ item, multiplier, onIncrement }: ListItemProps) {
  const localCount = ref(item.count);
  const multipliedItem = computed(() => localCount.value * multiplier);

  function handleIncrement() {
    localCount.value++;
    onIncrement(localCount.value);
  }

  <li class="flex items-center gap-4">
    <div class="stats shadow">
      <div class="stat place-items-center">
        <div class="stat-title">{"Raw"}</div>
        <div class="stat-value">{item.count}</div>
      </div>

      <div class="stat place-items-center">
        <div class="stat-title">{"Inner"}</div>
        <div class="stat-value">{localCount.value}</div>
      </div>

      <div class="stat place-items-center">
        <div class="stat-title">{"Multiple"}</div>
        <div class="stat-value">{multipliedItem.value}</div>
      </div>
    </div>

    <button class="btn btn-primary" onClick={handleIncrement}>
      {"Increment"}
    </button>
  </li>
}

export component App() {
  const count = ref(0);
  const multiplier = ref(2);
  const items = ref<Item[]>([]);

  function addToList() {
    items.value.push({ id: crypto.randomUUID(), count: count.value });
    count.value = 0;
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
    </div>

    for (const item of items.value; index i; key item.id) {
      function logIncrement(value: number) {
        console.info(`Incremented item ${item.id} to ${value}`);
      }

      <ListItem
        {item}
        multiplier={multiplier.value}
        onIncrement={logIncrement}
      />
    }
  </main>
}
