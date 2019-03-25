//global vars
int numBalls = 300;
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
  
  background(255);

  loop();

  smooth();

  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(random(970), random(250) , random(60) + 30, random(255), i, false);
  }

}



// Runs repeatedly until exit() is called.
void draw()
{  
  background(255);

  for (int i = 0; i < numBalls; i++) {



    balls[i].display();
    
    //balls[i].loop();
    balls[i].collide();

  }

    
}

class Ball {
  int x;
  int y;
  int r;
  int id;
  int clrR;
  int clrG;
  int clrB;
  boolean grow;
  int startR;
  int startClr;
  int opacity;

Ball(int xin, int yin, int rin, int clrin, int idin, boolean grow){
  x = xin;
  y = yin;
  r = rin;
  id = idin;
  clrR = clrin;
  clrG = clrin;
  clrB = clrin;
  grow = false;
  startR = r;
  startClr = clrin;
  opacity = 0;
}
void move(){
  //x += 1;
}
void display() {
  noStroke();
  fill(clrR, clrG, clrB, opacity);
  ellipse(x, y, r, r);
  angle += 0.02;

}
void collide(){
  //if collide change color
    for (int i = 0; i < numBalls; i++) {
    distX = Math.abs(balls[i].x - mousexpos);
    distY = Math.abs(balls[i].y - mouseypos);
    if (distX < balls[i].r / 2  && distY < balls[i].r / 2 && balls[i].grow == false && balls[i].r < 400){
      balls[i].r += 0.01;
      balls[i].move();
      balls[i].opacity += 0.1;
    }else{
      //return to start radius
      if (balls[i].r > balls[i].startR){
        balls[i].r -= 0.005;
        }
      //return to start opacity
        if (balls[i].opacity > 0){
        balls[i].opacity -= 0.005;
      }
        //reset color to start value
      

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