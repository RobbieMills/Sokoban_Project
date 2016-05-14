class Dropoffoccupied {

  PImage dropoffoccupied;
  float dropoffoccupiedX;
  float dropoffoccupiedY;
  
  Dropoffoccupied(float _dropoffoccupiedX, float _dropoffoccupiedY) {

    dropoffoccupiedX = _dropoffoccupiedX;
    dropoffoccupiedY = _dropoffoccupiedY;

    dropoffoccupied = loadImage("Dropoffoccupied_V1.png");
  }

  void drawdropoffoccupied(float dropoffoccupiedX, float dropoffoccupiedY) {

    image(dropoffoccupied, dropoffoccupiedX, dropoffoccupiedY);
  }

  void alterdropoffoccupiedPosition(float _dropoffoccupiedX, float _dropoffoccupiedY) {

    dropoffoccupiedX = _dropoffoccupiedX;
    dropoffoccupiedY = _dropoffoccupiedY;
  }
}