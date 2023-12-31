defmodule SchematicWeb.DatabaseLive.Connector do
  use Phoenix.Component

  @vertical_line_orientation %{
    x1: 5,
    x2: 5,
    y1: 0,
    y2: 10
  }

  @horizontal_line_orientation %{
    x1: 0,
    x2: 10,
    y1: 5,
    y2: 5
  }

  def line(assigns) do
    if assigns.orientation == "vertical" do
      ~H"""
      <.straight_line col={@col} row={@row} x1={5} x2={5} y1={0} y2={10} />
      """
    else
      ~H"""
      <.straight_line col={@col} row={@row} x1={0} x2={10} y1={5} y2={5} />
      """
    end
  end

  def straight_line(assigns) do
    ~H"""
    <svg style={format_angle_style(@col, @row)} width="3.5em" height="3.5em" viewBox="0 0 10 10">
      <line class="stroke-1 stroke-black" x1={@x1} x2={@x2} y1={@y1} y2={@y2} />
    </svg>
    """
  end

  def vertical_line(assigns) do
    ~H"""
    <svg style={format_angle_style(@col, @row)} width="3.5em" height="3.5em" viewBox="0 0 10 10">
      <line class="stroke-1 stroke-black" x1="5" x2="5" y1="0" y2="10" />
    </svg>
    """
  end

  def horizontal_line(assigns) do
    ~H"""
    <svg style={format_angle_style(@col, @row)} width="3.5em" height="3.5em" viewBox="0 0 10 10">
      <line class="stroke-1 stroke-black" x1="0" x2="10" y1="5" y2="5" />
    </svg>
    """
  end

  # def topleft_angle(assigns) do
  #   mstyle = "
  #   grid-column-start: #{assigns.col};
  #   grid-row-start: #{assigns.row};
  #   "

  #   ~H"""
  #   <svg style={mstyle} height="56px" width="56px">
  #     <polyline points="0,28 28,28 28,0" style="fill:none;stroke:black;stroke-width:5;" />
  #   </svg>
  #   """
  # end

  def angle(assigns) do
    ~H"""
    <svg style={format_angle_style(@col, @row)} height="56px" width="56px">
      <polyline points={@points} style="fill:none;stroke:black;stroke-width:6;" />
    </svg>
    """
  end

  def topleft_angle(assigns) do
    ~H"""
    <.angle col={@col} row={@row} points="0,28 28,28 28,0" />
    """
  end

  def topright_angle(assigns) do
    ~H"""
    <.angle col={@col} row={@row} points="28,0 28,28 56,28" />
    """
  end

  def bottomleft_angle(assigns) do
    ~H"""
    <.angle col={@col} row={@row} points="0,28 28,28 28,56" />
    """
  end

  def bottomright_angle(assigns) do
    ~H"""
    <.angle col={@col} row={@row} points="56,28 28,28 28,56" />
    """
  end

  def format_angle_style(col, row) do
    "
    grid-column-start: #{col};
    grid-row-start: #{row};
    "
  end

  def connector(assigns) do
    ~H"""
    <%= case @orientation do %>
      <% "vertical" -> %>
        <.vertical_line col={@col} row={@row} />
      <% "horizontal" -> %>
        <.horizontal_line col={@col} row={@row} />
      <% "topleft" -> %>
        <.topleft_angle col={@col} row={@row} />
      <% "topright" -> %>
        <.topright_angle col={@col} row={@row} />
      <% "bottomleft" -> %>
        <.bottomleft_angle col={@col} row={@row} />
      <% "bottomright" -> %>
        <.bottomright_angle col={@col} row={@row} />
    <% end %>
    """
  end

  def generate_connectors(_tables) do
    # TODO: implement, stubbed for now
    [
      %{orientation: "horizontal", col: 7, row: 3},
      %{orientation: "bottomleft", col: 8, row: 3},
      %{orientation: "vertical", col: 8, row: 4},
      %{orientation: "vertical", col: 8, row: 5},
      %{orientation: "vertical", col: 8, row: 6},
      %{orientation: "vertical", col: 8, row: 7},
      %{orientation: "vertical", col: 8, row: 8},
      %{orientation: "topright", col: 8, row: 9},
      #
      %{orientation: "topleft", col: 10, row: 10},
      %{orientation: "topright", col: 11, row: 10},
      %{orientation: "bottomleft", col: 10, row: 11},
      %{orientation: "bottomright", col: 11, row: 11}
    ]
  end
end
