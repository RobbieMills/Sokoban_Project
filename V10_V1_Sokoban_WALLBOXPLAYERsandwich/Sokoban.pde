class Sokoban {

  Tile floorTile;

  Player thePlayer;

  Box aBox;

  StartTile playerHouse;

  Dropoff dropoffOne;

  Dropoffoccupied test;

  //Multipliers increment as thePlayer is moved
  int xMultiplier = 0; 
  int yMultiplier = 0;

  boolean boxanddropoffareoverlapping;

  boolean sandwich;

  Sokoban() {
    aBox = new Box(252, 303);
  }

  void drawGame() {

    thePlayer = new Player(150, 150);
    floorTile = new Tile();
    playerHouse = new StartTile(150, 150);
    dropoffOne = new Dropoff(456, 456);
    test = new Dropoffoccupied(50, 50);

    floorTile.drawTile();

    aBox.drawBox();
    dropoffOne.drawdropoff();

    thePlayer.drawPlayer();

    playerHouse.drawStartTile();
  }

  void movePlayer() {

    if (keyCode == RIGHT) {

      //boxanddropoffareoverlapping = false;

      game.drawGame();

      xMultiplier = xMultiplier + 1;

      thePlayer.alterplayerPosition(150 + 51*xMultiplier, 150 + 51*+yMultiplier);

      thePlayer.drawPlayer();

      if (aBox.boxX == dropoffOne.dropoffX &&  aBox.boxY == dropoffOne.dropoffY) {

        boxanddropoffareoverlapping = true;
        test.drawdropoffoccupied(aBox.boxX, aBox.boxY);
      }

      /////////////////////////////////////////////////////////////////
      if (boxanddropoffareoverlapping == false &&
        thePlayer.playerX == aBox.boxX && thePlayer.playerY == aBox.boxY) {

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

      if (aBox.boxX == dropoffOne.dropoffX &&  aBox.boxY == dropoffOne.dropoffY) {

        boxanddropoffareoverlapping = true;
        test.drawdropoffoccupied(aBox.boxX, aBox.boxY);
      }

      /////////////////////////////////////////////////////////////////
      if (boxanddropoffareoverlapping == false && 
        thePlayer.playerX == aBox.boxX && thePlayer.playerY == aBox.boxY) {

        aBox.alterboxPosition(aBox.boxX, aBox.boxY +51);                   

        aBox.drawBox();
        /////////////////////////////////////////////////////////////////
      }
    }

    if (keyCode == LEFT) {

      game.drawGame();
      sandwich = false;

      xMultiplier = xMultiplier - 1;

      ///////////////////WALL, BOX, PLAYER SANDWICH COLLISION IN PROGRESS//////////////////////////
      if (sandwich) {

        println("sandwich is true");
      }
      /////////////////////////////////////////////////////////////////

      if (sandwich == false) {
        thePlayer.alterplayerPosition(150 + 51*xMultiplier, 150 + 51*+yMultiplier);

        thePlayer.drawPlayer();
      }

      if (aBox.boxX == dropoffOne.dropoffX &&  aBox.boxY == dropoffOne.dropoffY) {

        boxanddropoffareoverlapping = true;
        test.drawdropoffoccupied(aBox.boxX, aBox.boxY);
      }

      /////////////////////////////////////////////////////////////////
      if (boxanddropoffareoverlapping == false && sandwich == false &&
        thePlayer.playerX == aBox.boxX && thePlayer.playerY == aBox.boxY) {

        aBox.alterboxPosition(aBox.boxX  -51, aBox.boxY);                   

        aBox.drawBox();
        /////////////////////////////////////////////////////////////////

        if (aBox.boxX == 150 && thePlayer.playerX == 201) {

          sandwich = true;

          //thePlayer.alterplayerPosition(201, 150 + 51*+yMultiplier);
          //thePlayer.drawPlayer();
        }else{
        
        sandwich = false;
        }
      }
    }

    if (keyCode == UP) {

      game.drawGame();

      yMultiplier = yMultiplier - 1;
      thePlayer.alterplayerPosition(150 + 51*xMultiplier, 150 + 51*+yMultiplier);

      thePlayer.drawPlayer();

      if (aBox.boxX == dropoffOne.dropoffX &&  aBox.boxY == dropoffOne.dropoffY) {

        boxanddropoffareoverlapping = true;
        test.drawdropoffoccupied(aBox.boxX, aBox.boxY);
      }

      /////////////////////////////////////////////////////////////////
      if (boxanddropoffareoverlapping == false && 
        thePlayer.playerX == aBox.boxX && thePlayer.playerY == aBox.boxY) {

        aBox.alterboxPosition(aBox.boxX, aBox.boxY -51);                  

        aBox.drawBox();
        /////////////////////////////////////////////////////////////////
      }
    }
  }
}