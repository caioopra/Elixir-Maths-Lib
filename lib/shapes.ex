defmodule Identicon.Shapes.Triangle do
  @moduledoc """
  Documentation for `Triangle`.
  """

  @doc """
  Checks if a triangle exists given it's sides.
  """
  @spec exists?(number, number, number) :: boolean
  def exists?(a, b, c) do
    a + b > c and a + c > b and b + c > a
  end

  @doc """
  Calculates the perimeter of a triangle.
  """
  @spec perimeter(number, number, number) :: number
  def perimeter(a, b, c) do
    a + b + c
  end

  @doc """
  Calculates the area of a triangle.
  """
  @spec area(number, number) :: number
  def area(base, height) do
    base * height / 2
  end
end

