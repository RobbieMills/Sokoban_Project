class Box {

  PImage box;
  float tileX;
  float tileY;

  Box(float _tileX, float _tileY) {

    tileX = _tileX;
    tileY = _tileY;

    box = loadImage("Sokoban_Box_V1.png");
  }

  void drawTile() {

    image(box, tileX, tileY);
  }
}