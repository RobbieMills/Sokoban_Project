class Player {

  PImage player;
  float tileX;
  float tileY;

  Player(float _tileX, float _tileY) {

    tileX = _tileX;
    tileY = _tileY;

    player = loadImage("Sokoban_PlayerOnFloor_V1.png");
  }

  void drawTile() {

    image(player, tileX, tileY);
  }
}