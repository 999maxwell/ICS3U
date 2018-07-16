//the main menu
void menu() { 
  textAlign(CENTER);
  textFont(boldFont, 100);
  fill(108, 145, 203);
  text("Rebound!", width / 2, height / 6);
  if (!difficultyChoose) {
    if (mouseX <= width / 2 + 210 && mouseX >= width / 2 - 210 && mouseY <= height / 2 && mouseY >= height / 2 - 60) {
      playHover = true;
      textFont(boldFont, 80);
    } else {
      playHover = false;
      textFont(boldFont, 70);
    }
  }
  if (!difficultyChoose) {
    text("Start game!", width / 2, height / 2);
    if (mouseX <= width / 2 + 210 && mouseX >= width / 2 - 210 && mouseY <= height / 2 + 100 && mouseY >= height / 2 + 60) {
      instructionsHover = true;
      textFont(boldFont, 60);
    } else {
      instructionsHover = false;
      textFont(boldFont, 50);
    }
  }
  text("Instructions", width / 2, height / 2 + 100);
  if (!difficultyChoose) {
    if (mouseX <= width / 2 + 50 && mouseX >= width / 2 - 50 && mouseY <= height / 2 + 200 && mouseY >= height / 2 + 160) {
      quitHover = true;
      textFont(boldFont, 60);
    } else {
      quitHover = false;
      textFont(boldFont, 50);
    }
  }
  text("Quit", width / 2, height / 2 + 200);
}
//choosing difficulty
void difficultyChoose() {
  rectMode(CORNER);
  fill(0, 0, 0, 150);
  rect(0, 0, width, height);
  rectMode(CENTER);
  fill(255);
  strokeWeight(3);
  stroke(108, 145, 203);
  rect(width / 2, height / 2, width / 2, height / 8 * 3, 8);
  textAlign(CENTER);
  fill(108, 145, 203);
  textFont(boldFont, 70);
  text("Choose difficulty", width / 2, height / 2 - 80); 
  //down arrow
  if (mouseX <= width / 2 - 80 && mouseX >= width / 2 - 120 && mouseY <= height / 2 + 30 && mouseY >= height / 2 - 20) {
    pushMatrix(); 
    translate(width / 2 - 100, height / 2 + 30);
    scale(1.2);
    rotate(radians(180)); 
    beginShape(); 
    vertex(0, 0); 
    vertex(20, 30); 
    vertex(7, 30); 
    vertex(7, 50); 
    vertex(-7, 50); 
    vertex(-7, 30); 
    vertex(-20, 30); 
    endShape(CLOSE); 
    popMatrix();
    downHover = true;
  } else {
    pushMatrix(); 
    translate(width / 2 - 100, height / 2 + 30);
    rotate(radians(180)); 
    beginShape(); 
    vertex(0, 0); 
    vertex(20, 30); 
    vertex(7, 30); 
    vertex(7, 50); 
    vertex(-7, 50); 
    vertex(-7, 30); 
    vertex(-20, 30); 
    endShape(CLOSE); 
    popMatrix();
    downHover = false;
  }
  //up arrow
  if (mouseX <= width / 2 + 120 && mouseX >= width / 2 + 80 && mouseY <= height / 2 + 30 && mouseY >= height / 2 - 20) {
    pushMatrix(); 
    translate(width / 2 + 100, height / 2 - 20);
    scale(1.2);
    beginShape(); 
    vertex(0, 0); 
    vertex(20, 30); 
    vertex(7, 30); 
    vertex(7, 50); 
    vertex(-7, 50); 
    vertex(-7, 30); 
    vertex(-20, 30); 
    endShape(CLOSE); 
    popMatrix();
    upHover = true;
  } else {
    pushMatrix(); 
    translate(width / 2 + 100, height / 2 - 20);
    beginShape(); 
    vertex(0, 0); 
    vertex(20, 30); 
    vertex(7, 30); 
    vertex(7, 50); 
    vertex(-7, 50); 
    vertex(-7, 30); 
    vertex(-20, 30); 
    endShape(CLOSE); 
    popMatrix();
    upHover = false;
  }
  //back arrow
  if (mouseX >= width / 2 - 320 && mouseX <= width / 2 - 250 && mouseY >= height / 2 + 85 && mouseY <= height / 2 + 125) {
    pushMatrix();
    translate(width / 2 - 320, height / 2 + 105);
    scale(1.2);
    rotate(radians(-90));
    beginShape(); 
    vertex(0, 0); 
    vertex(20, 30); 
    vertex(7, 30); 
    vertex(7, 70); 
    vertex(-7, 70); 
    vertex(-7, 30); 
    vertex(-20, 30); 
    endShape(CLOSE); 
    popMatrix();
    backHover = true;
  } else {
    pushMatrix();
    translate(width / 2 - 320, height / 2 + 105);
    rotate(radians(-90));
    beginShape(); 
    vertex(0, 0); 
    vertex(20, 30); 
    vertex(7, 30); 
    vertex(7, 70); 
    vertex(-7, 70); 
    vertex(-7, 30); 
    vertex(-20, 30); 
    endShape(CLOSE); 
    popMatrix();
    backHover = false;
  }
  if (mouseX <= width / 2 + 50 && mouseX >= width / 2 - 50 && mouseY <= height / 2 + 110 && mouseY >= height / 2 + 70) {
    okHover = true;
    textFont(boldFont, 60);
  } else {
    okHover = false;
    textFont(boldFont, 50);
  }
  text("OK!", width / 2, height / 2 + 110);
  textFont(boldFont, 50);
  text(int(difficulty), width / 2, height / 2 + 25);
}
//instructions
void instructions() {
  textAlign(CENTER);
  textFont(boldFont, 100);
  fill(108, 145, 203);
  text("Instructions", width / 2, height / 6);
  pushMatrix();
  translate(width / 2 + 200, height / 6 + 50);
  rectMode(CORNER);
  example.display();
  popMatrix();
  textFont(mainFont, 40);
  text("Use the left and right arrow keys or the A\nand D keys to move the ball to an area\nwith no spikes. The game ends when you\nmess up and land on a spike! Press\nEscape to pause anytime.\n\nTip: Use the arrow keys and the letter\nkeys at the same time to move faster!", 50, height / 6 + 90);
  //back arrow
  if (mouseX >= 30 && mouseX <= 100 && mouseY >= 30 && mouseY <= 70) {
    pushMatrix();
    translate(30, 50);
    scale(1.2);
    rotate(radians(-90));
    beginShape(); 
    vertex(0, 0); 
    vertex(20, 30); 
    vertex(7, 30); 
    vertex(7, 70); 
    vertex(-7, 70); 
    vertex(-7, 30); 
    vertex(-20, 30); 
    endShape(CLOSE); 
    popMatrix();
    backHover = true;
  } else {
    pushMatrix();
    translate(30, 50);
    rotate(radians(-90));
    beginShape(); 
    vertex(0, 0); 
    vertex(20, 30); 
    vertex(7, 30); 
    vertex(7, 70); 
    vertex(-7, 70); 
    vertex(-7, 30); 
    vertex(-20, 30); 
    endShape(CLOSE); 
    popMatrix();
    backHover = false;
  }
  textAlign(LEFT);
  textFont(mainFont, 20);
  text("Visuals may be buggy if not using a 16:9 display", 30, height - 30);
  textAlign(RIGHT);
  text("Made by Maxwell Jiang, 2018", width - 30, height - 30);
}
//draw the custom cursor
void drawCursor() { //https://stackoverflow.com/questions/2970928/mouse-coordinates-and-rotation
  float x = mouseX * cos(radians(30)) - mouseY * sin(radians(30)); 
  float y = mouseX * sin(radians(30)) + mouseY * cos(radians(30)); 
  noCursor(); 
  if (!(playing && !gameOver && !paused)) {
    fill(108, 145, 203); 
    stroke(52, 58, 160); 
    strokeWeight(3); 
    pushMatrix(); 
    rotate(radians(-30)); 
    beginShape(); 
    vertex(x, y); 
    vertex(x + 20, y + 30); 
    vertex(x + 7, y + 30); 
    vertex(x + 7, y + 50); 
    vertex(x - 7, y + 50); 
    vertex(x - 7, y + 30); 
    vertex(x - 20, y + 30); 
    endShape(CLOSE); 
    popMatrix();
  }
}
//draw the map when playing
void drawMap() {
  size = width / difficulty;
  for (int i = 0; i <= difficulty; i++) {
    if (ball.section == i || ball.section == i - 1) {
      stroke(108, 145, 203);
    } else {
      stroke(52, 58, 160);
    }
    strokeWeight(8); 
    line(i * size, height, i * size, height - 20);
  }
  if (!gameOver) {  
    fill(108, 145, 203); 
    textAlign(RIGHT); 
    textFont(boldFont, 30); 
    text("Score: " + score + " + " + (int(5 * difficulty)), width - 50, 50);
    text("Highscore: " + intScores.get(intScores.size() - 1), width - 50, 90);
  }
}
//change spike positions
void changeSpikes() {
  prevSafeSection = safeSection; 
  safeSection = int(random(0, difficulty));
}
//display the spikes
void displaySpikes() {
  for (Spike s : spikes) {
    s.display();
  }
}

