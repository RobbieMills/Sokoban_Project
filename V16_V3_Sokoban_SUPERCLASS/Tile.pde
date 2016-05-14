class Tile {

  PImage floortile;
  float tileX;
  float tileY;

  Tile(float _tileX, float _tileY) {

    tileX = _tileX;
    tileY = _tileY;
    floortile = loadImage("Sokoban_Floor_V1.png");
  }

  void drawTile() {
  }
}