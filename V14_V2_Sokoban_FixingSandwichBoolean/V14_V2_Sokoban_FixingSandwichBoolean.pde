//Robbie Mills

Sokoban game;

boolean gamehasstarted;

void setup() {

  size(800, 800);

  background(255);
  textAlign(CENTER);
  textSize(32);

  game = new Sokoban();
}

void draw() {

  if (gamehasstarted == false) {
    fill(0);
    text("Click to start", 400, 400);
  }
}

void mouseClicked() {

  background(255);
  game.drawGame();
  gamehasstarted = true;
}
void keyPressed() {

  if (gamehasstarted == true) {
    game.movePlayer();
  }
}