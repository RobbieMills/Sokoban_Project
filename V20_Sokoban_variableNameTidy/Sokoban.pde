class Sokoban {

  Floor gameGrid;
  Player thePlayer;
  StartTile playerHouse;
  Dropoff dropoffOne;
  Dropoffoccupied successDrop;

  Box[] boxes = new Box[3];

  //Multipliers - new player pos +tileSize*multiplier
  int xMultiplier = 0; //+1 when moved RIGHT, -1 when moved LEFT
  int yMultiplier = 0; //+1 when moved DOWN, -1 when moved UP  
  //size of a single tile 
  int tileSize = 51;
  //order - indent of the screensize to grid edge
  int border = 150;

  boolean boxanddropoffareoverlapping;
  //WallBoxPlayer sandwichWallBoxPlayer
  boolean sandwichWallBoxPlayer;
  boolean playeroutofbounds;
  boolean[] dropOffs = new boolean[3];
  boolean gamehasstarted;


  Sokoban() {
    //in constructor to stop box being redrawn 
    //aBox = new Box(252, 303);
    boxes[0] = new Box(252, 303);
    thePlayer = new Player(150, 150);

    if (gamehasstarted == false) {
      fill(0);
      text("Click to start", 400, 400);
    }
  }

  void drawGame() {

    gamehasstarted = true;
    gameGrid = new Floor(border, border);
    playerHouse = new StartTile(border, border);
    dropoffOne = new Dropoff(456, 456);
    successDrop = new Dropoffoccupied(50, 50);

    gameGrid.drawTile();
    //aBox.drawTile();
    for (int i = 0; i < 1; i++) {
      boxes[i].drawTile();
    }
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
        sandwichWallBoxPlayer = true;
      } 

      ///////////////////PLAYER MOVE//////////////////
      xMultiplier = xMultiplier + 1;

      if (sandwichWallBoxPlayer == false && playeroutofbounds == false) {
        thePlayer.alterthePosition(border + tileSize*xMultiplier, border + tileSize*+yMultiplier);

        thePlayer.drawTile();
        game.drawGame();
      } else if (sandwichWallBoxPlayer) {
        sandwichWallBoxPlayer = false;   
        xMultiplier = xMultiplier - 1;
        thePlayer.alterthePosition(558, border + tileSize*+yMultiplier);
        thePlayer.drawTile();
        boxes[0].drawTile();
      }
      /////////////////////////////////////////////////////////////////

      if (playeroutofbounds) {
        playeroutofbounds = false;
        //multiplier is reversed to keep playerX at border if left is clicked multiple times
        xMultiplier = xMultiplier - 1;
        thePlayer.alterthePosition(609, border + tileSize*+yMultiplier);
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
      if (boxanddropoffareoverlapping == false && sandwichWallBoxPlayer == false &&
        thePlayer.tileX == boxes[0].tileX && thePlayer.tileY == boxes[0].tileY) {

        boxes[0].alterthePosition(boxes[0].tileX  +tileSize, boxes[0].tileY);                  

        boxes[0].drawTile();
        /////////////////////////////////////////////////////////////////
      }
    }

    if (keyCode == DOWN) {

      game.drawGame();

      if (boxes[0].tileY == 609 && thePlayer.tileY == 558 && boxes[0].tileX == thePlayer.tileX) {
        sandwichWallBoxPlayer = true;
      } 

      if (thePlayer.tileY > 558) {
        playeroutofbounds = true;
      }

      ///////////////////PLAYER MOVE//////////////////
      yMultiplier = yMultiplier + 1;
      if (sandwichWallBoxPlayer == false && playeroutofbounds == false) {
        thePlayer.alterthePosition(border + tileSize*xMultiplier, border + tileSize*+yMultiplier);
        thePlayer.drawTile();
        game.drawGame();
      } else if (sandwichWallBoxPlayer) {
        sandwichWallBoxPlayer = false;   
        yMultiplier = yMultiplier - 1;
        thePlayer.alterthePosition(border + tileSize*+xMultiplier, 558);
        thePlayer.drawTile();
        boxes[0].drawTile();
      }
      /////////////////////////////////////////////////////////////////

      if (playeroutofbounds) {
        playeroutofbounds = false;
        //multiplier is reversed to keep playerX at border if left is clicked multiple times
        yMultiplier = yMultiplier - 1;
        thePlayer.alterthePosition(border + tileSize*+xMultiplier, 609);
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
      if (boxanddropoffareoverlapping == false && sandwichWallBoxPlayer == false &&
        thePlayer.tileX == boxes[0].tileX && thePlayer.tileY == boxes[0].tileY) {

        boxes[0].alterthePosition(boxes[0].tileX, boxes[0].tileY +tileSize);                   

        boxes[0].drawTile();
        /////////////////////////////////////////////////////////////////
      }
    }

    if (keyCode == LEFT) {

      game.drawGame();   

      if (thePlayer.tileX < 201) {
        playeroutofbounds = true;
      }

      ///////////////////WALL, BOX, PLAYER sandwichWallBoxPlayer//////////////////////////
      xMultiplier = xMultiplier - 1;
      if (boxes[0].tileX == border && thePlayer.tileX == 201 && boxes[0].tileY == thePlayer.tileY) {
        sandwichWallBoxPlayer = true;
      } 
      /////////////////////////////////////////////////////////////////////      

      ///////////////////PLAYER MOVE//////////////////
      if (sandwichWallBoxPlayer == false && playeroutofbounds == false) {
        thePlayer.alterthePosition(border + tileSize*xMultiplier, border + tileSize*+yMultiplier);
        thePlayer.drawTile();
        game.drawGame();
      } else if (sandwichWallBoxPlayer) {
        sandwichWallBoxPlayer = false;   
        xMultiplier = xMultiplier + 1;
        thePlayer.alterthePosition(201, border + tileSize*+yMultiplier);
        thePlayer.drawTile();
        boxes[0].drawTile();
      }

      if (playeroutofbounds) {
        playeroutofbounds = false;
        //multiplier is reversed to keep playerX at border if left is clicked multiple times
        xMultiplier = xMultiplier + 1;
        thePlayer.alterthePosition(border, border + tileSize*+yMultiplier);
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
      if (boxanddropoffareoverlapping == false && sandwichWallBoxPlayer == false &&
        thePlayer.tileX == boxes[0].tileX && thePlayer.tileY == boxes[0].tileY) {

        boxes[0].alterthePosition(boxes[0].tileX  -tileSize, boxes[0].tileY);                   

        boxes[0].drawTile();
        /////////////////////////////////////////////////////////////////
      }
    }

    if (keyCode == UP) {

      game.drawGame();

      if (boxes[0].tileY == border && thePlayer.tileY == 201 && boxes[0].tileX == thePlayer.tileX) {
        sandwichWallBoxPlayer = true;
      } 

      if (thePlayer.tileY < 201) {
        playeroutofbounds = true;
      }

      ///////////////////PLAYER MOVE//////////////////
      yMultiplier = yMultiplier - 1;

      if (sandwichWallBoxPlayer == false && playeroutofbounds == false) {
        thePlayer.alterthePosition(border + tileSize*xMultiplier, border + tileSize*+yMultiplier);

        thePlayer.drawTile();
        game.drawGame();
      } else if (sandwichWallBoxPlayer) {
        sandwichWallBoxPlayer = false;   
        yMultiplier = yMultiplier + 1;
        thePlayer.alterthePosition(border + tileSize*+xMultiplier, 201);
        thePlayer.drawTile();
        boxes[0].drawTile();
      }
      /////////////////////////////////////////////////////////////////

      if (playeroutofbounds) {
        playeroutofbounds = false;
        //multiplier is reversed to keep playerX at border if left is clicked multiple times
        yMultiplier = yMultiplier + 1;
        thePlayer.alterthePosition(border + tileSize*+xMultiplier, border);
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
      if (boxanddropoffareoverlapping == false && sandwichWallBoxPlayer == false &&
        thePlayer.tileX == boxes[0].tileX && thePlayer.tileY == boxes[0].tileY) {

        boxes[0].alterthePosition(boxes[0].tileX, boxes[0].tileY -tileSize);                  

        boxes[0].drawTile();        
        /////////////////////////////////////////////////////////////////
      }
    }
  }
}