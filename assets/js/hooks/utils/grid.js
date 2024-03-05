export const getElemCoordinates = (el) => {
  const { x, y } = el.getBoundingClientRect();
  return { x, y };
};

export const getGridElem = () => {
  return document.getElementById("schematic-grid-layout");
};

export const getGridCoordinates = () => {
  const grid = getGridElem();
  return getElemCoordinates(grid);
};

// gets topleft x, y coords, not at site of click
export const getGridTilePos = (gridCoords, elCoords) => {
  const col = Math.floor((elCoords.x - gridCoords.x) / (3.5 * 16)) + 1;
  const row = Math.floor((elCoords.y - gridCoords.y) / (3.5 * 16)) + 1;

  return [col, row];
};

export const getGridColumnAndRow = (elem) => {
  const gridCoords = getGridCoordinates();
  const elCoords = getElemCoordinates(elem);
  return getGridTilePos(gridCoords, elCoords);
};

// export const getGridBoundaries = (elem) => {
//     const boundaries = {
//         top: 1,
//         right: 1,
//         bottom: 1,
//         left: 1
//     }
// }
