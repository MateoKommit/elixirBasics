defmodule KVServer do
  @moduledoc """
  Documentation for `KVServer`.
  """

  require Logger

  defp write_line(line, socket) do
    :gen_tcp.send(socket, line)
  end

  defp read_line(socket) do
    {:ok, data} = :gen_tcp.recv(socket, 0)
    data
  end

  defp serve(socket) do
    socket |> read_line() |> write_line(socket)
    # write_line(read_line(socket), socket)
    serve(socket)
  end

  @spec loop_acceptor(port | {:"$inet", atom, any}) :: no_return
  defp loop_acceptor(socket) do
    {:ok, client} = :gen_tcp.accept(socket)

    serve_function = fn -> serve(client) end
    {:ok, pid} = Task.Supervisor.start_child(KVServer.TaskSupervisor, serve_function)

    :ok =  :gen_tcp.controlling_process(client, pid)
    loop_acceptor(socket)
  end

  @spec accept(char) :: no_return
  def accept(port) do
    {:ok, socket} = :gen_tcp.listen(
      port,
      [:binary, packet: :line, active: false, reuseaddr: true]
    )
    Logger.info("Accepting connections on port #{port}")
    loop_acceptor(socket)
  end

end
