class StartTile extends Tile {

  PImage startTile;

  StartTile(float tileX, float tileY) {

    super(tileX, tileY);

    startTile = loadImage("Sokoban_House_V1.png");
  }

  void drawTile() {

    image(startTile, tileX, tileY);
  }

  void alterstarttilePosition(float _tileX, float _tileY) {

    tileX = _tileX;
    tileY = _tileY;
  }
}