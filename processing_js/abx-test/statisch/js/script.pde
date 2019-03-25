//global vars
int numBalls = 30;
Ball[] balls = new Ball[numBalls];
int angle = 0;
// Runs on initial load

void setup()
{
  size(970, 250);
  
  background(255);

  loop();

  smooth();

  for (int i = 0; i < numBalls; i++) {
    int r2 = 1 + i * 5;
    balls[i] = new Ball(random(970), random(150) , r2, random(255), i);
  }

}



// Runs repeatedly until exit() is called.
void draw()
{  
  background(150);

  for (int i = 0; i < numBalls; i++) {



    balls[i].display();
    balls[i].move();
    balls[i].loop();
    balls[i].collide();


  }
}

class Ball {
  int x;
  int y;
  int r;
  int id;
  int clr;

Ball(int xin, int yin, int rin, int clrin, int idin){
  x = xin;
  y = yin;
  r = rin;
  id = idin;
  clr = clrin;
}
void move(){
   x += 0.005 * r;
   y += 0.005 * r;
}
void display() {
  noStroke();
  fill(clr, 100);
  ellipse(x, y, r, r);
  angle += 0.0002;
}
void collide(){
  
}
void loop(){
  if (x > 1050){
    x = -100;
  }
  if (y > 325){
    y = -100;
  }
}
//end
}
