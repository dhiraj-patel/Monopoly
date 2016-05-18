class playerSelect {
  PImage singlePlayer, twoPlayer, threePlayer;
  color buttonNormal, buttonHover;
  txtButton[] playerSelectButtons;
  
  playerSelect() {
    playerSelectButtons = new txtButton[3];
    buttonNormal = color(255, 0, 0);
    buttonHover = color(205, 90, 90);
    playerSelectButtons[0] = new txtButton(width / 2 - 100, height / 3, "ONE PLAYER", 30, buttonNormal, buttonHover);
    playerSelectButtons[1] = new txtButton(width / 2 - 90, height * 2 / 3, "TWO PLAYER", 30, buttonNormal, buttonHover);
    playerSelectButtons[2] = new txtButton(width / 2 - 80, height, "THREE PLAYER", 30, buttonNormal, buttonHover);
  }
  
  void draw() {
    background(255, 255, 255);
    playerSelectButtons[0].draw();
    playerSelectButtons[1].draw();
    playerSelectButtons[2].draw();
  }
}
  