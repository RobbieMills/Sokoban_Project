class Dropoffoccupied extends Tile {

  PImage dropoffOccupied;

  Dropoffoccupied(float tileX, float tileY) {

    super(tileX, tileY);

    dropoffOccupied = loadImage("Dropoffoccupied_V1.png");
  }

  void drawTile(float tileX, float tileY) {

    image(dropoffOccupied, tileX, tileY);
  }
}