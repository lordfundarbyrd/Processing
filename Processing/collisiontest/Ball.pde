class Ball {
  PVector pos;
  PVector vel;
  PVector acc;
  
  float radius;
  float mass;
  
  public Ball(int x, int y, PVector velocity) {
    
    pos = new PVector (x, y);
    vel = velocity;
    acc = new PVector();
    
    radius = 30;
    mass = 1;
  }
  
  void render() {
    pushMatrix();
    // noStroke();
    strokeWeight(0.25);
    fill(255,255,255);
    ellipse(pos.x,pos.y,radius,radius);
    popMatrix();
  }
  
  void update(float dT) {
    PVector revert = pos.copy();
    pos.add (PVector.mult (vel, dT));
    if (pos.x < 0 || pos.x > width) {
      pos.x = revert.x;
      vel.x = -vel.x;
    }
    if (pos.y < 0 || pos.y > height) {
      pos.y = revert.y;
      vel.y = -vel.y;
    }
    vel.add (PVector.mult (acc, dT));
  }
  
  void collision (Ball b) {
    Ball a = this;
    
    if (abs(a.pos.dist (b.pos)) > (a.radius + b.radius))
      return;
    
    // n=norm(a.pos-b.pos)
    PVector n = PVector.sub(a.pos, b.pos).normalize();
    
    // f=dot((a.m*a.vel-b.m*b.vel),n)
    float f = PVector.dot (PVector.mult(a.vel, a.mass).sub(PVector.mult(b.vel, b.mass)), n);
    n.mult (f * c);  // optimization: c*(f*n)
    
    // a.vel=a.vel-c*(f*n)/a.m
    a.vel.sub (PVector.mult (n, a.mass));

    // b.vel=b.vel+c*(f*n)/b.m
    b.vel.add (PVector.mult (n, b.mass));
    
    // eliminate the "tunneling" effect when the resulting positions are still within
    // the collision radius "after" the collision...
    
    float actual = abs(a.pos.dist (b.pos));
    float target = a.radius + b.radius;
    if (actual <= target) {
      n = PVector.sub(a.pos, b.pos).normalize();
      a.pos.add (PVector.mult(n, (target-actual)/2));
      b.pos.sub (PVector.mult(n, (target-actual)/2));
    }
  }
}
