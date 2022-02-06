class Ball {
  PVector pos;
  PVector vel;
  PVector acc;
  
  float radius;
  float mass;
  
  color fill;
  
  public Ball() {
    
    pos = new PVector (mouseX, mouseY, -000);
    vel = new PVector(random(-15, 15), random(-15, 15), 0);
    acc = new PVector();
    
    radius = 30;
    mass = 1;
    fill = color (random(1), 1, 1);
  }
  
  void render() {
    pushMatrix();
    translate (pos.x, pos.y, pos.z);
    // noStroke();
    strokeWeight(0.25);
    fill (fill);
    sphere(radius);
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
