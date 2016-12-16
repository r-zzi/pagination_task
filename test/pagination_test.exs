defmodule PaginationTest do	
  use ExUnit.Case
  doctest Pagination

  test "Simple" do
    assert Pagination.get(1, 1) == [1]
    assert Pagination.get(6, 3) == [ 1, 2, 3, 4, 5, 6 ]
    assert Pagination.get(7, 2) == [ 1, 2, 3, "...", 5, 6, 7 ]
    assert Pagination.get(7, 3) == [ 1, 2, 3, 4, 5, 6, 7 ]
    assert Pagination.get(100, 50) == [ 1, 2, 3, "...", 49, 50, 51, "...", 98, 99, 100 ]
    assert Pagination.get(100, 1) == [ 1, 2, 3, "...", 98, 99, 100 ]
    assert Pagination.get(100, 100) == [ 1, 2, 3, "...", 98, 99, 100 ]
    assert Pagination.get(11, 6) == [ 1, 2, 3, "...", 5, 6, 7, "...", 9, 10, 11 ]
    assert Pagination.get(9, 5) == [ 1, 2, 3, 4, 5, 6, 7, 8, 9 ]
    assert Pagination.get(11, 5) == [ 1, 2, 3, 4, 5, 6, "...", 9, 10, 11 ]
  end
end
