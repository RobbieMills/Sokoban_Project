class Dropoff extends Tile {

  PImage dropoff;

  Dropoff(float tileX, float tileY) {

    super(tileX, tileY);

    dropoff = loadImage("DropOff_V1.png");
  }

  void drawTile() {

    image(dropoff, tileX, tileY);
  }
}