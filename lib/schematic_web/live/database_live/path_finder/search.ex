defmodule SchematicWeb.DatabaseLive.PathFinder.Search do
  @moduledoc """
  Implement a Breadth First Search on the database grid for mapping
  connector lines between primary and foreign keys
  """

  alias SchematicWeb.DatabaseLive.PathFinder

  @type pos :: {integer(), integer()}
  @type bfs_node :: %{pos: pos(), parent: bfs_node() | nil}
  @type bfs :: %{target: pos(), queue: %Qex{}, blocked_tiles: list(pos())}

  def find_path(start, target, blocked_tiles) do
    # set up starting node and bfs search parameters
    starting_node = %{pos: start.pos, parent: nil}

    bfs = %{
      target: target.pos,
      queue: Qex.new(),
      blocked_tiles: [start.pos | blocked_tiles],
      start_from: start.from,
      target_from: target.from
    }

    # begin recursive bfs search
    find_next_step({:value, starting_node}, bfs, 0)
  end

  # return nil when queue is completed without hitting target
  # when target reached, return list of nodes traversed to reach target
  # when target not reached and remaining steps in queue, continue to traverse
  def find_next_step(:empty, _bfs, _num), do: nil

  def find_next_step({:value, node}, bfs, _num) when node.pos == bfs.target do
    # TODO: better optimize
    nodes = PathFinder.Step.trace_parents(node)
    nodes_with_bookends = [bfs.start_from | nodes] ++ [bfs.target_from]
    PathFinder.Edges.find_edges(nodes_with_bookends)
  end

  def find_next_step({:value, node}, bfs, num) do
    # calculate next available steps from current position
    next_steps =
      node.pos
      |> PathFinder.Step.get_next_steps()
      |> filter_open_steps(bfs.blocked_tiles)

    # enqueue next steps with parent info and get first entry in queue
    {front_item, updated_queue} =
      bfs.queue
      |> push_many_to_queue(next_steps, node)
      |> Qex.pop()

    # update bfs queue and track next steps as already found
    updated_bfs = %{
      bfs
      | queue: updated_queue,
        blocked_tiles: Enum.map(next_steps, fn x -> x.pos end) ++ bfs.blocked_tiles
    }

    # repeat for next step in the queue
    find_next_step(front_item, updated_bfs, num + 1)
  end

  # push multiple new items into the queue and convert into nodes
  def push_many_to_queue(queue, items, parent) do
    Enum.reduce(items, queue, fn item, q ->
      Qex.push(q, %{pos: item.pos, parent: parent})
    end)
  end

  # remove any steps that are currently unavailable
  def filter_open_steps(steps, blocked_steps) do
    Enum.filter(steps, fn step -> step.pos not in blocked_steps end)
  end
end
