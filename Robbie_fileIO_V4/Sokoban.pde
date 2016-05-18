class Sokoban {

  boolean gamehasstarted;

  String[] lines;

  String pString = "p";
  String fString = "f";
  String wString = "w";

  //String [][] anArray;

  int index = 0;

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

        String[] pieces = (split(lines[index], ','));

        //firstCircle = new Box(pieces[0], pieces[1]);      
        //firstPlayer = new Player(pieces[2], pieces[3]);

        index = index + 1;  // Go to the next line for the next run through draw()

        println(pieces[0]);
        println(pieces[1]);
        println(pieces[2]);
        println(pieces[3]);

        //pieces[0] = anArray[0][1];
        //pieces[1] = anArray[0][2];
        //pieces[2] = anArray[0][3];
        //pieces[3] = anArray[0][4];


        for (int i = 0; i < 4; i++) {
          if (pieces[i].equals(pString) == true) {

            println("There's a 'p' in the text file");
            //rect(random(0,width),300,50,50);
            firstPlayer= new Player(150 + i*51, 150 + 20);
            firstPlayer.drawTile();
          }
        }
      }
    } 

    catch (NullPointerException errorLoadingRectanglePositionsInSetup) {

      println("no file was found here");
    } 

    //firstCircle.drawTile();
    //firstPlayer.drawTile();
  }
}