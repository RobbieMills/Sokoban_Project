class Player {

  PImage player;

  Player() {
    player = loadImage("Sokoban_PlayerOnFloor_V1.png");
  }

  void drawPlayer(float playerX, float playerY) {

    image(player, playerX, playerY);
  }
}