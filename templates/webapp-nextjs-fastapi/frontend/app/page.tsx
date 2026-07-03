async function getApiHealth() {
  const base = process.env.NEXT_PUBLIC_API_BASE_URL ?? "http://localhost:8000";
  try {
    const r = await fetch(`${base}/health`, { cache: "no-store" });
    return (await r.json()).status as string;
  } catch {
    return "unreachable";
  }
}

export default async function Home() {
  const api = await getApiHealth();
  return (
    <main style={{ fontFamily: "system-ui", padding: 40 }}>
      <h1>Webapp base template</h1>
      <p>Next.js + FastAPI + Postgres.</p>
      <p>API health: <strong>{api}</strong></p>
    </main>
  );
}
