class Ball {
  float x, y, acceleration, section;
  boolean vulnerable;
  Ball() {
    section = 0.0;
    x = section * size + (size / 2);
    y = 150.0;
    acceleration = 0;
  }
  //draw the ball
  void display() {
    fill(108, 145, 203);
    strokeWeight(3);
    stroke(67, 119, 201);
    ellipse(x, y, size - 20, size - 20);
  }
  //sideways movement of the ball
  void moveSideways() {
    fill(108, 145, 203);
    strokeWeight(3);
    stroke(67, 119, 201);
    float xTarget;
    xTarget = section * size + (size / 2);
    if (x > xTarget) {
      ellipse(x, y, size - 20, size - 20);
      x -= (x - xTarget) / 4;
    } else if (x < xTarget) {
      ellipse(x, y, size - 20, size - 20);
      x += (xTarget - x) / 4;
    }
  }
  //vertical movement of the ball
  void bounce() {
    boolean temp = false; //temp is used to make sure the ball travels the same distance up and down
    if (y >= height - ((size - 20) / 2)) {
      //firstBounce: so you don't get a point on your first bounce (which is a freebie)
      if (!firstBounce) {
        score++;
        finalScore = int(score + (5 * difficulty));
        if (finalScore > intScores.get(intScores.size() - 1)) {
          newHigh = true;
          intScores.add(finalScore);
        } else {
          newHigh = false;
        }
        Collections.sort(intScores);
      }
      acceleration *= -1; //acceleration turns negative when the ball reaches the ground, causing it to go the opposite direction at the same velocity
      temp = true;
      vulnerable = false; //vulnerable makes sure you don't die when a spike spawns under the ball after it bouncnes
      changeSpikes();
      spikes.clear();
      for (int i = 0; i < difficulty - 1; i++) {
        spikes.add(new Spike(i));
      }
      firstBounce = false;
    } else if (y <= 150) {
      speed += 0.05;
      vulnerable = true;
    }
    if (!temp) {
      acceleration += 0.6 * speed;
    }
    acceleration = removeDecimals(acceleration);
    y += acceleration;
    y = removeDecimals(y);
  }
  //method for checking collision between circle and spikes
  //if the distance between the circle center and any of the triangle vertices is less than the circle radius, the two objects are touching
  boolean trianglePointCollide(float x, float y) {
    if (dist(x, y, this.x, this.y) < (size - 20) / 2) {
      return true;
    } else {
      return false;
    }
  }
  //checking if circle and spikes are touching
  void checkCollide() {
    for (int i = 0; i < spikes.size(); i++) {
      if (!vulnerable && spikes.get(i).section == prevSafeSection) {
        if (i >= spikes.size() - 1) {
          break;
        }
        i++;
      }
      Spike s = spikes.get(i);
      float dx = s.x2 - x;
      float dy = s.y2 / 1.5 - y;
      float angle = atan2(dy, dx); //the angle of the circle in relation to the spike
      //finding closest point on a circle to the spike
      float circumX = x + cos(angle) * ((size - 20) / 2);
      float circumY = y + sin(angle) * ((size - 20) / 2);
      if (s.collide(circumX, circumY)) {   
        gameOver = true;
        break;
      } else if (trianglePointCollide(s.x1, s.y1) || trianglePointCollide(s.x2, s.y2) || trianglePointCollide(s.x3, s.y3)) {
        gameOver = true;
        break;
      } else {
        gameOver = false;
      }
    }
  }
}