defmodule SchematicWeb.DatabaseLive.PathFinder.Bfs do
  @moduledoc """
  Implement a Breadth First Search on the database grid for mapping
  connector lines between primary and foreign keys
  """
  @type pos :: {integer(), integer()}
  @type bfs_node :: %{value: pos(), parent: bfs_node() | nil}
  @type bfs :: %{target: pos(), queue: %Qex{}, blocked_tiles: list(pos())}

  def find_path(start_pos, end_pos, blocked_tiles) do
    # set up starting node and bfs search parameters
    # NOTE: blocked_tiles should include grid boundary tiles
    starting_node = %{value: start_pos, parent: nil}

    bfs = %{
      target: end_pos,
      queue: Qex.new(),
      blocked_tiles: [start_pos | blocked_tiles]
    }

    # begin recursive bfs search
    find_next_step({:value, starting_node}, bfs)
  end

  # return nil when queue is completed without hitting target
  # when target reached, return list of nodes traversed to reach target
  # when target not reached and remaining steps in queue, continue to traverse
  def find_next_step(:empty, _bfs), do: nil
  def find_next_step({:value, node}, bfs) when node.value == bfs.target, do: trace_parents(node)

  def find_next_step({:value, node}, bfs) do
    # calculate next available steps from current position
    next_steps =
      node.value
      |> get_next_steps()
      |> filter_open_steps(bfs.blocked_tiles)

    # enqueue next steps with parent info and get first entry in queue
    {front_item, updated_queue} =
      bfs.queue
      |> push_many_to_queue(next_steps, node)
      |> Qex.pop()

    # update bfs queue and track next steps as already found
    updated_bfs = %{bfs | queue: updated_queue, blocked_tiles: next_steps ++ bfs.blocked_tiles}

    # repeat for next step in the queue
    find_next_step(front_item, updated_bfs)
  end

  # collect lineage of parents of a node
  def trace_parents(node, parents \\ []) do
    parent = node.parent

    case parent do
      nil -> [node.value | parents]
      _ -> trace_parents(parent, [node.value | parents])
    end
  end

  # push multiple new items into the queue and convert into nodes
  def push_many_to_queue(queue, items, parent) do
    Enum.reduce(items, queue, fn item, q -> Qex.push(q, %{value: item, parent: parent}) end)
  end

  # calculate the next steps in all directions
  def get_next_steps({column, row}) do
    t = {column, row - 1}
    r = {column + 1, row}
    b = {column, row + 1}
    l = {column - 1, row}

    [t, r, b, l]
  end

  # remove any steps that are currently unavailable
  def filter_open_steps(steps, blocked_steps) do
    Enum.filter(steps, fn step -> step not in blocked_steps end)
  end
end
