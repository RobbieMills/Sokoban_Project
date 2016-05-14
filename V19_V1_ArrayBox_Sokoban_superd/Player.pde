class Player extends MoveableTile {

  PImage player;

  Player(float tileX, float tileY) {

    super(tileX, tileY);

    player = loadImage("Sokoban_PlayerOnFloor_V1.png");
  }

  void drawTile() {

    image(player, tileX, tileY);
  }
}