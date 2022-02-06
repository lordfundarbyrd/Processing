PVector position;
PVector velocity;

void setup() {
  size(1000,1000,P3D);
  smooth();
  background(255);
  position = new PVector(500,500,500);
  velocity = new PVector(2.5,5,5);
}

void draw() {
  background(255);
    
  pushMatrix();
  translate(500,500,0);
  noFill();
  box(500);
  popMatrix();
  
  pushMatrix();
  translate(position.x,position.y, position.z);
  noFill();
  sphere(20);
  popMatrix();
  
  // Add the current speed to the position.
  position.add(velocity);

  if (position.x > 625 || position.x < 375) {
      position.x -= velocity.x;
      velocity.x = -velocity.x;
      velocity.x *= 0.85;
    }
  if (position.y > 625 || position.y < 375) {
      // fell through the floor! Move it back up... (bounce)
      position.y -= velocity.y; //puts it back on the screen / bounce
      velocity.y = -velocity.y; //changes the direction
      if (velocity.y < 0)
        // hit the "floor"
        velocity.y *= 0.85; // nonelastic bounce-- steal energy
    }   
    
    if (position.z > 250 || position.z < 0) {
      // fell through the floor! Move it back up... (bounce)
      position.z -= velocity.z; //puts it back on the screen / bounce
      velocity.z = -velocity.z; //changes the direction
      if (velocity.z < 0)
        // hit the "floor"
        velocity.z *= 0.85; // nonelastic bounce-- steal energy
    }   
}
