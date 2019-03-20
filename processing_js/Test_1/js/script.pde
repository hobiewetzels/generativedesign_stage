// Runs on initial load
int i = 0;
int y1 = 0;
int y2 = 0;
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
  background(100);
  if (y1 > 250 ){
  y1 = y1 + 1;
  y2 = y2 + 1;
  }
  else{
    println("hi");
  }
  stroke(255,255,255);
  line(0, y1, 970, y2);
}