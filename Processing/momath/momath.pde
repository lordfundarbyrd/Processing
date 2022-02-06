PGraphics canvas;
PShape s; // PShape object
PVector v;

void setup(){
  size(1200,400);
  
  canvas = createGraphics(1200,400);
  canvas.beginDraw();
  canvas.background(255);
  canvas.translate(100, height*3/4);
  canvas.endDraw();
  
  s = createShape();
  s.beginShape();
  s.noFill();
  s.stroke(0);
  s.vertex(0, 0);
  s.vertex(0, 100);
  s.vertex(100, 100);
  s.vertex(100, 0);
  s.endShape(CLOSE);
  s.rotate(PI*3/2);
}

void draw(){ 
  image(canvas,0,0); 
  translate(100, height*3/4);
  line(0,0,1000,0);
  s.rotate(0.005);
  shape(s);
  if ((frameCount*1.) % (PI/.01) <= 1){
    s.translate(0,100);
    s.rotate(3*PI/2);
    canvas.translate(0,100);
    canvas.rotate(3*PI/2);
    
  }
  
  ArrayList vertices = new ArrayList();
  for (int i = 0; i < s.getVertexCount(); i++) {
    vertices.add(s.getVertex(i));
  }
  

  canvas.beginDraw();
  canvas.translate(100, height*3/4);
  canvas.rotate(0.01);
  canvas.strokeWeight(4);
  canvas.stroke(0);
  //canvas.point(frameCount / 3.15 + 50, (float)(sqrt(2) + Math.cosh(((frameCount/57.3)%5.5)-4) - 70));
  canvas.endDraw();

}
