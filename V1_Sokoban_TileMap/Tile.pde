class Tile {

  PImage floortile;

  Tile() {
    floortile = loadImage("Sokoban_Floor_V1.png");
  }

  void drawTile() {

    for (int numofColumns = 0; numofColumns < 10; numofColumns ++) {
      for (int numofRows = 0; numofRows < 10; numofRows ++) {

        image(floortile, 150+51*numofColumns, 150+51*numofRows);
      }
    }
  }
}