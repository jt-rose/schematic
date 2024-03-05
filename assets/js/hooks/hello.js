const helloHandler = {
  mounted() {
    this.el.addEventListener("click", (e) => {
      console.log("clicked!");
    });
    this.el.addEventListener("dragstart", (e) => {
      console.log("dragged!");
    });
  },
};

export default helloHandler;
