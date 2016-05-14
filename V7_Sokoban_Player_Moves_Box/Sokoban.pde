class Sokoban {

  Tile floorTile;

  Player thePlayer;

  Box aBox;

  StartTile playerHouse;

  //Multipliers increment as thePlayer is moved
  int xMultiplier = 0; 
  int yMultiplier = 0;

  Sokoban() {
    aBox = new Box(252, 303);
  }

  void drawGame() {

    thePlayer = new Player(150, 150);
    floorTile = new Tile();
    playerHouse = new StartTile(150, 150);

    floorTile.drawTile();

    aBox.drawBox();

    thePlayer.drawPlayer();

    playerHouse.drawStartTile();
  }

  void movePlayer() {

    if (keyCode == RIGHT) {

      game.drawGame();

      xMultiplier = xMultiplier + 1;

      thePlayer.alterplayerPosition(150 + 51*xMultiplier, 150 + 51*+yMultiplier);

      thePlayer.drawPlayer();

      /////////////////////////////////////////////////////////////////
      if (thePlayer.playerX == aBox.boxX && thePlayer.playerY == aBox.boxY) {

        aBox.alterboxPosition(aBox.boxX  +51, aBox.boxY);                  

        aBox.drawBox();
        /////////////////////////////////////////////////////////////////
      }
    }


    if (keyCode == DOWN) {

      game.drawGame();

      yMultiplier = yMultiplier + 1;
      thePlayer.alterplayerPosition(150 + 51*xMultiplier, 150 + 51*+yMultiplier);

      thePlayer.drawPlayer();

      /////////////////////////////////////////////////////////////////
      if (thePlayer.playerX == aBox.boxX && thePlayer.playerY == aBox.boxY) {

        aBox.alterboxPosition(aBox.boxX, aBox.boxY +51);                   

        aBox.drawBox();
        /////////////////////////////////////////////////////////////////
      }
    }

    if (keyCode == LEFT) {

      game.drawGame();

      xMultiplier = xMultiplier - 1;
      thePlayer.alterplayerPosition(150 + 51*xMultiplier, 150 + 51*+yMultiplier);

      thePlayer.drawPlayer();

      /////////////////////////////////////////////////////////////////
      if (thePlayer.playerX == aBox.boxX && thePlayer.playerY == aBox.boxY) {

        aBox.alterboxPosition(aBox.boxX  -51, aBox.boxY);                   

        aBox.drawBox();
        /////////////////////////////////////////////////////////////////
      }
    }

    if (keyCode == UP) {

      game.drawGame();

      yMultiplier = yMultiplier - 1;
      thePlayer.alterplayerPosition(150 + 51*xMultiplier, 150 + 51*+yMultiplier);

      thePlayer.drawPlayer();

      /////////////////////////////////////////////////////////////////
      if (thePlayer.playerX == aBox.boxX && thePlayer.playerY == aBox.boxY) {

        aBox.alterboxPosition(aBox.boxX, aBox.boxY -51);                  

        aBox.drawBox();
        /////////////////////////////////////////////////////////////////
      }
    }
  }
}