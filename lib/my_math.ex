defmodule MyMath do
  @moduledoc """
  Documentation for `MyMath`.
  """
  require Integer

  @spec max([number]) :: number
  def max([]), do: 0

  def max(values) do
    Enum.reduce(values, 0, fn x, acc -> if x > acc, do: x, else: acc end)
  end

  @spec min([number]) :: number
  def min([]), do: 0
  def min([x]), do: x

  def min([x | xs]) do
    min_value = min(xs)
    if x < min_value, do: x, else: min_value
  end

  @spec sum([number]) :: number
  def sum([]), do: 0
  def sum([x]), do: x
  def sum([x | xs]), do: x + sum(xs)

  @spec _length([any]) :: integer
  def _length([]), do: 0
  def _length([_]), do: 1
  def _length([_ | xs]), do: 1 + _length(xs)

  @spec _in(number, [number]) :: boolean
  def _in(_, []), do: false

  def _in(target, [x]) do
    cond do
      target == x -> true
      true -> false
    end
  end

  def _in(target, [x | xs]) do
    cond do
      target == x -> true
      true -> _in(target, xs)
    end
  end

  @doc """
  Counts the number of occurrences of a target in a list.
  """
  @spec count(any, [any]) :: integer
  def count(_, []), do: 0

  def count(target, [x | xs]) do
    cond do
      x == target -> 1 + count(target, xs)
      true -> count(target, xs)
    end
  end

  @doc """
  Reverses a list.
  """
  @spec reverse([any]) :: [any]
  def reverse([]), do: []
  def reverse([x]), do: [x]
  def reverse([x | xs]), do: reverse(xs) ++ [x]

  @doc """
  Maps a function over a list.
  """
  @spec _map(function, [any]) :: [any]
  def _map(_, []), do: []

  def _map(f, [x | xs]), do: [f.(x) | _map(f, xs)]

  @doc """
  Filters a list using a function.
  """
  @spec _filter(function, [any]) :: [any]
  def _filter(_, []), do: []

  def _filter(f, [x | xs]) do
    cond do
      f.(x) -> [x | _filter(f, xs)]
      true -> _filter(f, xs)
    end
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

  @doc """
  Calculates the greatest common divisor between two numbers.
  """
  def gcd(x, y) when y == 0, do: x
  def gcd(x, y), do: gcd(y, rem(x, y))

  def gcd(x, y, z) do
    gcd_helper(x, y, y) |> gcd_helper(z, z)
  end

  defp gcd_helper(x, y, z) do
    cond do
      rem(x, z) == 0 and rem(y, z) == 0 -> z
      true -> gcd_helper(x, y, z - 1)
    end
  end

  @doc """
  Calculates the least common multiple between two numbers.
  """
  def lcm(x, y), do: lcm(x, y, 1)

  defp lcm(x, y, z) do
    cond do
      rem(z, x) == 0 && rem(z, y) == 0 -> z
      true -> lcm(x, y, z + 1)
    end
  end

  @doc """
  Checks if two numbers are coprime (GCD equals 1).
  """
  @spec coprime?(number, number) :: boolean
  def coprime?(x, y) do
    cond do
      gcd(x, y) == 1 -> true
      true -> false
    end
  end
end
