class Dropoff {

  PImage dropoff;
  float dropoffX;
  float dropoffY;

  Dropoff(float _dropoffX, float _dropoffY) {

    dropoffX = _dropoffX;
    dropoffY = _dropoffY;

    dropoff = loadImage("DropOff_V1.png");
  }

  void drawdropoff() {

    image(dropoff, dropoffX, dropoffY);
  }

  void alterdropoffPosition(float _dropoffX, float _dropoffY) {

    dropoffX = _dropoffX;
    dropoffY = _dropoffY;
  }
}