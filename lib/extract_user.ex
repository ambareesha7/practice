defmodule Practice.ExtractUser do
  @moduledoc """
  you can call the funtion like this\n
   user = %{"login" => "login", "email" => "some@mail", "password" => "password"}\n
   Practice.ExtractUser.extract_user(user)

  """
  def extract_user(user) do
    with {:ok, login} <- extract_login(user),
         {:ok, email} <- extract_email(user),
         {:ok, password} <- extract_password(user) do
      {:ok, %{login_user: login, email: email, password: password}}
    end
  end

  defp extract_login(%{"login" => login}), do: {:ok, login}
  defp extract_login(_), do: {:error, "login is missing"}

  defp extract_email(%{"email" => email}), do: {:ok, email}
  defp extract_email(_), do: {:error, "email is missing"}

  defp extract_password(%{"password" => password}), do: {:ok, password}
  defp extract_password(_), do: {:error, "password is missing"}
end
