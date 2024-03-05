import gridHoverHandler from "./GridHover";
import dragHandler from "./drag";
import helloHandler from "./hello";

const Hooks = {
  Hello: helloHandler,
  Drag: dragHandler,
  GridHover: gridHoverHandler,
};

export default Hooks;
