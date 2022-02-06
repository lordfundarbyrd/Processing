import processing.core.*; 
import processing.xml.*; 

import processing.opengl.*; 

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class Balls extends PApplet {

class Ball {
  PVector pos = new PVector();
  PVector vel = new PVector();
  float rad = 30;
  int c = 0;
  boolean dead = false;
  
  Ball() {
    pos.x = random(0,width);
    pos.y = random(0,height);
    vel.x = random(0,5);
    vel.y = random(0,5);
  }
  
  public void update() {
  
    if ( pos.y + rad > height ) vel.y = abs(vel.y) * -1;
    if ( pos.y - rad < 0 )      vel.y = abs(vel.y);
    if ( pos.x + rad > width )  vel.x = abs(vel.x) * -1;
    if ( pos.x - rad < 0 )      die();
    
    pos.add(vel);
  }
  
  public void display() {
    fill(c); noStroke(); ellipseMode(RADIUS);
    ellipse(pos.x,pos.y,rad,rad);
  }
  
  public void die() {
    dead = true;
  }
  
  public boolean isDead() {
    return dead;
  }
}
class Puck extends Ball {
  
  Puck() {
    vel.set(0,0,0);
    pos.x = mouseX;
    pos.y = mouseY;
    
    rad = 40;
    c = 0xffE8270C;
  }
  
  public void update() {
    pos.x = mouseX;
    pos.y = mouseY;
  }
}
public void bounce(Ball ballA, Ball ballB) {
  
  // first, if the balls are overlapping,
  // move them away from each other until they're not.
  PVector ab = new PVector();
  ab.set(ballA.pos);
  ab.sub(ballB.pos);
  ab.normalize();
  while(ballA.pos.dist(ballB.pos) < ballA.rad + ballB.rad) {
    ballA.pos.add(ab);
  }

  // based on formulas found here: 
  // http://freespace.virgin.net/hugo.elias/models/m_snokr.htm
  PVector impact = new PVector();
  PVector impulse = new PVector();
  float impactSpeed;
  
  impact.set(ballA.pos);
  impact.sub(ballB.pos);
  
  impulse.set(ab);

  impactSpeed = impulse.dot(impact);
  
  impulse.mult(sqrt(impactSpeed));
  
  ballA.vel.add(impulse);
  ballB.vel.sub(impulse);
  
  // gimme a score!
  score += 3;
}

ArrayList bouncyBalls;
Puck player1;
PFont helvetica24;
int score = 0;

public void setup() {
  size(720,400);
  smooth();
  
  bouncyBalls = new ArrayList();
  for(int i=0; i < 5; i++) {
    bouncyBalls.add(new Ball());
  }
  
  player1 = new Puck();
  
  helvetica24 = loadFont("HelveticaNeue-Bold-24.vlw");
}


public void draw() {
  background(255);
  
  stroke(0xff0C7BE8); strokeWeight(1); fill(0xffBAD1E8); rectMode(CENTER);
  rect(0,height/2,100,height+10);
  
  fill(0); textFont(helvetica24); textAlign(RIGHT);
  text("score: " + nf(score,5,0), width-20, 34);
  
  // check for collisions
  for(int i=0; i < bouncyBalls.size(); i++) {
    Ball ballA = (Ball) bouncyBalls.get(i);
    
    if (ballA.isDead()) {
      bouncyBalls.remove(i);
      i--;
    }
    
    if(ballA.pos.dist(player1.pos) < ballA.rad + player1.rad) {
      bounce(ballA,player1);
    }
    
    for(int j=0; j < bouncyBalls.size(); j++) {
      Ball ballB = (Ball) bouncyBalls.get(j);
      if(!ballA.equals(ballB) && ballA.pos.dist(ballB.pos) < ballA.rad + ballB.rad){
          bounce(ballA,ballB);
      }
    } 
  }  
  
  player1.update();
  player1.display();
  
  // update the balls and move 'em!
  for(int i=0; i < bouncyBalls.size(); i++) {
    Ball theBall = (Ball) bouncyBalls.get(i);
    theBall.update();
    theBall.display();
  }
}

  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#FFFFFF", "Balls" });
  }
}
