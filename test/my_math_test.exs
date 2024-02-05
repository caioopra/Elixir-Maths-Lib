defmodule MyMathTest do
  use ExUnit.Case
  doctest MyMath

  test "max" do
    assert MyMath.max([1, 2, 3]) == 3
    assert MyMath.max([1, 2, 3, 4]) == 4
    assert MyMath.max([]) == 0
  end

  test "power" do
    assert MyMath.pow(2, 0) == 1
    assert MyMath.pow(2, 2) == 4
    assert MyMath.pow(2, 3) == 8
  end

  test "absolute" do
    assert MyMath.absolute(-1) == 1
    assert MyMath.absolute(1) == 1
  end

  test "squared" do
    assert MyMath.squared(2) == 4
    assert MyMath.squared(0) == 1
    assert MyMath.squared(-2) == 4
  end

  test "average" do
    assert MyMath.average([1, 2, 3]) == 2
    assert MyMath.average([1, 2, 3, 4]) == 2.5
    assert MyMath.average([3, 3, 3]) == 3
    assert MyMath.average([]) == 0
  end

  test "second degree equation" do
    assert MyMath.solve_second_degree(1, 0, -1) == {:ok, {1.0, -1.0}}
    assert MyMath.solve_second_degree(1, 0, 1) == {:error, "No real roots"}
  end

  test "euclidian distance" do
    assert MyMath.euclidian_distance({0, 0, 0}, {3, 4, 5}) == {:ok, 7.07107}
    assert MyMath.euclidian_distance({0, 0}, {3, 4}) == {:ok, 5.0}

    assert MyMath.euclidian_distance({0, 0}, {3}) ==
             {:error, "Points must have the same dimension"}
  end
end
