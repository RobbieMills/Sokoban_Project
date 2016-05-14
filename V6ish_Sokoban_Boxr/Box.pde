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
  }

  void alterboxPosition(float _boxX, float _boxY) {

    boxX = _boxX;
    boxY = _boxY;
  }
}