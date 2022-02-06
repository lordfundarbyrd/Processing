// Simple sketch to show key pressed
int ballx=0;
int bally=0;
int speed=10;
 
public void setup()
{
    size(600, 600);
    background(0);
}
 
void draw()
{
  smooth(); 
  background(0);
  ellipse(ballx,bally,20,20);   
}
 
public void keyPressed()
{
   
    println("Key code pressed: " + keyCode);
     
    if (key == 'w')
    {
      ballUp();
    }
    else if (key == 'z')
    {
        ballDown();
    }
    else if (key == 'a')
    {
        ballLeft();
    }
    else if (key == 's')
    {
        ballRight();
    }
         
}
public void keyReleased()
{
    println("Just to let you know a key has been released");
}
 
void ballUp()
{
  if ( bally >=0 && bally <= width )
  {
    bally = bally-speed;
  }
}
 
void ballRight()
{
  if ( ballx >=0 && ballx <= width )
  {
    ballx = ballx+speed;    
  }
}
 
void ballLeft()
{
  if ( ballx >=0 && ballx <= width )
  {
    ballx = ballx-speed;   
  }
}
void ballDown()
{  
  if ( bally >=0 && bally <= height )
  {
    bally = bally+speed;   
  }
}
