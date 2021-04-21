defmodule Inmana.Welcomer do
  # Receber um nome uma idade do usuário
  # Se o usuário chamar bana ae tiver idade 43, ele recebe uma mensagem especial
  # Se o usuário for maior de idade, ele recebe uma mensagem normal
  # Se o usuário for menor de idade, retornamos um erro
  # Temos que tratar o nome do usuário para entradas erradas, como BaNaNa, Banana \n

  def welcome(%{"name" => name, "age" => age}) do
    age = String.to_integer(age)

    name
    |> String.trim()
    |> String.downcase()
    # o 1º parametro já vem implicito então nao precisa passar abaixo (name, age)
    |> evaluate(age)
  end

  # tuplas de retorno :ok :error
  defp evaluate("banana", 42) do
    {:ok, "You are very special!"}
  end

  defp evaluate(name, age) when age >= 18 do
    {:ok, "Welcome #{name}"}
  end

  defp evaluate(name, _age) do
    {:error, "You shall not pass #{name}"}
  end

  # IO.inspect(name)
  # IO.inspect(age)
end
