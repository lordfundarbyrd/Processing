double time;
double speed,tmpspeed;
double gravitation=1.63;

float corner,tmpcorner;
void setup(){
  size(600,600);
  smooth();
  noStroke();
   background(0);
  time=1;
  speed=25;
  tmpspeed= speed;
  corner=45;
  tmpcorner=corner;
}

void draw(){
  int startX=10;
  int startY=height/2;
  fill(0,0,0,10);
  rect(0,0,width,height);
  fill(255);
  int xpos=(int)(startX + throw_x(time) );
  int ypos=(int)(startY -throw_y(time) );
  ellipse(xpos,ypos,10,10);
  time+=0.4;
  
  if (xpos>width || ypos>height) {
    time=0;
    corner=tmpcorner;
    speed=tmpspeed;
  }
  float factorY=1-mouseY/(float)height;
  tmpcorner=90*factorY;
  
  float factorX=mouseX/(float)width;
  tmpspeed=10+26*factorX;
  fill(0);
  rect(0,0,width,20);
  fill(255);
  text("Angle: "+tmpcorner,10,15);
  text(" Speed: "+tmpspeed,width/2,15);
}

double  throw_x(double time) { return speed*time*cos(radians(corner)); }
double  throw_y(double time) { return (speed*time*sin(radians(corner)) - gravitation/2*time*time); }
