//global vars
int numBalls = 600;
Ball[] balls = new Ball[numBalls];
int angle = 0;
int mousexpos;
int mouseypos;
int distX;
int distY;
int model;
int clrPick;
int triggerPick;

//create color pallets
//pick a model

color[] colors = new color[4];
colors[0] = #FF5100;
colors[1] = #FF9426;
colors[2] = #FFFFFF;
colors[3] = #FF513B;


// Runs on initial load
void setup()
{
  size(970, 250);
  
  background(255);

  loop();

  smooth();

  for (int i = 0; i < numBalls; i++) {
    clrPick = round(random(3));
    balls[i] = new Ball(random(-100, 970), random(250) , random(60) + 15, colors[clrPick], i, false);
  }
  //set triggers
  for (int i = 0; i < 10; i++){
    triggerPick = round(random(numBalls));
    balls[triggerPick].triggerset = true;
  }


}



// Runs repeatedly until exit() is called.
void draw()
{  
  background(255);

  for (int i = 0; i < numBalls; i++) {
    balls[i].display();
    balls[i].move();
    balls[i].collide();
    balls[i].trigger();

  }

    
}

class Ball {
  int x;
  int y;
  int r;
  int id;
  int clr;
  int startR;
  int startClr;
  int opacity;
  boolean triggerset;

Ball(int xin, int yin, int rin, int clrin, int idin, boolean triggerin){
  x = xin;
  y = yin;
  r = rin;
  id = idin;
  clr = clrin;
  triggerset = triggerin;
  startR = r;
  startClr = clrin;
  opacity = 0;
}
void move(){
  x += 1;
  if (x > 970 + 100){
    x = -100;
  }
}
void display() {
  noStroke();
  fill(clr, opacity);
  ellipse(x, y, r, r);


}
void collide(){
  //if collide change color
    for (int i = 0; i < numBalls; i++) {
    distX = Math.abs(balls[i].x - mousexpos);
    distY = Math.abs(balls[i].y - mouseypos);
    if (distX < balls[i].r / 2  && distY < balls[i].r / 2 && balls[i].r < 300){
      balls[i].r += 0.0025;
      balls[i].opacity += 0.025;
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
void trigger(){
  for (int i = 0; i < numBalls; i++) {
    if (balls[i].triggerset == true){
      
      //grow
      balls[i].r = sin(angle) * (i / 10) + (i / 10);
      balls[i].opacity = sin(angle) * (i / 10) + (i / 10);
      angle += 0.000008;


    }else{

    }
  }
}

//end
}
$( "#art" ).mousemove(function( event ) {
  mousexpos = event.pageX;
  mouseypos = event.pageY;
});