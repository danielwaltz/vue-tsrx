import { computed, ref } from "vue";

component ListItem(&{
  item,
  multiplier,
}: {
  item: number;
  multiplier: number;
}) {
  const innerItem = ref(item);
  const multipliedItem = computed(() => innerItem.value * multiplier);

  <li>
    {"raw: "}
    {item}
    {"inner:"}
    {innerItem.value}
    {"multiple:"}
    {multipliedItem.value}
  </li>

  <button onClick={() => innerItem.value++}>{"Increment"}</button>
}

component List(&{
  items,
  multiplier,
}: {
  items: number[];
  multiplier: number;
}) {
  for (const item of items) {
    <ListItem {item} {multiplier} />
  }
}

export component App() {
  const count = ref(0);
  const multiplier = ref(2);
  const items = ref<number[]>([]);

  function addToList() {
    items.value.push(count.value);
    count.value = 0;
  }

  <main>
    <h1>{"Hello from TSRX Vue"}</h1>

    <p>{"This is a minimal Vue-compatible TSRX snippet."}</p>

    <button onClick={() => count.value++}>
      {"Count: "}
      {count.value}
    </button>

    <button onClick={() => multiplier.value++}>
      {"Multiplier: "}
      {multiplier.value}
    </button>

    <button onClick={addToList}>{"Add to list"}</button>

    <List items={items.value} multiplier={multiplier.value} />
  </main>
}
