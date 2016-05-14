class Sokoban {

  Tile floorTile;

  Player thePlayer;

  Box aBox;

  //Multipliers increment as thePlayer is moved
  int xMultiplier = 0; 
  int yMultiplier = 0;

  Sokoban() {
  }

  void drawGame() {

    thePlayer = new Player(150, 150);
    floorTile = new Tile();
   
    aBox = new Box(252, 303);

    floorTile.drawTile();

    aBox.drawBox();

    thePlayer.drawPlayer();
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