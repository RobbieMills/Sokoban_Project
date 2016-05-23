class Player extends MoveableTile {

  PImage player;
  boolean playeroutofbounds;
  Player(float tileX, float tileY) {

    super(tileX, tileY);

    player = loadImage("Sokoban_PlayerOnFloor_V1.png");
  }

  void drawTile() {

    image(player, tileX, tileY);
  }


  boolean playerBoundyRight() {

    if (tileX > 558) {
      return true;
    } else {
      return false;
    }
  }

  boolean playerBoundyLeft() {

    if (tileX < 201) {
      return true;
    } else {
      return false;
    }
  }
  boolean playerBoundyUp() {

    if (tileY < 201) {
      return true;
    } else {
      return false;
    }
  }

  boolean playerBoundyDown() {

    if (tileY > 558) {
      return true;
    } else {
      return false;
    }
  }
}