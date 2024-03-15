import {
  getGridCoordinates,
  getElemCoordinates,
  getGridTilePos,
  getGridElem,
} from "./utils/grid";

const dragHandler = {
  mounted() {
    this.el.addEventListener("dragstart", (e) => {
      const gridCoords = getGridCoordinates();
      const elCoords = getElemCoordinates(this.el);
      // TODO: below, get grid_row_start equiv, refactor to not store that data in data attr
      //   const [col, row] = getGridTilePos(gridCoords, elCoords);
      const [clicked_col, clicked_row] = getGridTilePos(gridCoords, {
        x: e.clientX,
        y: e.clientY,
      });
      console.log(getGridTilePos(gridCoords, { x: e.clientX, y: e.clientY }));

      const { grid_row_start, grid_column_start } = getTableDataset(e);

      const rowOffest = clicked_row - grid_row_start;
      const columnOffset = clicked_col - grid_column_start;

      e.target.dataset.rowOffset = rowOffest;
      e.target.dataset.columnOffset = columnOffset;
    });

    this.el.addEventListener("dragend", (e) => {
      const gridCoords = getGridCoordinates();
      const [col, row] = getGridTilePos(gridCoords, {
        x: e.clientX,
        y: e.clientY,
      });

      const grid = getGridElem();

      const {
        grid_row_start,
        grid_row_end,
        grid_column_start,
        grid_column_end,
      } = getTableDataset(e);

      const tableArea = calcTableArea(
        grid_column_start,
        grid_column_end,
        grid_row_start,
        grid_row_end
      );

      //TODO: blocked doesn't include gutters
      //TODO: check for boundaries as limit rather than lines of blocked tiles, which could be placed beyond them
      const rowOffest = Number(e.target.dataset.rowOffset); //row - grid_row_start;
      const columnOffset = Number(e.target.dataset.columnOffset); //col - grid_column_start;
      const row_count = grid_row_end - (grid_row_start - 1);
      const column_count = grid_column_end - (grid_column_start - 1);

      const updatedRowStart = row - rowOffest;
      const updatedColStart = col - columnOffset;
      const updatedRowEnd = updatedRowStart + row_count - 1;
      const updatedColEnd = updatedColStart + column_count - 1;

      const updatedTableArea = calcTableArea(
        updatedColStart,
        updatedColEnd,
        updatedRowStart,
        updatedRowEnd
      );
      // TODO add table boundaries
      // remove old self pos from blocked tiles

      const blockedTiles = JSON.parse(grid.dataset.blockedtiles);
      let filteredTiles = [];
      for (const bt of blockedTiles) {
        if (!tableArea.find((pos) => comparePos(bt, pos))) {
          filteredTiles.push(bt);
        }
      }

      const isBlocked = isWithinBlockedTiles(updatedTableArea, filteredTiles);

      delete e.target.dataset.rowOffest;
      delete e.target.dataset.columnOffest;
      if (isBlocked) {
        console.log("BLOCKED!!!");
        return;
      }

      if (isOutOfBounds(updatedTableArea)) {
        console.log("OUT OF BOUNDS!");
        return;
      }

      //TODO: UPDATE locally (optimistic) so no lag / jitters
      const table_id = Number(e.target.id.replace("table-main-", ""));
      this.pushEvent("update_position", {
        table_id: table_id,
        pos: [col - columnOffset, row - rowOffest],
      });
    });
  },
};

const getRange = (num1, num2) => {
  // TODO: maybe don't need, but safer
  const [start, end] = [num1, num2].sort((a, b) => a - b);
  const spread = [];

  // add boundary spacing
  let i = start - 1;
  while (i <= end + 1) {
    spread.push(i);
    i++;
  }

  return spread;
};

const getTableDataset = (e) => {
  try {
    return JSON.parse(e.target.dataset.tabledims);
  } catch {
    return null;
  }
};

export const calcTableArea = (col_start, col_end, row_start, row_end) => {
  const columnRange = getRange(col_start, col_end);
  const rowRange = getRange(row_start, row_end);

  const tableArea = [];

  for (const colNum of columnRange) {
    for (const rowNum of rowRange) {
      tableArea.push([colNum, rowNum]);
    }
  }

  return tableArea;
};

const comparePos = (pos1, pos2) => {
  const [c1, r1] = pos1;
  const [c2, r2] = pos2;

  return c1 === c2 && r1 === r2;
};

export const isBlocked = (pos, blockedTiles) => {
  return blockedTiles.find((bt) => comparePos(bt, pos));
};

export const isWithinBlockedTiles = (tableArea, blockedTiles) => {
  return !!tableArea.find((area) => isBlocked(area, blockedTiles));
};

const isOutOfBounds = (tableArea) => {
  //TODO: get from data attr
  const boundaries = {
    top: 0,
    right: 100,
    bottom: 100,
    left: 0,
  };

  for (const area of tableArea) {
    const column = area[0];

    if (column <= boundaries.left || column >= boundaries.right) {
      return true;
    }

    const row = area[1];

    if (row <= boundaries.top || row >= boundaries.bottom) {
      return true;
    }
  }

  return false;
};

export default dragHandler;
