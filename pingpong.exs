defmodule PingPong do
  def ping do
    receive do
      {sender, :pong} ->
        IO.puts "PONG"
        :timer.sleep(1000)
        send sender, {self, :ping}
    end
    ping
  end

  def pong do
   receive do
    {sender, :ping} ->
      IO.puts "PING"
      :timer.sleep(1000)
      send sender, {self, :pong}
   end 
   pong
  end

  def start do
    ping_pid = spawn(__MODULE__, :ping, [])
    pong_pid = spawn(__MODULE__, :pong, [])
    {ping_pid, pong_pid}
  end
end