void keyPressed() {
  if (key == 'a' || key == 'A' || keyCode == LEFT) {
    if (playing) {
      if (ball.section > 0) {
        ball.section--;
      }
    }
  } else if (key == 'd' || key == 'D' || keyCode == RIGHT) {
    if (playing) {
      if (ball.section < difficulty - 1) {
        ball.section++;
      }
    }
  } else if (keyCode == 27) { //overriding escape key
    key = 0;
    if (playing && !gameOver) {
      paused = true;
    }
  }
}
//pause screen
void pause() {
  rectMode(CENTER);
  fill(255);
  strokeWeight(3);
  stroke(108, 145, 203);
  rect(width / 2, height / 2 - 60, width / 3, height / 8 * 6, 8);
  textAlign(CENTER);
  fill(108, 145, 203);
  textFont(boldFont, 100); 
  text("Paused", width / 2, height / 6);
  if (mouseX <= width / 2 + 130 && mouseX >= width / 2 - 130 && mouseY <= height / 2 && mouseY >= height / 2 - 60) {
    resumeHover = true;
    textFont(boldFont, 80);
  } else {
    resumeHover = false;
    textFont(boldFont, 70);
  }
  text("Resume", width / 2, height / 2); 
  if (mouseX <= width / 2 + 95 && mouseX >= width / 2 - 95 && mouseY <= height / 2 + 100 && mouseY >= height / 2 + 60) {
    menuHover = true;
    textFont(boldFont, 60);
  } else {
    menuHover = false;
    textFont(boldFont, 50);
  }
  text("Menu", width / 2, height / 2 + 100);
  if (mouseX <= width / 2 + 50 && mouseX >= width / 2 - 50 && mouseY <= height / 2 + 200 && mouseY >= height / 2 + 160) {
    quitHover = true;
    textFont(boldFont, 60);
  } else {
    quitHover = false;
    textFont(boldFont, 50);
  }
  text("Quit", width / 2, height / 2 + 200);
}
//create the fonts
void createFonts() {
  mainFont = createFont("UD Digi Kyokasho NP-R", 1); 
  boldFont = createFont("UD Digi Kyokasho NP-B", 1);
}
//reset variables when starting a new game (ball back to the top, score back to zero, etc)
void variablesReset() {
  ball.section = 0.0; 
  ball.x = ball.section * size + (size / 2); 
  ball.y = 150.0; 
  ball.acceleration = 0; 
  safeSection = 0; 
  prevSafeSection = 0; 
  spikes.clear(); 
  score = 0; 
  firstBounce = true; 
  speed = 1.0;
  size = width / difficulty;
  for (int i = 0; i < difficulty - 1; i++) {
    spikes.add(new Spike(i));
  }
}
//game over screen
void gameOver() {
  fill(108, 145, 203); 
  textAlign(CENTER); 
  textFont(boldFont, 100); 
  text("GAME OVER", width / 2, height / 6); 
  textFont(boldFont, 40); 
  text("Score: " + finalScore, width / 2, height / 6 + 50); 
  textFont(mainFont, 30); 
  if (newHigh) {
    text("New high score!", width / 2, height / 6 + 85);
  } else {
    text("Highscore: " + intScores.get(intScores.size() - 1), width / 2, height / 6 + 85);
  }
  if (mouseX <= width / 2 + 210 && mouseX >= width / 2 - 210 && mouseY <= height / 2 && mouseY >= height / 2 - 60) {
    retryHover = true;
    textFont(boldFont, 80);
  } else {
    retryHover = false;
    textFont(boldFont, 70);
  }
  text("Play again?", width / 2, height / 2); 
  if (mouseX <= width / 2 + 95 && mouseX >= width / 2 - 95 && mouseY <= height / 2 + 100 && mouseY >= height / 2 + 60) {
    menuHover = true;
    textFont(boldFont, 60);
  } else {
    menuHover = false;
    textFont(boldFont, 50);
  }
  text("Menu", width / 2, height / 2 + 100);
  if (mouseX <= width / 2 + 50 && mouseX >= width / 2 - 50 && mouseY <= height / 2 + 200 && mouseY >= height / 2 + 160) {
    quitHover = true;
    textFont(boldFont, 60);
  } else {
    quitHover = false;
    textFont(boldFont, 50);
  }
  text("Quit", width / 2, height / 2 + 200);
}

