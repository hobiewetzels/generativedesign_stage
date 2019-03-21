//global vars
int[] verticesY = new int[5];
int[] verticesX = new int[5];
int incC = 0;
int incC2 = 50;
int inc = 0;

for (int i = 0; i < 5; ++i) {
  verticesY[i] = int(random(250));
  verticesX[i] = int(random(970));
}
// Runs on initial load
void setup()
{
//init triangle
  size(970, 250);
  background(100);

  loop();
  smooth()
  


  //print
  println(verticesY);
  println(verticesX);

}

// Runs repeatedly until exit() is called.
void draw()
{
      background(100);
      fill(incC);
  	  noStroke();
      triangle(0,0, 60, 80, 200, 150);
      fill(incC2);
  	  noStroke();
      triangle(60, 80, 200, 150, 200 + sin(inc) * 500, 300);
    incC += 0.25;
    incC2 += 0.25;
    inc += 0.1;
    if (incC > 200){
        incC = 0;
    }
    if (incC2 > 200){
      incC2 = 0;
    }
    println(sin(inc) * 100 + 200);

}

