class Spike {
  float section, x1, y1, x2, y2, x3, y3;
  Spike(float section) {
    if (section >= safeSection) {
      section++;
    }
    this.section = section;
    x1 = section * size + 10;
    y1 = height;
    x2 = section * size + (size / 2);
    y2 = height - (size / 1.5);
    x3 = section * size + (size - 10);
    y3 = height;
  }

  void display() {
    noStroke();
    fill(0);
    triangle(x1, y1, x2, y2, x3, y3);
  }
  //backup method for checking circle-spike collision
  boolean collide(float x, float y) {
    float area = 0.5 * ((x3 - x1) * (height - y2));//
    float area1 = getArea(x, y, x1, y1, x2, y2);
    float area2 = getArea(x, y, x1, y1, x3, y3);
    float area3 = getArea(x, y, x2, y2, x3, y3);
    if (area1 + area2 + area3 <= area) {
      return true;
    } else {
      return false;
    }
  }
  //getting area of all triangles formed by circle center and every combination of two vertices of a triangle
  float getArea(float x1, float y1, float x2, float y2, float x3, float y3) {
    float a = x2 - x1;
    float b = y2 - y1;
    float c = x3 - x1;
    float d = y3 - y1;
    return 0.5 * abs((a * d) - (b * c));
  }
}