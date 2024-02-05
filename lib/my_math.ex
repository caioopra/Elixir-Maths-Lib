defmodule MyMath do
  @moduledoc """
  Documentation for `MyMath`.
  """
  require Integer

  @doc """
  Hello world.

  ## Examples

      iex> MyMath.hello()
      :world

  """
  def hello do
    :world
  end

  @spec max([number]) :: number
  def max([]), do: 0

  def max(values) do
    Enum.reduce(values, 0, fn x, acc -> if x > acc, do: x, else: acc end)
  end

  @doc """
  Calculates the power operation between a base and exponent.
  """
  @spec pow(number, number) :: number
  def pow(_, 0), do: 1
  def pow(x, n) when Integer.is_odd(n), do: x * pow(x, n - 1)

  def pow(x, y) do
    result = pow(x, div(y, 2))
    result * result
  end

  @spec squared(number) :: number
  def squared(0), do: 1
  def squared(x), do: x * x

  @spec absolute(number) :: number
  def absolute(x) when x < 0, do: -x
  def absolute(x), do: x

  @spec average([number]) :: number
  def average([]), do: 0

  def average(values) do
    sum = Enum.reduce(values, fn x, acc -> x + acc end)
    sum / length(values)
  end

  @spec solve_second_degree(number, number, number) ::
          {:error, String.t()} | {:ok, {float, float}}
  def solve_second_degree(a, b, c) do
    delta = b * b - 4 * a * c

    cond do
      delta < 0 ->
        {:error, "No real roots"}

      true ->
        x1 = (-b + :math.sqrt(delta)) / (2 * a)
        x2 = (-b - :math.sqrt(delta)) / (2 * a)
        {:ok, {x1, x2}}
    end
  end

  @doc """
  Calculates the euclidian distance between two points with dimension n.
  """
  @spec euclidian_distance(tuple, tuple) :: {:error, String.t()} | {:ok, float}
  def euclidian_distance(point_a, point_b) when tuple_size(point_a) != tuple_size(point_b) do
    {:error, "Points must have the same dimension"}
  end

  def euclidian_distance(point_a, point_b) do
    result =
      :math.sqrt(
        Enum.reduce(0..(tuple_size(point_a) - 1), 0, fn i, acc ->
          acc + (elem(point_a, i) - elem(point_b, i)) * (elem(point_a, i) - elem(point_b, i))
        end)
      )
      |> Float.round(5)

    {:ok, result}
  end
end
