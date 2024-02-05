defmodule SchematicWeb.DatabaseLive.PathFinder.Step do
  defstruct pos: {0, 0}, edges: nil, parent: nil

  # calculate the next steps in all directions
  def get_next_steps({column, row}) do
    t = %{pos: {column, row - 1}}
    r = %{pos: {column + 1, row}}
    b = %{pos: {column, row + 1}}
    l = %{pos: {column - 1, row}}

    [t, r, b, l]
  end

  # collect lineage of parents of a node
  def trace_parents(node, children \\ []) do
    parent = node.parent

    case parent do
      nil -> [node | children]
      _ -> trace_parents(parent, [node | children])
    end
  end
end
