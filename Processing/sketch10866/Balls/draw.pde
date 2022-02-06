void draw() {
  background(255);
  
  stroke(#0C7BE8); strokeWeight(1); fill(#BAD1E8); rectMode(CENTER);
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
