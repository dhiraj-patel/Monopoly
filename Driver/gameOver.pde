class gameOver {
  PImage bg;
  PFont font;
  txtButton backToMainMenu;
  color buttonNormal, buttonHover;
  Player winner;

  gameOver(Player winner) {
    colorMode(RGB);
    buttonNormal = color(255, 0, 0);
    buttonHover = color(205, 90, 90);
    backToMainMenu = new txtButton(width / 2 - 65, height / 2 + 100, "MAIN MENU", 70, buttonNormal, buttonHover);
    bg = loadImage("../Images/mm2.png");
    bg.resize(1000, 720);
    font = createFont("../Fonts/BebasNeue.otf", 24, true);
    this.winner = winner;
  }
  
  void draw() {
    background(bg);
    textFont(font);
    text("Game Over!", width / 2 - 65, height / 2);
    text(winner + " wins!", width / 2 - 65, height / 2 + 50);
    backToMainMenu.draw();
  }
}