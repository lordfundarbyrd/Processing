ArrayList pronouns; 
int i;

float a;
float b;
float c;

void settings() {
  size(800,300);
}

void setup() {
  pronouns = new ArrayList();
  pronouns.add(new String("he/him"));
  pronouns.add(new String("she/her"));
  pronouns.add(new String("they/them"));
  pronouns.add(new String("it/its"));
  pronouns.add(new String("ze/zir"));
  pronouns.add(new String("ze/hir"));
  pronouns.add(new String("fae/faer"));
  pronouns.add(new String("xe/xir"));
  pronouns.add(new String("xe/xem"));
  pronouns.add(new String("ey/em"));
  pronouns.add(new String("ne/nem"));
  pronouns.add(new String("ve/ver"));
  pronouns.add(new String("ae/aer"));
  pronouns.add(new String("co/cos"));
  pronouns.add(new String("per/per"));
  pronouns.add(new String("hy/hym"));
  pronouns.add(new String("kie/kir"));
  pronouns.add(new String("mer/mer"));
  pronouns.add(new String("sie/sier"));
  pronouns.add(new String("thon/thon"));
  pronouns.add(new String("en/en"));
  pronouns.add(new String("yo/yo"));
  pronouns.add(new String("kei/keir"));
  pronouns.add(new String("No pronoun"));
  pronouns.add(new String("Any pronoun"));
  pronouns.add(new String("Please ask"));
  
  a = random(0, 255);
  b = random(0, 255);
  c = random(0, 255);
  
  i = (int)random(0,pronouns.size());
}

void draw() {
  background(0);
  fill(a,b,c);
  textSize(100);
  text(pronouns.get(i).toString(), 30, 100);
}

void mousePressed() {
  i = (int)random (0, pronouns.size());
  
  a = random(0, 255);
  b = random(0, 255);
  c = random(0, 255);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      i++;
      a = random(0, 255);
      b = random(0, 255);
      c = random(0, 255);
      if (i == pronouns.size()) {
        i = 0;
      }
    }
    if (keyCode == DOWN) {
      i--;
      a = random(0, 255);
      b = random(0, 255);
      c = random(0, 255);
      if (i == -1) {
        i = pronouns.size()-1;
      }
    }
  }
}
