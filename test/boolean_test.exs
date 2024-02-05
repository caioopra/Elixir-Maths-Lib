defmodule BooleanTest do
  use ExUnit.Case
  doctest MyMath.Boolean

  test "and" do
    assert MyMath.Boolean._and(true, true) == true
    assert MyMath.Boolean._and(true, false) == false
    assert MyMath.Boolean._and(false, true) == false
    assert MyMath.Boolean._and(false, false) == false
  end
end
