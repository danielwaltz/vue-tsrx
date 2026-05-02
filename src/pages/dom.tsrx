import { useQuery } from "@pinia/colada";
import { useSeoMeta } from "@unhead/vue";
import { useElementSize, usePointer } from "@vueuse/core";
import { ref } from "vue";

export default component() {
  useSeoMeta({ title: "DOM" });

  <h1 class="text-3xl font-semibold">{"DOM"}</h1>

  <p>{"This page demonstrates DOM/template ref usage."}</p>

  const pointerRef = ref<HTMLElement | null>(null);

  const { x, y } = usePointer({ target: pointerRef });

  <div ref={pointerRef} class="bg-base-200 p-4 rounded-lg text-center">
    {`Pointer position: (${x.value}, ${y.value})`}
  </div>

  const elementSizeRef = ref<HTMLElement | null>(null);

  const { width, height } = useElementSize(elementSizeRef);

  <div ref={elementSizeRef} class="bg-base-200 p-4 rounded-lg text-center">
    {`Element size: (${width.value}px, ${height.value}px)`}
  </div>
}
