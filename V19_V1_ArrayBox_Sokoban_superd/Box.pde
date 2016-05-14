class Box extends MoveableTile {

  PImage box;

  Box(float tileX, float tileY) {

    super(tileX, tileY);

    box = loadImage("Sokoban_Box_V1.png");
  }

  void drawTile() {

    image(box, tileX, tileY);
  }
}