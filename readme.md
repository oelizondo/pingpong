## Ping Pong in elixir. 

This is a small example making a simple Ping-Pong using ```spawn```, processes, sends, etc.

How to use:
```elixir
{iex_ping, iex_pong} = PingPong.start

send iex_ping {iex_pong, :pong}
```