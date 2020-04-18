defmodule Graft.Client do
    def request(server, entry) do
        case GenStateMachine.call(server, {:entry, entry}) do
            {:ok, response} -> response
            {:error, {:redirect, leader}} -> request(leader, entry)
            {:error, msg} -> msg
        end
    end
end
