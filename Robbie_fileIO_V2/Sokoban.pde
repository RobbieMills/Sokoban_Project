class Sokoban {

  boolean gamehasstarted;

  Box firstCircle;
  Player firstPlayer;

  Sokoban() {

    if (gamehasstarted == false) {
      fill(0);
      text("Click to start", 400, 400);
    }

    lines = loadStrings("positions.txt");
  }


  void drawGame() {

    gamehasstarted = true;

    try {  

      if (index < lines.length) {

        int[] pieces = int(split(lines[index], ','));

        firstCircle = new Box(pieces[0], pieces[1]);      
        firstPlayer = new Player(pieces[2], pieces[3]);

        index = index + 1;  // Go to the next line for the next run through draw()
      }
    } 

    catch (NullPointerException errorLoadingRectanglePositionsInSetup) {

      println("no file was found here");
    } 

    firstCircle.drawTile();
    firstPlayer.drawTile();
  }
}