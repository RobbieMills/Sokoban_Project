String[] lines;

int index = 0;

Sokoban game;

void setup() {

  size(800, 800);
  background(255);
  stroke(0);
  textAlign(CENTER);
  textSize(32);

  game = new Sokoban();
}

void draw() {
}

void mouseClicked() {

  background(255);
  game.drawGame();
}