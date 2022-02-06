void bounce(Ball ballA, Ball ballB) {
  
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
