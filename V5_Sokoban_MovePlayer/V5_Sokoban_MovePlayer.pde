//Robbie Mills

Sokoban game;

void setup() {

  size(800, 800);
  
  background(255);

  game = new Sokoban();
}

void draw() {

  //game.drawGame();
}


void mouseClicked(){

  game.drawGame();

}
void keyPressed() {
  
  game.movePlayer();
}