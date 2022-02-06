import processing.opengl.*;
ArrayList bouncyBalls;
Puck player1;
PFont helvetica24;
int score = 0;

void setup() {
  size(720,400);
  smooth();
  
  bouncyBalls = new ArrayList();
  for(int i=0; i < 5; i++) {
    bouncyBalls.add(new Ball());
  }
  
  player1 = new Puck();
  
  helvetica24 = loadFont("HelveticaNeue-Bold-24.vlw");
}


