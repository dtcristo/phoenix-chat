defmodule ChatWeb.ChatChannel do
  use ChatWeb, :channel

  def join("chat:" <> _room, %{"name" => name}, socket) do
    {:ok, assign(socket, :name, name)}
  end

  def handle_in("new_msg", %{"text" => text}, socket) do
    broadcast(
      socket, "new_msg", %{"name" => socket.assigns.name, "text" => text}
    )
    {:noreply, socket}
  end

  def terminate(_reason, _socket) do
  end
end
