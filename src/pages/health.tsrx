import { useQuery } from "@pinia/colada";

export default component() {
  const { state } = useQuery(
    {
      key: ["health"],
      query: async () => {
        await new Promise((resolve) => setTimeout(resolve, 1000));
        return fetch("/api/health").then((res) => res.json());
      },
    },
  );

  <h1 class="text-3xl text-primary font-semibold">{"Health Check"}</h1>

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
}
