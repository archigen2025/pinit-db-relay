# HTTPS TCP relay (chisel) so the Mac mini can reach the Supabase pooler from networks that block 5432/6543.
# Credentials come from the AUTH env var set on the Render service (never committed). PORT is set by Render.
FROM jpillora/chisel:1.12.0@sha256:e467dc4198a64a86cc01befb154ef034e74aff26ce16b327160b5a509a8a8748
CMD ["server", "--keepalive", "25s"]
