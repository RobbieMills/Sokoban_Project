class Sokoban {

  Tile floorTile;

  Player thePlayer;

  //Multipliers increment as thePlayer is moved
  int xMultiplier = 0; 
  int yMultiplier = 0;

  Sokoban() {
  }

  void drawGame() {

    thePlayer = new Player(150, 150);
    thePlayer.drawPlayer();

    floorTile = new Tile();
    floorTile.drawTile();
  }

  void movePlayer() {

    if (keyCode == RIGHT) {

      game.drawGame();

      xMultiplier = xMultiplier + 1;

      thePlayer.alterplayerPosition(150 + 51*xMultiplier, 150 + 51*+yMultiplier);

      thePlayer.drawPlayer();
    }


    if (keyCode == DOWN) {

      game.drawGame();

      yMultiplier = yMultiplier + 1;
      thePlayer.alterplayerPosition(150 + 51*xMultiplier, 150 + 51*+yMultiplier);

      thePlayer.drawPlayer();
    }

    if (keyCode == LEFT) {

      game.drawGame();

      xMultiplier = xMultiplier - 1;
      thePlayer.alterplayerPosition(150 + 51*xMultiplier, 150 + 51*+yMultiplier);

      thePlayer.drawPlayer();
    }

    if (keyCode == UP) {

      game.drawGame();

      yMultiplier = yMultiplier - 1;
      thePlayer.alterplayerPosition(150 + 51*xMultiplier, 150 + 51*+yMultiplier);

      thePlayer.drawPlayer();
    }
  }
}