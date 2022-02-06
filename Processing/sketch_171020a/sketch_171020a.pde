Ball tB;

void settings() {
  size (1000,600);
}

void setup() {
  background(0);
  tB = new Ball();
  
  tB.xPos = 100;
  tB.yVel =  0;
  tB.xVel = 0;
  tB.diameter = 50;
  tB.yAcc = 9.8;
}

void draw() {
  background(0);
  tB.render();
  tB.update(1.0/frameRate);
}
