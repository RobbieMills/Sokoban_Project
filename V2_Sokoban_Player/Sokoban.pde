class Sokoban {

  Tile floorTile;

  Player thePlayer;

  Sokoban() {
  }

  void drawGame() {

    floorTile = new Tile();
    floorTile.drawTile();


    thePlayer = new Player();
    thePlayer.drawPlayer(150, 150);
  }
}