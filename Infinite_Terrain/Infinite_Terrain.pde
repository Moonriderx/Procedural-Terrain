int cols, rows;
int scale = 20;
int w = 2000;
int h = 1600;

float[][] terrain;
float flying = 0;

void setup() {
  size(1200, 1200, P3D);

  
  cols = w / scale; // number of cols is width of the grid divided by the scale
  rows = h / scale; // same but for height
  terrain = new float[cols][rows];


  }

void draw() {
  flying -= 0.1f;
  float yoffset = flying; // creating these values for precision of the terrain. 
    for (int y = 0; y < rows; y++) {
      float xoffset = 0;
      for (int x = 0; x < cols; x++) {
     // terrain[x][y] = random(-10,10); use perlin noise instead
     terrain[x][y] = map(noise(xoffset,yoffset), 0, 1, -120, 120); // map the perlin noise between two values -100 and 100]
     xoffset += 0.2f;
     }
     yoffset += 0.2f;
  }
  
  background(0);
  stroke(255);
  noFill(); 
  
  translate(width/2, height/2+150);
  rotateX(PI/3); // its 60 degrees
  translate(-w/2, -h/2); 
  
  for (int y = 0; y < rows-1; y++) {
    beginShape(TRIANGLE_STRIP); // for every single row begin shape
    stroke(map(y,0,rows,0,255)); //adds a good fog
    for (int x = 0; x < cols; x++) {
        vertex(x*scale, y*scale, terrain[x][y]);
        vertex(x*scale, (y+1)*scale, terrain[x][y+1]);
      //rect(x*scale, y*scale, scale, scale);
    }
    endShape();
  }
}


/*
Perlin noise refers to an algorithm that is a way of getting smooth random numbers. It assures the smooth transition of each number compared to the number before. Like a graph.


if you put the xoff and yoff = 0.05 and flying -= 0.01 will be like water.
*/
