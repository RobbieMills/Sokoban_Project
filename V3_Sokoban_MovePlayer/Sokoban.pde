class Sokoban {

  Tile floorTile;

  Player thePlayer;
  Player thePlayer2;

  float theplayerX = 150;
  float theplayerY = 150;

  int multiplier = 1; //theplayerX multiplier when moving Player

  Sokoban() {
  }

  void drawGame() {

    floorTile = new Tile();
    floorTile.drawTile();

    thePlayer = new Player();
    thePlayer.drawPlayer(theplayerX, theplayerY);
  }

  void movePlayer() {
    if (keyCode == RIGHT) {
      //floorTile.drawTile();

      thePlayer.drawPlayer(theplayerX +51*multiplier, theplayerY);
      multiplier = multiplier + 1;
    }
  }
}