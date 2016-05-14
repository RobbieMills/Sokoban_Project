class Box extends Tile{

  PImage box;

  Box(float tileX, float tileY) {

    super(tileX, tileY);
    
    box = loadImage("Sokoban_Box_V1.png");
  }

  void drawTile() {

    image(box, tileX, tileY);

    //print("The tile X Position is", tileX);
    //print("   " + "The tile Y Position is", tileY);
    //println("");
  }

  void alterboxPosition(float _tileX, float _tileY) {

    tileX = _tileX;
    tileY = _tileY;

    if (tileX < 150) {
      tileX = 150;
    }
    if (tileX > 609) {
      tileX = 609;
    }
    if (tileY < 150) {
      tileY = 150;
    }
    if (tileY > 609) {
      tileY = 609;
    }
  }
}