int angle;

void settings() {
  size (1000,1000);
}

void setup() {
  frameRate(3600);
  colorMode(HSB, 180, 1, 1);
  background(0);
}

void draw() {
  pushMatrix();
  translate (width/2,height/2);
  rotate(radians(-angle));
  stroke(angle,1,1);
  line(-125,0,125,0);
  popMatrix();
  
  pushMatrix();
  translate (width/4,height/4);
  rotate(radians(-angle));
  stroke(angle,1,1);
  line(-125,0,125,0);
  popMatrix();
  
  pushMatrix();
  translate (width-width/4,height-height/4);
  rotate(radians(-angle));
  stroke(angle,1,1);
  line(-125,0,125,0);
  popMatrix();
  
  pushMatrix();
  translate (width/4,height-height/4);
  rotate(radians(-angle));
  stroke(angle,1,1);
  line(-125,0,125,0);
  popMatrix();
  
  pushMatrix();
  translate (width-width/4,height/4);
  rotate(radians(-angle));
  stroke(angle,1,1);
  line(-125,0,125,0);
  popMatrix();
  
  pushMatrix();
  translate (width/2,height/4);
  rotate(radians(angle));
  stroke(angle,1,1);
  line(-125,0,125,0);
  popMatrix();
  
  pushMatrix();
  translate (width/2,height-height/4);
  rotate(radians(angle));
  stroke(angle,1,1);
  line(-125,0,125,0);
  popMatrix();
  
  pushMatrix();
  translate (width-width/4,height/2);
  rotate(radians(angle));
  stroke(angle,1,1);
  line(-125,0,125,0);
  popMatrix();
  
  pushMatrix();
  translate (width/4,height/2);
  rotate(radians(angle));
  stroke(angle,1,1);
  line(-125,0,125,0);
  popMatrix();
  
  angle += 1;
  if (angle == 180) {
    background(0);
    angle = 0;
  }
}
