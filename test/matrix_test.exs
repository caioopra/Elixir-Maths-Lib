defmodule MatrixTest do
  use ExUnit.Case
  doctest MyMath.Matrix

  test "zeros" do
    assert MyMath.Matrix.zeros(3) == %MyMath.Matrix{data: [[0, 0, 0], [0, 0, 0], [0, 0, 0]]}
    assert MyMath.Matrix.zeros(0) == %MyMath.Matrix{data: []}
    assert MyMath.Matrix.zeros(2, 3) == %MyMath.Matrix{data: [[0, 0, 0], [0, 0, 0]]}
  end

  test "ones" do
    assert MyMath.Matrix.ones(3) == %MyMath.Matrix{data: [[1, 1, 1], [1, 1, 1], [1, 1, 1]]}
    assert MyMath.Matrix.ones(0) == %MyMath.Matrix{data: []}
    assert MyMath.Matrix.ones(2, 3) == %MyMath.Matrix{data: [[1, 1, 1], [1, 1, 1]]}
  end
end
