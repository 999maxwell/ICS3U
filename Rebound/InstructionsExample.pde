class InstructionsExample {
  boolean firstSpike, ballSideways, left, right;
  float ballX, ballY, ballAccel;
  InstructionsExample() {
    firstSpike = false;
    ballX = 50;
    ballY = 260;
    ballAccel = 20;
  }
  //display the animation
  void display() {
    canvas();
    spikes();
    ball();
    keyboard();
  }
  //draw the canvas
  void canvas() {
    noFill();
    stroke(108, 145, 203);
    strokeWeight(3);
    rect(0, 0, 200, 300, 3);
  }
  //draw the spikes
  void spikes() {
    fill(0);
    noStroke();
    if (firstSpike) {
      triangle(0, 300, 50, 225, 100, 300);
    } else {
      pushMatrix();
      translate(100, 0);
      triangle(0, 300, 50, 225, 100, 300);
      popMatrix();
    }
  }
  //draw the ball (includes the movement)
  void ball() {
    boolean temp = false;
    fill(108, 145, 203);
    strokeWeight(3);
    stroke(67, 119, 201);
    ellipse(ballX, ballY, 80, 80);
    if (ballY >= 260) {
      ballAccel *= -1;
      firstSpike = !firstSpike;
      temp = true;
    } 
    if (!temp) {
      ballAccel += 1;
    }
    ballAccel = removeDecimals(ballAccel);
    ballY += ballAccel;
    ballY = removeDecimals(ballY);
    if (ballAccel >= 0) {
      if (firstSpike) {
        if (ballX != 150) {
          ballX += 10;
          right = true;
          left = false;
        }
      } else {
        if (ballX != 50) {
          ballX -= 10;
          left = true;
          right = false;
        }
      }
    }
  }
  //draw the keyboard keys
  void keyboard() {
    strokeWeight(3);
    stroke(108, 145, 203);
    if (right) {
      noFill();
      rect(250, 50, 50, 50);
      rect(250, 200, 50, 50);
      fill(172, 185, 247);
      rect(350, 50, 50, 50);
      rect(350, 200, 50, 50);
    } else if (left) {
      noFill();
      rect(350, 50, 50, 50);
      rect(350, 200, 50, 50);
      fill(172, 185, 247);
      rect(250, 50, 50, 50);
      rect(250, 200, 50, 50);
    } else {
      noFill();
      rect(250, 50, 50, 50);
      rect(250, 200, 50, 50);
      rect(350, 50, 50, 50);
      rect(350, 200, 50, 50);
    }
    noStroke();
    fill(108, 145, 203); 
    pushMatrix(); 
    translate(255, 75);
    rotate(radians(-90)); 
    beginShape(); 
    vertex(0, 0); 
    vertex(10, 15); 
    vertex(3, 15); 
    vertex(3, 40); 
    vertex(-3, 40); 
    vertex(-3, 15); 
    vertex(-10, 15); 
    endShape(CLOSE); 
    popMatrix();
    pushMatrix(); 
    translate(395, 75);
    rotate(radians(90)); 
    beginShape(); 
    vertex(0, 0); 
    vertex(10, 15); 
    vertex(3, 15); 
    vertex(3, 40); 
    vertex(-3, 40); 
    vertex(-3, 15); 
    vertex(-10, 15); 
    endShape(CLOSE); 
    popMatrix();
    textFont(mainFont, 30);
    textAlign(CENTER);
    text("or", 325, 150);
    textFont(boldFont, 30);
    textAlign(LEFT);
    text("A", 264, 237);
    text("D", 364, 237);
  }
}
