class Sokoban {

  Tile floorTile;

  Player thePlayer;

  Box aBox;

  StartTile playerHouse;

  Dropoff dropoffOne;

  Dropoffoccupied successDrop;

  //Multipliers - new player pos +51*multiplier (51 px being 1 tile)
  int xMultiplier = 0; //+1 when moved RIGHT, -1 when moved LEFT
  int yMultiplier = 0; //+1 when moved DOWN, -1 when moved UP

  boolean boxanddropoffareoverlapping;

  boolean sandwich;

  boolean playeroutofbounds;

  boolean[] dropOffs = new boolean[3];

  Sokoban() {
    //in constructor to stop box being redrawn 
    aBox = new Box(252, 303);
    thePlayer = new Player(150, 150);
  }

  void drawGame() {

    floorTile = new Tile(150,150);
    playerHouse = new StartTile(150, 150);
    dropoffOne = new Dropoff(456, 456);
    successDrop = new Dropoffoccupied(50, 50);
    //thePlayer = new Player(150, 150);

    floorTile.drawTile();
    aBox.drawBox();
    thePlayer.drawTile();
    dropoffOne.drawdropoff();
    playerHouse.drawStartTile();
  }

  void movePlayer() {

    if (keyCode == RIGHT) {

      //boxanddropoffareoverlapping = false;

      game.drawGame();

      if (thePlayer.tileX > 558) {
        playeroutofbounds = true;
      }

      if (aBox.boxX == 609 && thePlayer.tileX == 558 && aBox.boxY == thePlayer.tileY) {
        sandwich = true;
      } 

      ///////////////////PLAYER MOVE//////////////////
      xMultiplier = xMultiplier + 1;

      if (sandwich == false && playeroutofbounds == false) {
        thePlayer.alterplayerPosition(150 + 51*xMultiplier, 150 + 51*+yMultiplier);

        thePlayer.drawTile();
        game.drawGame();
      } else if (sandwich) {
        sandwich = false;   
        xMultiplier = xMultiplier - 1;
        thePlayer.alterplayerPosition(558, 150 + 51*+yMultiplier);
        thePlayer.drawTile();
        aBox.drawBox();
        //game.drawGame();
      }
      /////////////////////////////////////////////////////////////////

      if (playeroutofbounds) {
        playeroutofbounds = false;
        //multiplier is reversed to keep playerX at 150 if left is clicked multiple times
        xMultiplier = xMultiplier - 1;
        thePlayer.alterplayerPosition(609, 150 + 51*+yMultiplier);
        thePlayer.drawTile();
        game.drawGame();
      }

      ///////////////////BOX DROPPED OFF//////////////////
      if (aBox.boxX == dropoffOne.dropoffX &&  aBox.boxY == dropoffOne.dropoffY) {

        boxanddropoffareoverlapping = true;
        successDrop.drawdropoffoccupied(aBox.boxX, aBox.boxY);

        dropOffs[0] = true;
        if (dropOffs[0] == true) {
          println("Box 1 ([0]) has been deposited.");

          fill(0);
          text("Box 1 Deposited", 400, 50);
        }
      }
      /////////////////////////////////////////////////////////////////

      ///////////////////PLAYER MOVE BOX//////////////////
      if (boxanddropoffareoverlapping == false && sandwich == false &&
        thePlayer.tileX == aBox.boxX && thePlayer.tileY == aBox.boxY) {

        aBox.alterboxPosition(aBox.boxX  +51, aBox.boxY);                  

        aBox.drawBox();
        /////////////////////////////////////////////////////////////////
      }
    }

    if (keyCode == DOWN) {

      game.drawGame();

      if (aBox.boxY == 609 && thePlayer.tileY == 558 && aBox.boxX == thePlayer.tileX) {
        sandwich = true;
      } 

      if (thePlayer.tileY > 558) {
        playeroutofbounds = true;
      }

      ///////////////////PLAYER MOVE//////////////////
      yMultiplier = yMultiplier + 1;
      if (sandwich == false && playeroutofbounds == false) {
        thePlayer.alterplayerPosition(150 + 51*xMultiplier, 150 + 51*+yMultiplier);

        thePlayer.drawTile();
        game.drawGame();
      } else if (sandwich) {
        sandwich = false;   
        yMultiplier = yMultiplier - 1;
        thePlayer.alterplayerPosition(150 + 51*+xMultiplier, 558);
        thePlayer.drawTile();
        aBox.drawBox();
        //game.drawGame();
      }
      /////////////////////////////////////////////////////////////////

      if (playeroutofbounds) {
        playeroutofbounds = false;
        //multiplier is reversed to keep playerX at 150 if left is clicked multiple times
        yMultiplier = yMultiplier - 1;
        thePlayer.alterplayerPosition(150 + 51*+xMultiplier, 609);
        thePlayer.drawTile();
        game.drawGame();
      }

      ///////////////////BOX DROPPED OFF//////////////////
      if (aBox.boxX == dropoffOne.dropoffX &&  aBox.boxY == dropoffOne.dropoffY) {

        boxanddropoffareoverlapping = true;
        successDrop.drawdropoffoccupied(aBox.boxX, aBox.boxY);

        dropOffs[0] = true;
        if (dropOffs[0] == true) {
          println("Box 1 ([0]) has been deposited.");

          fill(0);
          text("Box 1 Deposited", 400, 50);
        }
      }
      /////////////////////////////////////////////////////////////////

      ///////////////////PLAYER MOVE BOX//////////////////
      if (boxanddropoffareoverlapping == false && sandwich == false &&
        thePlayer.tileX == aBox.boxX && thePlayer.tileY == aBox.boxY) {

        aBox.alterboxPosition(aBox.boxX, aBox.boxY +51);                   

        aBox.drawBox();
        /////////////////////////////////////////////////////////////////
      }
    }

    if (keyCode == LEFT) {

      game.drawGame();   

      if (thePlayer.tileX < 201) {
        playeroutofbounds = true;
      }

      ///////////////////WALL, BOX, PLAYER SANDWICH//////////////////////////
      xMultiplier = xMultiplier - 1;
      if (aBox.boxX == 150 && thePlayer.tileX == 201 && aBox.boxY == thePlayer.tileY) {
        //if (aBox.boxX == 150 && thePlayer.playerX == 150 && aBox.boxY == thePlayer.playerY) {
        sandwich = true;
      } 
      /////////////////////////////////////////////////////////////////////      

      if (playeroutofbounds == true) {
        println("playeroutofbounds is TRUE");
      } else {
        println("playeroutofbounds is FALSE");
      }

      ///////////////////PLAYER MOVE//////////////////
      if (sandwich == false && playeroutofbounds == false) {
        thePlayer.alterplayerPosition(150 + 51*xMultiplier, 150 + 51*+yMultiplier);
        thePlayer.drawTile();
        game.drawGame();
      } else if (sandwich) {
        sandwich = false;   
        xMultiplier = xMultiplier + 1;
        thePlayer.alterplayerPosition(201, 150 + 51*+yMultiplier);
        thePlayer.drawTile();
        aBox.drawBox();
        //game.drawGame();
      }

      if (playeroutofbounds) {
        playeroutofbounds = false;
        //multiplier is reversed to keep playerX at 150 if left is clicked multiple times
        xMultiplier = xMultiplier + 1;
        thePlayer.alterplayerPosition(150, 150 + 51*+yMultiplier);
        thePlayer.drawTile();
        game.drawGame();
      }     

      ///////////////////BOX DROPPED OFF//////////////////
      if (aBox.boxX == dropoffOne.dropoffX &&  aBox.boxY == dropoffOne.dropoffY) {

        boxanddropoffareoverlapping = true;
        successDrop.drawdropoffoccupied(aBox.boxX, aBox.boxY);

        dropOffs[0] = true;
        if (dropOffs[0] == true) {
          println("Box 1 ([0]) has been deposited.");

          fill(0);
          text("Box 1 Deposited", 400, 50);
        }
      }
      /////////////////////////////////////////////////////////////////

      ///////////////////PLAYER MOVE BOX//////////////////
      if (boxanddropoffareoverlapping == false && sandwich == false &&
        thePlayer.tileX == aBox.boxX && thePlayer.tileY == aBox.boxY) {

        aBox.alterboxPosition(aBox.boxX  -51, aBox.boxY);                   

        aBox.drawBox();
        /////////////////////////////////////////////////////////////////
      }
    }

    if (keyCode == UP) {

      game.drawGame();

      if (aBox.boxY == 150 && thePlayer.tileY == 201 && aBox.boxX == thePlayer.tileX) {
        sandwich = true;
      } 

      if (thePlayer.tileY < 201) {
        playeroutofbounds = true;
      }

      ///////////////////PLAYER MOVE//////////////////
      yMultiplier = yMultiplier - 1;

      if (sandwich == false && playeroutofbounds == false) {
        thePlayer.alterplayerPosition(150 + 51*xMultiplier, 150 + 51*+yMultiplier);

        thePlayer.drawTile();
        game.drawGame();
      } else if (sandwich) {
        sandwich = false;   
        yMultiplier = yMultiplier + 1;
        thePlayer.alterplayerPosition(150 + 51*+xMultiplier, 201);
        thePlayer.drawTile();
        aBox.drawBox();
        //game.drawGame();
      }
      /////////////////////////////////////////////////////////////////

      if (playeroutofbounds) {
        playeroutofbounds = false;
        //multiplier is reversed to keep playerX at 150 if left is clicked multiple times
        yMultiplier = yMultiplier + 1;
        thePlayer.alterplayerPosition(150 + 51*+xMultiplier, 150);
        thePlayer.drawTile();
        game.drawGame();
      }

      ///////////////////BOX DROPPED OFF//////////////////
      if (aBox.boxX == dropoffOne.dropoffX &&  aBox.boxY == dropoffOne.dropoffY) {

        boxanddropoffareoverlapping = true;
        successDrop.drawdropoffoccupied(aBox.boxX, aBox.boxY);

        dropOffs[0] = true;
        if (dropOffs[0] == true) {
          println("Box 1 ([0]) has been deposited.");

          fill(0);
          text("Box 1 Deposited", 400, 50);
        }
      }
      /////////////////////////////////////////////////////////////////

      ///////////////////PLAYER MOVE BOX//////////////////
      if (boxanddropoffareoverlapping == false && sandwich == false &&
        thePlayer.tileX == aBox.boxX && thePlayer.tileY == aBox.boxY) {

        aBox.alterboxPosition(aBox.boxX, aBox.boxY -51);                  

        aBox.drawBox();        
        /////////////////////////////////////////////////////////////////
      }
    }
  }
}