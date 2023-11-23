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
end
