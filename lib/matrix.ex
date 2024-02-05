defmodule MyMath.Matrix do
  @moduledoc """
  Documentation for `Matrix`.
  """

  @enforce_keys [:data]
  defstruct data: []

  @spec single_values_matrix(number, integer, integer) :: %MyMath.Matrix{data: []}
  defp single_values_matrix(_, 0, _), do: %MyMath.Matrix{data: []}
  defp single_values_matrix(_, _, 0), do: %MyMath.Matrix{data: []}

  defp single_values_matrix(value, i, j) do
    data = for _ <- 1..i, do: for(_ <- 1..j, do: value)
    %MyMath.Matrix{data: data}
  end

  defp single_values_matrix(_, 0), do: %MyMath.Matrix{data: []}

  defp single_values_matrix(value, order) do
    data =
      for _ <- 1..order, do: for(_ <- 1..order, do: value)

    %MyMath.Matrix{data: data}
  end

  @spec zeros(integer) :: %MyMath.Matrix{}
  def zeros(order), do: single_values_matrix(0, order)
  def zeros(i, j), do: single_values_matrix(0, i, j)

  @spec ones(integer) :: %MyMath.Matrix{}
  def ones(order), do: single_values_matrix(1, order)
  def ones(i, j), do: single_values_matrix(1, i, j)
end
