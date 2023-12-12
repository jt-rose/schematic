defmodule SchematicWeb.DatabaseLive.PathFinder.IdealPathTest do
  use ExUnit.Case

  import SchematicWeb.DatabaseLive.PathFinder.IdealPath

  describe "Ideal Path" do
    test "correct midpoint" do
      assert get_midpoint(5, 2) == 3
      assert get_midpoint(2, 12) == 7
      assert get_midpoint(2, 2) == nil
    end

    test "correct ideal path for straight horizontal line" do
      path = get_ideal_path({2, 5}, {5, 5})
      expected = [{2, 5}, {3, 5}, {4, 5}, {5, 5}]
      assert path == expected
    end

    test "correct ideal path for z-shaped connector" do
      path = get_ideal_path({2, 5}, {5, 10})
      expected = [{2, 5}, {3, 5}, {3, 6}, {3, 7}, {3, 8}, {3, 9}, {3, 10}, {4, 10}, {5, 10}]
      assert path == expected
    end

    # TODO: handle even and odd length array midpoints

    test "correct ideal path for rows and columns off by one" do
      path_a = get_ideal_path({3, 5}, {4, 7})
      expected_a = [{3, 5}, {3, 6}, {3, 7}, {4, 7}]
      assert path_a == expected_a

      path_b = get_ideal_path({3, 5}, {7, 6})
      expected_b = [{3, 5}, {4, 5}, {5, 5}, {5, 6}, {6, 6}, {7, 6}]
      assert path_b == expected_b

      path_c = get_ideal_path({3, 5}, {4, 6})
      expected_c = [{3, 5}, {3, 6}, {4, 6}]
      assert path_c == expected_c
    end
  end
end
