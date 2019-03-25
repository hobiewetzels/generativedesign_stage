//global vars
int numBalls = 50;
Ball[] balls = new Ball[numBalls];
int angle = 0;
int mousexpos;
int mouseypos;
int distX;
int distY;
// Runs on initial load

void setup()
{
  size(970, 250);
  
  background(100);

  loop();

  smooth();

  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(random(970), random(150) , random(20) + 5, random(255), i);
  }

}



// Runs repeatedly until exit() is called.
void draw()
{  
  background(150);

  for (int i = 0; i < numBalls; i++) {



    balls[i].display();
    //balls[i].move();
    //balls[i].loop();
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

}
void display() {
  noStroke();
  fill(clr, 100);
  ellipse(x, y, r, r);
  angle += 0.02;

}
void collide(){
  //if collide change color
    for (int i = 0; i < numBalls; i++) {
    distX = Math.abs(balls[i].x - mousexpos);
    distY = Math.abs(balls[i].y - mouseypos);
    if (distX < balls[i].r  && distY < balls[i].r){
      balls[i].grow = true;
    }
    if (balls[i].grow == true){
      balls[i].r += 0.1;
    }
    }

  
}
void loop(){
  if (x > 970){
    x = 0;
  }
  if (y > 275){
    y = -100;
  }
}
//end
}
$( "#art" ).mousemove(function( event ) {
  mousexpos = event.pageX;
  mouseypos = event.pageY;
});