class Sokoban {

  boolean gamehasstarted;

  String[] lines;

  String pString = "p";
  String fString = "f";
  String bString = "b";

  //String [][] anArray;

  int index = 0;

  Box firstBox;
  Player firstPlayer;
  Floor firstFloor;

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

            firstPlayer= new Player(150 + i*51, 150 + 20);
            firstPlayer.drawTile();
          } else {

            if (pieces[i].equals(fString) == true) {

              println("There's a 'f' in the text file");

              firstFloor= new Floor(150 + i*51, 150 + 20);
              firstFloor.drawTile();
            } else {

              if (pieces[i].equals(bString) == true) {

                println("There's a 'b' in the text file");

                firstBox= new Box(150 + i*51, 150 + 20);
                firstBox.drawTile();
              }
            }
          }
        }
      }
    }

    catch (NullPointerException errorLoadingRectanglePositionsInSetup) {

      println("no file was found here");
    }
  }
}