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

  boolean[] dropOffs = new boolean[3];
  boolean gamehasstarted;


  Sokoban() {
    //in constructor to stop box being redrawn 
    //aBox = new Box(252, 303); 
    boxes[0] = new Box(252, 303);
    boxes[1] = new Box(354, 303);
    thePlayer = new Player(150, 150);

    if (gamehasstarted == false) {
      fill(0);
      text("Click to start", 400, 400);
    }
  }

  void drawGame() {

    gameGrid = new Floor(border, border);
    playerHouse = new StartTile(border, border);
    dropoffOne = new Dropoff(456, 456);
    successDrop = new Dropoffoccupied(50, 50);

    gameGrid.drawTile();
    //aBox.drawTile();
    for (int i = 0; i < 2; i++) {
      boxes[i].drawTile();
    }
    thePlayer.drawTile();
    dropoffOne.drawTile();
    playerHouse.drawTile();
  }

  void movePlayer() {

    if (keyCode == RIGHT) {

      ///////////////////PLAYER MOVE///////////////////////////////////
      xMultiplier++;
      if (thePlayer.playerBoundyRight()) {
        xMultiplier = 9;
      }
      if (sandwichRight() == false) {
        thePlayer.alterthePosition(border + tileSize*xMultiplier, border + tileSize*+yMultiplier);
      } else {
        xMultiplier--;
        thePlayer.alterthePosition(558, border + tileSize*+yMultiplier);
      }
      ///////////////////////////////////////////////////////////////////

      /////////////////////BOX DROPPED OFF///////////////////////////////
      boxDroppedoff();
      ///////////////////////////////////////////////////////////////////

      ///////////////////PLAYER MOVE BOX/////////////////////////////////
      for (int i = 0; i < 2; i++) {
        if (boxDroppedoff() == false && thePlayer.tileX == boxes[i].tileX && thePlayer.tileY == boxes[i].tileY) {

          boxes[i].alterthePosition(boxes[i].tileX  +tileSize, boxes[i].tileY);                  
          /////////////////////////////////////////////////////////////////
        }
      }
    }

    if (keyCode == DOWN) {

      ///////////////////PLAYER MOVE//////////////////
      yMultiplier++;
      if (thePlayer.playerBoundyDown()) {
        yMultiplier = 9;
      }
      if (sandwichDown() == false) {
        thePlayer.alterthePosition(border + tileSize*xMultiplier, border + tileSize*+yMultiplier);
      } else {
        yMultiplier--;
        thePlayer.alterthePosition(border + tileSize*+xMultiplier, 558);
      }
      /////////////////////////////////////////////////////////////////

      /////////////////////BOX DROPPED OFF//////////////////
      boxDroppedoff();
      /////////////////////////////////////////////////////////////////

      ///////////////////PLAYER MOVE BOX//////////////////
      for (int i = 0; i < 2; i++) {
        if (boxDroppedoff() == false &&  thePlayer.tileX == boxes[i].tileX && thePlayer.tileY == boxes[i].tileY) {

          boxes[i].alterthePosition(boxes[i].tileX, boxes[i].tileY +tileSize);                   
          /////////////////////////////////////////////////////////////////
        }
      }
    }


    if (keyCode == LEFT) {

      ///////////////////PLAYER MOVE//////////////////      
      xMultiplier--;
      if (thePlayer.playerBoundyLeft()) {
        xMultiplier = 0;
      }     
      if (sandwichLeft() == false) {
        thePlayer.alterthePosition(border + tileSize*xMultiplier, border + tileSize*+yMultiplier);
      } else {      
        xMultiplier++;
        thePlayer.alterthePosition(201, border + tileSize*+yMultiplier);
      }

      /////////////////////BOX DROPPED OFF//////////////////
      boxDroppedoff();
      ///////////////////////////////////////////////////////////////////

      ///////////////////PLAYER MOVE BOX//////////////////
      for (int i = 0; i < 2; i++) {
        if (boxDroppedoff() == false && 
          thePlayer.tileX == boxes[i].tileX && thePlayer.tileY == boxes[i].tileY) {

          boxes[i].alterthePosition(boxes[i].tileX  -tileSize, boxes[i].tileY);                   
          /////////////////////////////////////////////////////////////////
        }
      }
    }

    if (keyCode == UP) {

      ///////////////////PLAYER MOVE//////////////////
      yMultiplier--;
      if (thePlayer.playerBoundyUp()) {
        yMultiplier = 0;
      }
      if (sandwichUp() == false) {
        thePlayer.alterthePosition(border + tileSize*xMultiplier, border + tileSize*+yMultiplier);
      } else {
        yMultiplier++;
        thePlayer.alterthePosition(border + tileSize*+xMultiplier, 201);
      }
      /////////////////////////////////////////////////////////////////
    }

    /////////////////////BOX DROPPED OFF//////////////////
    boxDroppedoff();
    /////////////////////////////////////////////////////////////////

    ///////////////////PLAYER MOVE BOX//////////////////
    for (int i = 0; i < 2; i++) {
      if (boxDroppedoff() == false &&
        thePlayer.tileX == boxes[i].tileX && thePlayer.tileY == boxes[i].tileY) {

        boxes[i].alterthePosition(boxes[i].tileX, boxes[i].tileY -tileSize);                  
        /////////////////////////////////////////////////////////////////
      }
    }
    println("Player X =", thePlayer.tileX, " , ", "Player Y =", thePlayer.tileY);
    thePlayer.drawTile();
    game.drawGame();
  }

  ///////////////////Box Deposit Boolean/////////////////////////
  boolean boxDroppedoff() {

    if (boxes[0].tileX == dropoffOne.tileX &&  boxes[0].tileY == dropoffOne.tileY ||
      boxes[1].tileX == dropoffOne.tileX &&  boxes[1].tileY == dropoffOne.tileY) {
      println("Box", boxes[0], " has been deposited.");
      fill(0);
      text("Box 1 Deposited", 400, 50);
      rect(20, 20, 20, 20);
      return true;
    } else {
      return false;
    }
  }
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ///////////////////Sandwich Booleans - Wall, Box, Player Sandwich/////////////////////////
  boolean sandwichRight() {
    if (thePlayer.tileX == 558 && boxes[0].tileX == thePlayer.tileX +tileSize  && boxes[0].tileY == thePlayer.tileY ||
      thePlayer.tileX == 558 && boxes[1].tileX == thePlayer.tileX +tileSize  && boxes[1].tileY == thePlayer.tileY) {
      return true;
    } else {
      return false;
    }
  }

  boolean sandwichDown() {
    if (thePlayer.tileY == 558 && boxes[0].tileY == thePlayer.tileY +tileSize && boxes[0].tileX == thePlayer.tileX ||
      thePlayer.tileY == 558 && boxes[1].tileY == thePlayer.tileY +tileSize && boxes[1].tileX == thePlayer.tileX) {
      return true;
    } else {
      return false;
    }
  }

  boolean sandwichLeft() {
    if (thePlayer.tileX == 201 && boxes[0].tileX == thePlayer.tileX -tileSize && boxes[0].tileY == thePlayer.tileY ||
      thePlayer.tileX == 201 && boxes[1].tileX == thePlayer.tileX -tileSize && boxes[1].tileY == thePlayer.tileY) {
      return true;
    } else {
      return false;
    }
  }

  boolean sandwichUp() {
    if (thePlayer.tileY == 201 && boxes[0].tileY == thePlayer.tileY -tileSize &&  boxes[0].tileX == thePlayer.tileX ||
      thePlayer.tileY == 201 && boxes[1].tileY == thePlayer.tileY -tileSize &&  boxes[1].tileX == thePlayer.tileX) {
      return true;
    } else {
      return false;
    }
  }
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
}