//global vars
int y1 = 0;
int y2 = 0;
int x1 = 0;
int x2 = 970;
float angle = 0.0;
int speed1 = 0.1;
int speed2 = 0.2;
boolean up = false;
boolean up2 = false;
// Runs on initial load
void setup()
{
  size(970, 250);
  background(100);

  loop()
  smooth()
}

// Runs repeatedly until exit() is called.
void draw()
{
  //redraw background
  background(50);

  //increase


  //draw line
  for (int i = 0; i < 30; ++i) {

    strokeWeight(10 + sin(angle) * 5);
    stroke(255 - i * 6);
    line(x1, 0, x2, y2 + (i * 30));

    if (up == false) {
      y2 += speed1;
    }
    if (up == true) {
      y2 -= speed1;
    }

  }

  for (int i = 0; i < 30; ++i) {

    strokeWeight(10 + sin(angle) * 5);
    stroke(255 - i * 6);
    line(x1, y1 + (i * 30), x2, 0);

    if (up == false) {
      y1 += speed1;
    
    }
    if (up == true) {
      y1 -= speed1;
    }

  }

  if (y1 > 500) {
    //reset
    up = true;
  }
  if (y1 < -500){
    up = false;
  }
  angle += 0.05;
  //LOG
  //println(sin(angle));
}
