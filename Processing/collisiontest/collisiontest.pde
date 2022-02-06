void settings() {
  size (750, 750, P3D);
}

float c;
float dT;
ArrayList<Ball> balls;

Ball ball1;
Ball ball2;

void setup() {
  colorMode (HSB, 1, 1, 1);
  sphereDetail (20);
  ortho();
  
  balls = new ArrayList<Ball>();
  c = 1;
  dT = 0.5F;
  
  ball1 = new Ball(width/2,height/2, new PVector(0,0));
  ball2 = new Ball(width/4,height/4, new PVector(15,15));
  
  balls.add(ball1);
  balls.add(ball2);
}

void draw() {
  background(0);
  lights();
  
  ball1.pos.add(ball1.vel);
  
  for (Ball a: balls) {
    a.render();
    a.update(dT);
  }
  
  for (int i = 0; i < balls.size(); i++)
    for (int j = i; j < balls.size(); j++)
      balls.get(i).collision (balls.get(j));
}

public void keyPressed() {

        if (key == 'w') {
            ballUp();
        } else if (key == 's') {
            ballDown();
        } else if (key == 'a') {
            ballLeft();
        } else if (key == 'd') {
            ballRight();
        } else if (key == 'e') {
            ballUp();
            ballRight();
        } else if (key == 'q') {
            ballUp();
            ballLeft();
        } else if (key == 'z') {
            ballDown();
            ballLeft();
        } else if (key == 'x') {
            ballDown();
            ballRight();
        }

    }

    public void keyReleased() {
        ball1.vel.set(1,1);
    }

    void ballUp() {
        if (ball1.pos.y >= 0) {
            ball1.pos.y = ball1.pos.y - ball1.vel.y;
            if (ball1.pos.y < 0) {
                ball1.pos.y=0;
            }
        }
    }

    void ballRight() {
        if (ball1.pos.x <= width) {
            ball1.pos.x += ball1.vel.x;
            if (ball1.pos.x > width) {
                ball1.pos.x=width;
            }
        }
    }

    void ballLeft() {
        if (ball1.pos.x >= 0) {
            ball1.pos.x -= ball1.vel.x;
            if (ball1.pos.x < 0) {
                ball1.pos.x=0;
            }
        }
    }

    void ballDown() {
        if (ball1.pos.y <= height) {
            ball1.pos.y += ball1.vel.y;
            if (ball1.pos.y > height) {
                ball1.pos.y=height;
            }
        }
    }
