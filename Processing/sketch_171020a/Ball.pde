/**
 A class to describe a simple ball
 */

class Ball {
  // attributes...
  float xPos; // location of the ball in space
  float yPos; // in terms of meters (each pixel is a meter)
  float yVel; // velocity: positive moves downwards in m/s
  float xVel; // velocity side to side

  float diameter; // in meters
  
  float yAcc; // gravity m/s/s

  // operations / behaviors...
  void render() {
    fill (0, 0, 250);
    ellipse (xPos, yPos, diameter, diameter);
  }

  void update(float dT) {
    yVel += yAcc * dT;
    
    xPos += xVel * dT;
    if (xPos < 0 || xPos > width) {
      xPos -= xVel * dT;
      xVel = -xVel;
      xVel *= 0.85;
    }

    yPos += yVel * dT;
    if (yPos > height || yPos < 0) {
      // fell through the floor! Move it back up... (bounce)
      yPos -= yVel * dT; //puts it back on the screen / bounce
      yVel = -yVel; //changes the direction
      if (yVel < 0)
        // hit the "floor"
        yVel *= 0.85; // nonelastic bounce-- steal energy
    }    
  }
}