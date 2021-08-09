defmodule Practice.Password do
  @moduledoc """
  Generate diferent combination of random passwords
  """
  @doc """
  Generate password with mix of alphabets(small, capital)\n
  numbers and symbols
  """
  def alpha_num(pass_length \\ 4) do
    alphabet = alphabets()
    alph_cap = alphabet |> String.upcase()
    numbers = "0123456789"
    symb = "!@#$%^&*()+_-"

    alphnum =
      Enum.join([alphabet, alph_cap, numbers, symb])
      |> String.split("", trim: true)
      |> Enum.shuffle()

    pass = Enum.take_random(alphnum, pass_length) |> Enum.join()
    IO.puts("Password: #{pass}")
    IO.puts("Password length: #{String.length(pass)}")
  end

  @doc """
  Generate random number password
  """
  def num(pass_length \\ 4) do
    pass =
      Enum.take_random(0..10, pass_length)
      |> Enum.join()
      |> String.slice(0..(pass_length - 1))

    IO.puts("Password: #{pass}")
    IO.puts("Password length: #{String.length(pass)}")
  end

  @doc """
  Generate random password with alphabets(small, caps)
  """
  def alpha(pass_length \\ 4) do
    alphabet = alphabets()
    alph_cap = alphabet |> String.upcase()

    alphnum =
      Enum.join([alphabet, alph_cap])
      |> String.split("", trim: true)
      |> Enum.shuffle()

    pass = Enum.take_random(alphnum, pass_length) |> Enum.join()
    IO.puts("Password: #{pass}")
    IO.puts("Password length: #{String.length(pass)}")
  end

  @doc """
  Generate random UUID\n
  this function uses `Ecto.UUID.autogenerate()`
  """
  def uuid do
    uuid = Ecto.UUID.autogenerate()
    IO.puts("UUID: #{uuid}")
    IO.puts("UUID length: #{String.length(uuid)}")
  end

  defp alphabets do
    "abcdefghijklmnopqrstuvwxyz"
  end
end
