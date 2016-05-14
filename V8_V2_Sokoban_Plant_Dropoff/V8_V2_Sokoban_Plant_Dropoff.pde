//Robbie Mills

Sokoban game;

boolean gamehasstarted;

void setup() {

  size(800, 800);

  background(255);

  game = new Sokoban();
}

void draw() {
  
  if(gamehasstarted == false){
  textAlign(CENTER);
  textSize(32); 
  fill(0);
  text("Click to start", 400, 400);
  }
}


void mouseClicked() {

  game.drawGame();
  gamehasstarted = true;
}
void keyPressed() {

  game.movePlayer();
}