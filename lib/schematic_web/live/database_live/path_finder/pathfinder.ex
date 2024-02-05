defmodule SchematicWeb.DatabaseLive.Pathfinder do
  alias SchematicWeb.DatabaseLive.PathFinder

  def generate_connectors(db, blocked_tiles) do
    for rel <- db.table_relationships,
        do: trace_path(db, rel, blocked_tiles)
  end

  # get leftside starting position of PK-FK columns
  # - find {x, y}, calculate row based on positioning
  # determine left-right balance based on distance
  # add column-width for right-side
  # use that to determine from value of first step
  def trace_path(db, table_relationship, blocked_tiles) do
    # get pk and fk tables
    pk_id = table_relationship.primary_key_column_id
    fk_id = table_relationship.foreign_key_column_id

    pk_table = PathFinder.Bookends.find_table_with_key_column(db, pk_id)
    fk_table = PathFinder.Bookends.find_table_with_key_column(db, fk_id)

    # find rightside pos of each column
    pk_rightside_pos = PathFinder.Bookends.get_rightside_pos(pk_table, pk_id)
    fk_rightside_pos = PathFinder.Bookends.get_rightside_pos(fk_table, fk_id)

    # determine if either should switch to leftside
    [lower, higher] = PathFinder.Bookends.get_bookends(pk_rightside_pos, fk_rightside_pos)

    # calculate path
    PathFinder.Search.find_path(
      lower,
      higher,
      blocked_tiles
    )
  end
end
