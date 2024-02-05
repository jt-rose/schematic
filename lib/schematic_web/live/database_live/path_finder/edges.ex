defmodule SchematicWeb.DatabaseLive.PathFinder.Edges do
  def find_edges([child, node, parent | nodes], nodes_with_edges \\ []) do
    child_edge = find_direction(node, child)
    parent_edge = find_direction(node, parent)
    edges = get_line_angle_from_edges(child_edge, parent_edge)

    remaining_nodes = [node, parent | nodes]
    updated_nodes_with_edges = [%{pos: node.pos, edges: edges} | nodes_with_edges]

    if length(remaining_nodes) >= 3 do
      find_edges(remaining_nodes, updated_nodes_with_edges)
    else
      updated_nodes_with_edges
    end
  end

  def find_direction(_node, :right), do: :right
  def find_direction(_node, :left), do: :left

  def find_direction(node, adjacent_node) do
    {c1, r1} = node.pos
    {c2, r2} = adjacent_node.pos

    # find direction from node to adjacent node
    cond do
      c1 > c2 -> :left
      c2 > c1 -> :right
      r1 > r2 -> :top
      r2 > r1 -> :bottom
      true -> :default
    end
  end

  # def get_line_angle_from_edges(edges)
  def get_line_angle_from_edges(edge_1, edge_2) do
    edges = [edge_1, edge_2]

    cond do
      :top in edges and :bottom in edges -> :vertical
      :left in edges and :right in edges -> :horizontal
      :top in edges and :right in edges -> :top_to_right
      :top in edges and :left in edges -> :top_to_left
      :bottom in edges and :right in edges -> :bottom_to_right
      :bottom in edges and :left in edges -> :bottom_to_left
      true -> :default
    end
  end
end
