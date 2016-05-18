class mainMenu {
  PImage mainMenuScreen;
  PFont font;
  txtButton[] mainMenuButtons = new txtButton[2];
  color buttonNormal, buttonHover;

  
  mainMenu() {
    colorMode(RGB);
    buttonNormal = color(255, 0, 0);
    buttonHover = color(205, 90, 90);
    mainMenuButtons[0] = new txtButton(width * 7 / 50, height * 1 / 4, "PLAY", 70, buttonNormal, buttonHover);
    mainMenuButtons[1] = new txtButton(width * 7 / 10, height * 1 / 4, "EXIT", 70, buttonNormal, buttonHover);
    mainMenuScreen = loadImage("../Images/mms.png");
    mainMenuScreen.resize(1000, 720);
    font = createFont("../Fonts/BebasNeue.otf", 24, true);
  }
  
  void draw() {
    background(mainMenuScreen);
    mainMenuButtons[0].draw();
    mainMenuButtons[1].draw();
  }
}