class Sokoban {

  boolean gamehasstarted;

  String[] lines;

  String pString = "p";
  String fString = "f";
  String bString = "b";

  //String [][] anArray;

  int index = 0;

  int objectsDrawn;

  int yPosChange;
  int xPosChange;


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

        println(pieces.length);

        //pieces[0] = anArray[0][1];
        //pieces[1] = anArray[0][2];
        //pieces[2] = anArray[0][3];
        //pieces[3] = anArray[0][4];


        for (int i = 0; i < 12; i++) {

          if (objectsDrawn == 6) {

            yPosChange = 51;
          }

          if (xPosChange == 306) {

            xPosChange =0;
          }

          if (pieces[i].equals(pString) == true && objectsDrawn < 12) {

            println("There's a 'p' in the text file");
            xPosChange = xPosChange + 51;

            firstPlayer= new Player(150 + xPosChange, 150 + yPosChange);
            firstPlayer.drawTile();
            objectsDrawn = objectsDrawn +1;
          } else {

            if (pieces[i].equals(fString) == true && objectsDrawn < 12) {

              println("There's a 'f' in the text file");
              xPosChange = xPosChange + 51;

              firstFloor= new Floor(150 + xPosChange, 150 + yPosChange);
              firstFloor.drawTile();
              objectsDrawn = objectsDrawn +1;
            } else {

              if (pieces[i].equals(bString) == true && objectsDrawn < 12) {

                println("There's a 'b' in the text file");
                xPosChange = xPosChange + 51;

                firstBox= new Box(150 + xPosChange, 150 + yPosChange);
                firstBox.drawTile();
                objectsDrawn = objectsDrawn +1;
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