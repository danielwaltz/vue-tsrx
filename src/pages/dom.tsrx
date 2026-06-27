import { useSeoMeta } from "@unhead/vue";
import { useElementSize, usePointer } from "@vueuse/core";
import { shallowRef } from "vue";

export function page() @{
  useSeoMeta({ title: "DOM" });

  const pointerRef = shallowRef<HTMLElement | null>(null);

  const { x, y } = usePointer({ target: pointerRef });

  const elementSizeRef = shallowRef<HTMLElement | null>(null);

  const { width, height } = useElementSize(elementSizeRef);

  <>
    <h1 class="text-3xl font-semibold">DOM</h1>

    <p>This page demonstrates DOM/template ref usage.</p>

    <div ref={pointerRef} class="bg-base-200 p-4 rounded-lg text-center">
      Pointer position:
      {x.value}
      ,
      {y.value}
    </div>

    <div ref={elementSizeRef} class="bg-base-200 p-4 rounded-lg text-center">
      Element size:
      {width.value}
      px,
      {height.value}
      px
    </div>
  </>
}
