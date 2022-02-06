float xPos;
float yPos;
float yVel;

void settings() {
  size (300,600); // sets up graphical infrastructure
}
void setup() {
  xPos = 10; //meters
  yPos = 10; //meters
  yVel = 10.0 * (1/60F); //m/s
}
void draw () {
  background(0);
  fill(255,255,0);
  ellipse(xPos, yPos,20,20);
  yPos += yVel; // yPos = yPos + yVel
  if(yPos > height || yPos < 0) {
    yVel = -yVel;
  }
}