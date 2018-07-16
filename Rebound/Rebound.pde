import java.util.*;
Ball ball;
InstructionsExample example;
ArrayList<Spike> spikes = new ArrayList<Spike>();
int safeSection, prevSafeSection, score, finalScore, highScore;
float size, difficulty, speed;
PFont mainFont, boldFont;
//booleans for all the buttons
boolean playing, firstBounce, gameOver, menu, instructions, playHover, difficultyChoose, okHover, instructionsHover, quitHover, menuHover, retryHover, backHover, paused, resumeHover, newHigh, upHover, downHover;
String[] scores;
ArrayList<Integer> intScores = new ArrayList<Integer>();
void settings() {
  fullScreen();
}

void setup() {
  scores = loadStrings("scores.txt");
  for (int i = 0; i < scores.length; i++) {
    intScores.add(int(scores[i]));
  }
  safeSection = 0;
  firstBounce = true;
  score = 0;
  speed = 1.0;
  difficulty = 8.0;
  size = width / difficulty;
  ball = new Ball();
  example = new InstructionsExample();
  menu = true;
  for (int i = 0; i < difficulty - 1; i++) {
    spikes.add(new Spike(i));
  }
}

void draw() {
  //game layout: more details in functions
  background(255);
  createFonts();
  if (menu) {
    menu();
    if (difficultyChoose) {
      difficultyChoose();
    }
  } else if (instructions) {
    instructions();
  } else if (playing) {  
    drawMap();
    displaySpikes();
    if (!gameOver && !paused) {
      ball.display();
      ball.checkCollide();
      ball.moveSideways();
      ball.bounce();
    } else if (paused) {
      ball.display();
      pause();
    } else {
      gameOver();
    }
  }
  drawCursor();
}
