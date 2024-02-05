defmodule MyMath.Boolean do
  @spec _and(boolean, boolean) :: boolean
  def _and(x, y) do
    case x do
      true -> y
      false -> false
    end
  end

  @spec _or(boolean, boolean) :: boolean
  def _or(x, y) do
    case x do
      true -> true
      false -> y
    end
  end

  @spec _xor(boolean, boolean) :: boolean
  def _xor(x, y) do
    case x do
      true -> not y
      false -> y
    end
  end
end
