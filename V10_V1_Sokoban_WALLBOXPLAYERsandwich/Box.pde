class Box {

  PImage box;
  float boxX;
  float boxY;

  Box(float _boxX, float _boxY) {


    boxX = _boxX;
    boxY = _boxY;

    box = loadImage("Sokoban_Box_V1.png");
  }

  void drawBox() {

    image(box, boxX, boxY);
    
     print("The Box X Position is", boxX);
    print("   " + "The Box Y Position is", boxY);
    println("");
  }

  void alterboxPosition(float _boxX, float _boxY) {

    boxX = _boxX;
    boxY = _boxY;

    if (boxX < 150) {
      boxX = 150;
    }
    if (boxX > 609) {
      boxX = 609;
    }
    if (boxY < 150) {
      boxY = 150;
    }
    if (boxY > 609) {
      boxY = 609;
    }
  }
}