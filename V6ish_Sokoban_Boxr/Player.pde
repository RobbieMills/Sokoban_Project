class Player {

  PImage player;
  float playerX;
  float playerY;

  Player(float _playerX, float _playerY) {

    playerX = _playerX;
    playerY = _playerY;

    player = loadImage("Sokoban_PlayerOnFloor_V1.png");
  }

  void drawPlayer() {

    image(player, playerX, playerY);
  }

  void alterplayerPosition(float _playerX, float _playerY) {

    playerX = _playerX;
    playerY = _playerY;

    print("The Player X Position is", playerX);
    print("   " + "The Player Y Position is", playerY);
    println("");

    if (playerX < 150) {
      playerX = 150;
    }
    if (playerX > 609) {
      playerX = 609;
    }
    if (playerY < 150) {
      playerY = 150;
    }
    if (playerY > 609) {
      playerY = 609;
    }
  }
}