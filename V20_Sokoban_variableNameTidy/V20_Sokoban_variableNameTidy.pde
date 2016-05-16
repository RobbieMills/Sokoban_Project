//Robbie Mills

Sokoban game;

void setup() {

  size(800, 800);
  background(255);
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
void keyPressed() {

  game.movePlayer();
}