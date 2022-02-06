class Puck extends Ball {
  
  Puck() {
    vel.set(0,0,0);
    pos.x = mouseX;
    pos.y = mouseY;
    
    rad = 40;
    c = #E8270C;
  }
  
  void update() {
    pos.x = mouseX;
    pos.y = mouseY;
  }
}
