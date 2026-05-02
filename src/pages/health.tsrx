import { useQuery } from "@pinia/colada";
import { useSeoMeta } from "@unhead/vue";

export default component() {
  useSeoMeta({ title: "Health" });

  const { state, asyncStatus, refetch } = useQuery(
    {
      key: ["health"],
      query: async () => {
        await new Promise((resolve) => setTimeout(resolve, 500));
        return fetch("/api/health").then((res) => res.json());
      },
    },
  );

  <h1 class="text-3xl font-semibold">{"Health"}</h1>

  <p>{"This page demonstrates data fetching."}</p>

  <div class="mockup-code">
    <pre>
      <code>
        if (state.value.status === "pending") {
          {"Loading health check..."}
        } else {
          {`Status: ${state.value.data.status} Time: ${state.value.data.timestamp}`}
        }
      </code>
    </pre>
  </div>

  <button
    disabled={asyncStatus.value === "loading"}
    class="btn btn-primary self-start"
    onClick={() => refetch()}
  >
    {"Refresh"}
  </button>
}
