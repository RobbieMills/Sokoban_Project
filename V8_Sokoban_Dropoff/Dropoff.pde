class Dropoff {

  PImage dropoff;
  float dropoffX;
  float dropoffY;

  Dropoff(float _dropoffX, float _dropoffY) {


    dropoffX = _dropoffX;
    dropoffY = _dropoffY;

    dropoff = loadImage("Sokoban_Dropoff_V1.png");
  }

  void drawdropoff() {

    image(dropoff, dropoffX, dropoffY);
    
    // print("The dropoff X Position is", dropoffX);
    //print("   " + "The dropoff Y Position is", dropoffY);
    //println("");
  }

  void alterdropoffPosition(float _dropoffX, float _dropoffY) {

    dropoffX = _dropoffX;
    dropoffY = _dropoffY;

    if (dropoffX < 150) {
      dropoffX = 150;
    }
    if (dropoffX > 609) {
      dropoffX = 609;
    }
    if (dropoffY < 150) {
      dropoffY = 150;
    }
    if (dropoffY > 609) {
      dropoffY = 609;
    }
  }
}