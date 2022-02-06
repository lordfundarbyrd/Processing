void settings() {
  size (750, 750, P3D);
}

float c;
float dT;
ArrayList<Ball> balls;

void setup() {
  colorMode (HSB, 1, 1, 1);
  sphereDetail (20);
  ortho();
  
  balls = new ArrayList<Ball>();
  c = 1;
  dT = 0.5F;
}

void draw() {
  background(0);
  lights();
  
  for (Ball a: balls) {
    a.render();
    a.update(dT);
  }
  
  for (int i = 0; i < balls.size(); i++)
    for (int j = i; j < balls.size(); j++)
      balls.get(i).collision (balls.get(j));
}

void mouseClicked() {
  balls.add (new Ball());
}
