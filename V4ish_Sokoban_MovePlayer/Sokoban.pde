class Sokoban {

  Tile floorTile;

  Player thePlayer;
  Player thePlayer2;

  float theplayerX = 150;
  float theplayerY = 150;

  int xMultiplier = 1; //theplayerX multiplier when moving Player
  int yMultiplier = 1; //theplayerX multiplier when moving Player

  int thing = 1; //integer used to negate the +1 added to xMultiplier when direction changing from RIGHT
  
  int thing2 = 1; //integer used to negate the +1 added to xMultiplier when direction changing from RIGHT


  int m = millis();

  boolean gameover = false;
  boolean withinmapRight = true;

  Sokoban() {
  }

  void drawGame() {

    floorTile = new Tile();
    floorTile.drawTile();

    thePlayer = new Player();
    thePlayer.drawPlayer(theplayerX, theplayerY);
    
    if(theplayerX > 500){
    
    withinmapRight = false;
    }
  }

  void movePlayer() {
    if (withinmapRight && keyCode == RIGHT) {
      game.drawGame();
      
         thing = 1;
         
         yMultiplier = yMultiplier - thing2;
          thing2 = 0;
      //floorTile.drawTile();

      thePlayer.drawPlayer(theplayerX +51*xMultiplier, theplayerY+51*yMultiplier);
      xMultiplier = xMultiplier + 1;


      println(theplayerX);
    }


    if (keyCode == DOWN) {
      //floorTile.drawTile();

thing2 = 0;
      xMultiplier = xMultiplier - thing;

      thing = 0;
      

      game.drawGame();
      thePlayer.drawPlayer(theplayerX +51*xMultiplier, theplayerY+51*yMultiplier);

      //thePlayer.drawPlayer();
      yMultiplier = yMultiplier + 1;
    }
  }
}