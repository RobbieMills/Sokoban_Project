class Floor {

  PImage floor;
  float tileX;
  float tileY;

  Floor(float _tileX, float _tileY) {

    tileX = _tileX;
    tileY = _tileY;

    floor = loadImage("Sokoban_Floor_V1.png");
  }

  void drawTile() {

    image(floor, tileX, tileY);
  }
}