void mouseClicked() {
  if (playHover) {
    playHover = false;
    difficultyChoose = true;
  } else if (okHover) {
    okHover = false;
    difficultyChoose = false;
    menu = false; 
    gameOver = false;
    variablesReset();
    playing = true;
  } else if (downHover) {
    if (difficulty > 8) {
      difficulty--;
    }
  } else if (upHover) {
    if (difficulty < 20) {
      difficulty++;
    }
  } else if (instructionsHover) {
    instructionsHover = false;
    menu = false; 
    instructions = true;
  } else if (quitHover) {
    quitHover = false;
    ArrayList<String> newScores= new ArrayList<String>();
    for (int i = 0; i < intScores.size(); i++) {
      newScores.add(str(intScores.get(i)));
    }
    String[] stringNewScores = newScores.toArray(new String[newScores.size()]);
    saveStrings("data/scores.txt", stringNewScores);
    exit();
  } else if (menuHover) {
    menuHover = false;
    playing = false;
    paused = false;
    gameOver = false;  
    menu = true;
  } else if (retryHover) {
    retryHover = false;
    variablesReset(); 
    gameOver = false;
  } else if (backHover) {
    backHover = false;
    instructions = false;
    difficultyChoose = false;
    menu = true;
  } else if (resumeHover) {
    resumeHover = false;
    paused = false;
  } else {
    playHover = false;
    instructionsHover = false;
    quitHover = false;
    menuHover = false;
    retryHover = false;
  }
}

float removeDecimals(float number) { //Processing adds extra random digits for some reason; this function removes them
  return (round(number * 100.0)) / 100.0;
}