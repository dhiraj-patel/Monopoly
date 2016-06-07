class gameOver {
  PImage bg;
  PFont font;
  txtButton backToMainMenu;
  color buttonNormal, buttonHover;
  int winner;

  gameOver(int winner) {
    colorMode(RGB);
    buttonNormal = color(255, 0, 0);
    buttonHover = color(205, 90, 90);
    backToMainMenu = new txtButton(width * 2 / 3, height / 3, "MAIN MENU", 70, buttonNormal, buttonHover);
    bg = loadImage("../Images/mm1.png");
    bg.resize(1000, 720);
    font = createFont("../Fonts/BebasNeue.otf", 24, true);
    this.winner = winner;
  }
  
  void draw() {
    background(bg);
    textFont(font);
    fill(buttonNormal);
    text("Game Over!", width * 2 / 3, height / 3 - 80);
    text("Player " + winner + " wins!", width * 2 / 3, height / 3 - 55);
    backToMainMenu.draw();
  }
}