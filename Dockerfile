# HTTPS TCP relay (chisel) so the Mac mini can reach the Supabase pooler from networks that block 5432/6543.
# Only aws-1-ap-northeast-2.pooler.supabase.com:5432/6543 may be tunneled (see entrypoint.sh).
# Credentials come from the RELAY_AUTH env var on the Render service (never committed). PORT is set by Render.
FROM jpillora/chisel:1.12.0@sha256:e467dc4198a64a86cc01befb154ef034e74aff26ce16b327160b5a509a8a8748 AS chisel
FROM busybox:1.36.1-musl@sha256:3c6ae8008e2c2eedd141725c30b20d9c36b026eb796688f88205845ef17aa213
COPY --from=chisel /ko-app/chisel /usr/local/bin/chisel
COPY entrypoint.sh /entrypoint.sh
USER 65532:65532
ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]
