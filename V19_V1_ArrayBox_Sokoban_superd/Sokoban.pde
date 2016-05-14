class Sokoban {

  Floor gameGrid;
  Player thePlayer;
  //Box aBox;
  StartTile playerHouse;
  Dropoff dropoffOne;
  Dropoffoccupied successDrop;

  Box[] boxes = new Box[3];

  //Multipliers - new player pos +51*multiplier (51 px being 1 tile)
  int xMultiplier = 0; //+1 when moved RIGHT, -1 when moved LEFT
  int yMultiplier = 0; //+1 when moved DOWN, -1 when moved UP

  boolean boxanddropoffareoverlapping;
  boolean sandwich;
  boolean playeroutofbounds;
  boolean[] dropOffs = new boolean[3];

  Sokoban() {
    //in constructor to stop box being redrawn 
    //aBox = new Box(252, 303);
    boxes[0] = new Box(252, 303);
    thePlayer = new Player(150, 150);
  }

  void drawGame() {

    gameGrid = new Floor(150, 150);
    playerHouse = new StartTile(150, 150);
    dropoffOne = new Dropoff(456, 456);
    successDrop = new Dropoffoccupied(50, 50);

    gameGrid.drawTile();
    //aBox.drawTile();
    boxes[0].drawTile();
    thePlayer.drawTile();
    dropoffOne.drawTile();
    playerHouse.drawTile();
  }

  void movePlayer() {

    if (keyCode == RIGHT) {

      game.drawGame();

      if (thePlayer.tileX > 558) {
        playeroutofbounds = true;
      }

      if (boxes[0].tileX == 609 && thePlayer.tileX == 558 && boxes[0].tileY == thePlayer.tileY) {
        sandwich = true;
      } 

      ///////////////////PLAYER MOVE//////////////////
      xMultiplier = xMultiplier + 1;

      if (sandwich == false && playeroutofbounds == false) {
        thePlayer.alterthePosition(150 + 51*xMultiplier, 150 + 51*+yMultiplier);

        thePlayer.drawTile();
        game.drawGame();
      } else if (sandwich) {
        sandwich = false;   
        xMultiplier = xMultiplier - 1;
        thePlayer.alterthePosition(558, 150 + 51*+yMultiplier);
        thePlayer.drawTile();
       boxes[0].drawTile();
      }
      /////////////////////////////////////////////////////////////////

      if (playeroutofbounds) {
        playeroutofbounds = false;
        //multiplier is reversed to keep playerX at 150 if left is clicked multiple times
        xMultiplier = xMultiplier - 1;
        thePlayer.alterthePosition(609, 150 + 51*+yMultiplier);
        thePlayer.drawTile();
        game.drawGame();
      }

      ///////////////////BOX DROPPED OFF//////////////////
      if (boxes[0].tileX == dropoffOne.tileX &&  boxes[0].tileY == dropoffOne.tileY) {

        boxanddropoffareoverlapping = true;
        successDrop.drawTile(boxes[0].tileX, boxes[0].tileY);

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
        thePlayer.tileX == boxes[0].tileX && thePlayer.tileY == boxes[0].tileY) {

        boxes[0].alterthePosition(boxes[0].tileX  +51, boxes[0].tileY);                  

        boxes[0].drawTile();
        /////////////////////////////////////////////////////////////////
      }
    }

    if (keyCode == DOWN) {

      game.drawGame();

      if (boxes[0].tileY == 609 && thePlayer.tileY == 558 && boxes[0].tileX == thePlayer.tileX) {
        sandwich = true;
      } 

      if (thePlayer.tileY > 558) {
        playeroutofbounds = true;
      }

      ///////////////////PLAYER MOVE//////////////////
      yMultiplier = yMultiplier + 1;
      if (sandwich == false && playeroutofbounds == false) {
        thePlayer.alterthePosition(150 + 51*xMultiplier, 150 + 51*+yMultiplier);
        thePlayer.drawTile();
        game.drawGame();
      } else if (sandwich) {
        sandwich = false;   
        yMultiplier = yMultiplier - 1;
        thePlayer.alterthePosition(150 + 51*+xMultiplier, 558);
        thePlayer.drawTile();
        boxes[0].drawTile();
      }
      /////////////////////////////////////////////////////////////////

      if (playeroutofbounds) {
        playeroutofbounds = false;
        //multiplier is reversed to keep playerX at 150 if left is clicked multiple times
        yMultiplier = yMultiplier - 1;
        thePlayer.alterthePosition(150 + 51*+xMultiplier, 609);
        thePlayer.drawTile();
        game.drawGame();
      }

      ///////////////////BOX DROPPED OFF//////////////////
      if (boxes[0].tileX == dropoffOne.tileX &&  boxes[0].tileY == dropoffOne.tileY) {

        boxanddropoffareoverlapping = true;
        successDrop.drawTile(boxes[0].tileX, boxes[0].tileY);

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
        thePlayer.tileX == boxes[0].tileX && thePlayer.tileY == boxes[0].tileY) {

       boxes[0].alterthePosition(boxes[0].tileX, boxes[0].tileY +51);                   

        boxes[0].drawTile();
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
      if (boxes[0].tileX == 150 && thePlayer.tileX == 201 && boxes[0].tileY == thePlayer.tileY) {
        sandwich = true;
      } 
      /////////////////////////////////////////////////////////////////////      

      ///////////////////PLAYER MOVE//////////////////
      if (sandwich == false && playeroutofbounds == false) {
        thePlayer.alterthePosition(150 + 51*xMultiplier, 150 + 51*+yMultiplier);
        thePlayer.drawTile();
        game.drawGame();
      } else if (sandwich) {
        sandwich = false;   
        xMultiplier = xMultiplier + 1;
        thePlayer.alterthePosition(201, 150 + 51*+yMultiplier);
        thePlayer.drawTile();
        boxes[0].drawTile();
      }

      if (playeroutofbounds) {
        playeroutofbounds = false;
        //multiplier is reversed to keep playerX at 150 if left is clicked multiple times
        xMultiplier = xMultiplier + 1;
        thePlayer.alterthePosition(150, 150 + 51*+yMultiplier);
        thePlayer.drawTile();
        game.drawGame();
      }     

      ///////////////////BOX DROPPED OFF//////////////////
      if (boxes[0].tileX == dropoffOne.tileX &&  boxes[0].tileY == dropoffOne.tileY) {

        boxanddropoffareoverlapping = true;
        successDrop.drawTile(boxes[0].tileX, boxes[0].tileY);

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
        thePlayer.tileX == boxes[0].tileX && thePlayer.tileY == boxes[0].tileY) {

        boxes[0].alterthePosition(boxes[0].tileX  -51, boxes[0].tileY);                   

        boxes[0].drawTile();
        /////////////////////////////////////////////////////////////////
      }
    }

    if (keyCode == UP) {

      game.drawGame();

      if (boxes[0].tileY == 150 && thePlayer.tileY == 201 && boxes[0].tileX == thePlayer.tileX) {
        sandwich = true;
      } 

      if (thePlayer.tileY < 201) {
        playeroutofbounds = true;
      }

      ///////////////////PLAYER MOVE//////////////////
      yMultiplier = yMultiplier - 1;

      if (sandwich == false && playeroutofbounds == false) {
        thePlayer.alterthePosition(150 + 51*xMultiplier, 150 + 51*+yMultiplier);

        thePlayer.drawTile();
        game.drawGame();
      } else if (sandwich) {
        sandwich = false;   
        yMultiplier = yMultiplier + 1;
        thePlayer.alterthePosition(150 + 51*+xMultiplier, 201);
        thePlayer.drawTile();
        boxes[0].drawTile();
      }
      /////////////////////////////////////////////////////////////////

      if (playeroutofbounds) {
        playeroutofbounds = false;
        //multiplier is reversed to keep playerX at 150 if left is clicked multiple times
        yMultiplier = yMultiplier + 1;
        thePlayer.alterthePosition(150 + 51*+xMultiplier, 150);
        thePlayer.drawTile();
        game.drawGame();
      }

      ///////////////////BOX DROPPED OFF//////////////////
      if (boxes[0].tileX == dropoffOne.tileX && boxes[0].tileY == dropoffOne.tileY) {

        boxanddropoffareoverlapping = true;
        successDrop.drawTile(boxes[0].tileX, boxes[0].tileY);

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
        thePlayer.tileX == boxes[0].tileX && thePlayer.tileY == boxes[0].tileY) {

        boxes[0].alterthePosition(boxes[0].tileX, boxes[0].tileY -51);                  

        boxes[0].drawTile();        
        /////////////////////////////////////////////////////////////////
      }
    }
  }
}