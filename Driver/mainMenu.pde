class mainMenu {
  PImage bg;
  PFont font;
  txtButton[] mainMenuButtons = new txtButton[2];
  color buttonNormal, buttonHover;

  
  mainMenu() {
    colorMode(RGB);
    buttonNormal = color(255, 0, 0);
    buttonHover = color(205, 90, 90);
    mainMenuButtons[0] = new txtButton(width / 3, height * 1 / 4 + 15, "PLAY", 70, buttonNormal, buttonHover);
    mainMenuButtons[1] = new txtButton(width * 2 / 3, height * 1 / 4 + 15, "EXIT", 70, buttonNormal, buttonHover);
    bg = loadImage("../Images/mms.png");
    bg.resize(1000, 720);
    font = createFont("../Fonts/BebasNeue.otf", 24, true);
  }
  
  void draw() {
    background(bg);
    textFont(font);
    mainMenuButtons[0].draw();
    mainMenuButtons[1].draw();
  }
}