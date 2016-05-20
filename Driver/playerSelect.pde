class playerSelect {
  PFont font;
  PImage bg;
  color buttonNormal, buttonHover;
  txtButton[] playerSelectButtons;
  
  playerSelect() {
    playerSelectButtons = new txtButton[3];
    buttonNormal = color(255, 0, 0);
    buttonHover = color(205, 90, 90);
    bg = loadImage("../Images/mm.png");
    bg.resize(1000, 720);
    playerSelectButtons[0] = new txtButton(width / 2, height / 4, "TWO PLAYER", 30, buttonNormal, buttonHover);
    playerSelectButtons[1] = new txtButton(width / 2, height / 2, "THREE PLAYER", 30, buttonNormal, buttonHover);
    playerSelectButtons[2] = new txtButton(width / 2, height * 3 / 4, "FOUR PLAYER", 30, buttonNormal, buttonHover);
    font = createFont("../Fonts/BebasNeue.otf", 24, true);
  }
  
  void draw() {
    background(bg);
    textFont(font);
    playerSelectButtons[0].draw();
    playerSelectButtons[1].draw();
    playerSelectButtons[2].draw();
  }
}
  