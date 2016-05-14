//Robbie Mills

Sokoban game;

void setup() {

  size(800, 800);
  
  game = new Sokoban();
}

void draw() {

  background(255);
  
  game.drawGame();
  
}