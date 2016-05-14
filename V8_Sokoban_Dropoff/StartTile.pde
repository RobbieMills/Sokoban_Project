class StartTile {

  PImage starttile;
  float StartTileX;
  float StartTileY;

  StartTile(float _StartTileX, float _StartTileY) {


    StartTileX = _StartTileX;
    StartTileY = _StartTileY;

    starttile = loadImage("Sokoban_House_V1.png");
  }

  void drawStartTile() {

    image(starttile, StartTileX, StartTileY);
  }

  void alterStartTilePosition(float _StartTileX, float _StartTileY) {

    StartTileX = _StartTileX;
    StartTileY = _StartTileY;
  }
}