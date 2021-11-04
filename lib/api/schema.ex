defmodule Chat.Api.Schema do
  use Absinthe.Schema

  query do
    field :things, :string do
      resolve (fn _, _ ->
        {:ok, "hiworlsd"}
      end)
    end
  end

end
