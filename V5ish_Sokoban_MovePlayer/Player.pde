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
  }
}