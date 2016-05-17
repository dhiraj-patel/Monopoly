import java.util.*;
PImage board, mainMenuScreen;
PFont font;
static int state; // 0 Main Menu, 1 Player Select, 2 Game 
txtButton[] mainMenuButtons = new txtButton[2];
color buttonNormal, buttonHover;

void setup() {
  colorMode(RGB);
  size(1000, 720);
  state = 0;
  buttonNormal = color(255, 0, 0);
  buttonHover = color(205, 90, 90);
  mainMenuButtons[0] = new txtButton(width / 2 - 45, height * 3 / 4, "PLAY", 40, buttonNormal, buttonHover);
  mainMenuButtons[1] = new txtButton(width / 2 - 45, height * 3 / 4 + 65, "EXIT", 40, buttonNormal, buttonHover);
  mainMenuScreen = loadImage("../Images/mms.png");
  mainMenuScreen.resize(1000, 720);
  font = createFont("Courier", 20, true);
}

void draw() {
  if (state == 0) {
    background(mainMenuScreen);
    mainMenuButtons[0].draw();
    mainMenuButtons[1].draw();
  }
  if (state == 1) {
    background(128, 128, 128);
  }
  if (state == 2) {
      board = loadImage("../Images/board.jpg");
      board.resize(720, 720);
      background(128, 128, 128);
      image(board, 0, 0);
  }
    
}

void mousePressed() {
  if (state == 0) {
    if (mainMenuButtons[0].over == true) {
      state = 1;
      println("Clicked play");
    }
    else if (mainMenuButtons[1].over == true) {
      exit();
    }
  }
}  