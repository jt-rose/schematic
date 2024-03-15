import { calcTableArea, isBlocked, isWithinBlockedTiles } from "./drag";
import { getGridCoordinates, getGridTilePos, getGridElem } from "./utils/grid";

// const getGridHoverTile = () => {
//   return document.getElementById("grid-hover-tile");
// };

const gridHoverHandler = {
  mounted() {
    // this.el.addEventListener("mouseover", (e) => {
    //   const gridCoords = getGridCoordinates();
    //   const [col, row] = getGridTilePos(gridCoords, {
    //     x: e.clientX,
    //     y: e.clientY,
    //   });
    //   const gridHoverTile = getGridHoverTile();
    //   gridHoverTile.style.display = "block";
    //   gridHoverTile.style.gridColumn = col;
    //   gridHoverTile.style.gridRow = row;
    //   //   console.log("enter!");
    // });

    // this.el.addEventListener("mouseleave", (e) => {
    //   const gridHoverTile = getGridHoverTile();
    //   gridHoverTile.style.display = "none";
    //   //   gridHoverTile.style.gridColumn = "1";
    //   //   gridHoverTile.style.gridRow = "1";
    //   //   console.log("leave!");
    // });

    this.el.addEventListener("click", (e) => {
      const gridCoords = getGridCoordinates();
      const [col, row] = getGridTilePos(gridCoords, {
        x: e.clientX,
        y: e.clientY,
      });

      const grid = getGridElem();
      const blockedTiles = JSON.parse(grid.dataset.blockedtiles);
      if (!isBlocked([col, row], blockedTiles)) {
        const newTableArea = calcTableArea(col - 1, col + 5, row - 1, row + 1);

        if (isWithinBlockedTiles(newTableArea, blockedTiles)) {
          console.log("new table is blocked");
        } else {
          console.log("add new table");
        }
      }
    });
  },
};

export default gridHoverHandler;
