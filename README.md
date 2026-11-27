# pinit-db-relay

Minimal [chisel](https://github.com/jpillora/chisel) server image for Render.
Lets a client on a network that only allows HTTPS reach a database port through a
WebSocket tunnel. Authentication is provided through the `AUTH` environment variable
on the hosting service; nothing secret lives in this repository.
