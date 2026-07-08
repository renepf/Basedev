export default function Home() {
  return (
    <main style={{ fontFamily: "system-ui", padding: 40 }}>
      <h1>Next.js full-stack base template</h1>
      <p>Next.js (app router) + Prisma + Postgres.</p>
      <p>
        Health: <a href="/api/health">/api/health</a>
      </p>
    </main>
  );
}
