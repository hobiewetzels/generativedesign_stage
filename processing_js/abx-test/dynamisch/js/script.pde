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
int currentModel = 0;


//put models into array
string[] models = new string[4];
models[0] = "images/seat-model-(1).png";
models[1] = "images/seat-model-(2).png";
models[2] = "images/seat-model-(3).png";
models[3] = "images/seat-model-(4).png";

console.log(models);
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

//track mouse position
$( "#art" ).mousemove(function( event ) {
  mousexpos = event.pageX;
  mouseypos = event.pageY;
});

//previous
$( ".buttonSlideImg1" ).click(function() {
  currentModel -= 1;
  //reset
  if(currentModel == -1){
    currentModel = 3;
  }
  //change image
  $(".artImg").attr("src", models[currentModel]);

  //change color set
  switch (currentModel){
    //orange
    case 0:
      colors[0] = #FF5100;
      colors[1] = #FF9426;
      colors[2] = #FFFFFF;
      colors[3] = #FF513B;
      break;
    //black
    case 1: 
      colors[0] = #000000;
      colors[1] = #FFFFFF;
      colors[2] = #E3E3E3;
      colors[3] = #C4C4C4;
      break;
    //red
    case 2: 
      colors[0] = #FF0000;
      colors[1] = #FFFFFF;
      colors[2] = #FF3F00;
      colors[3] = #FF0049;
      break;
    //blue
    case 3:
      colors[0] = #0F43FF;
      colors[1] = #FFFFFF;
      colors[2] = #0F7FFF;
      colors[3] = #0FCEFF;
  }
  //change gradient
  //$(".backdrop").css("background-image", "linear-gradient(180deg, white,#" + hex(colors[0], 6) + ")");
  //change ball color
  for (int i = 0; i < numBalls; i++) {
    clrPick = round(random(3));
    balls[i].clr = colors[clrPick];
  }
});

//next
$( ".buttonSlideImg2" ).click(function() {
  currentModel += 1;
  //reset
  if(currentModel == 4){
    currentModel = 0;
  }
  //change image
  $(".artImg").attr("src", models[currentModel]);

  
  //change color set
  switch (currentModel){
    //orange
    case 0:
      colors[0] = #FF5100;
      colors[1] = #FF9426;
      colors[2] = #FFFFFF;
      colors[3] = #FF513B;
      break;
    //black
    case 1: 
      colors[0] = #000000;
      colors[1] = #FFFFFF;
      colors[2] = #E3E3E3;
      colors[3] = #C4C4C4;
      break;
    //red
    case 2: 
      colors[0] = #FF0000;
      colors[1] = #FFFFFF;
      colors[2] = #FF3F00;
      colors[3] = #FF0049;
      break;
    //blue
    case 3:
      colors[0] = #07A8FF;
      colors[1] = #FFFFFF;
      colors[2] = #0F43FF;
      colors[3] = #0FCEFF;
  }
  //change gradient
  //$(".backdrop").css("background-image", "linear-gradient(180deg, white,#" + hex(colors[0], 6) + ")");
  //change ball color
  for (int i = 0; i < numBalls; i++) {
    clrPick = round(random(3));
    balls[i].clr = colors[clrPick];
  }
});

  //start timer
var timer;
setInterval(function() {
    timer += 1;
}, 1000);


$( ".cta" ).click(function() {
alert("time: " + timer + "s");
});