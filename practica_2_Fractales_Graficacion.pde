float zoom = 2.0;
float xOffset = -2.0;
float yOffset = -1.5;

void setup() {
  size(800, 800);
  noLoop();
}

void draw() {
  background(0);
  float w = (zoom * 2) / width;
  float h = (zoom * 2) / height;
  
  for (int x = 0; x < width; x += 5) {
    for (int y = 0; y < height; y += 5) {
      float a = map(x, 0, width, xOffset, xOffset + zoom);
      float b = map(y, 0, height, yOffset, yOffset + zoom);
      float ca = a;
      float cb = b;
      int n = 0;
      
      while (n < 100) {
        float aa = a * a - b * b;
        float bb = 2 * a * b;
        a = aa + ca;
        b = bb + cb;
        
        if (abs(a + b) > 16) {
          break;
        }
        
        n++;
      }
      
      float bright = map(n, 0, 100, 0, 255);
      noStroke();
      fill(bright);
      ellipse(x, y, 5, 5);
    }
  }
}

void keyPressed() {
  if (key == 'w' || key == 'W') {
    yOffset -= 0.1 * zoom;
  } else if (key == 's' || key == 'S') {
    yOffset += 0.1 * zoom;
  } else if (key == 'a' || key == 'A') {
    xOffset -= 0.1 * zoom;
  } else if (key == 'd' || key == 'D') {
    xOffset += 0.1 * zoom;
  } else if (key == '+') {
    zoom *= 1.1;
  } else if (key == '-') {
    zoom /= 1.1;
  }
  redraw();
}
