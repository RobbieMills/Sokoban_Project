class Player extends Tile{

  PImage player;

  Player(float tileX, float tileY) {

    super(tileX, tileY);

    player = loadImage("Sokoban_PlayerOnFloor_V1.png");
  }

  void drawTile() {

    image(player, tileX, tileY);
  }

  void alterplayerPosition(float _tileX, float _tileY) {

    tileX = _tileX;
    tileY = _tileY;

    //print("The tile X Position is", tileX);
    //print("   " + "The tile Y Position is", tileY);
    //println("");

    if (tileX < 150) {
      tileX = 150;
    }
    if (tileX > 609) {
      tileX = 609;
    }
    if (tileY < 150) {
      tileY = 150;
    }
    if (tileY > 609) {
      tileY = 609;
    }
  }
}