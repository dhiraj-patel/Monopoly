class Board {
  PImage board, gui;
  PFont font;
  int player;
  Player p1, p2, p3, p4;
  
  Board(int player) {
    this.player = player;
    colorMode(RGB);
    font = createFont("../Fonts/BebasNeue.otf", 24, true);
    board = loadImage("../Images/board.jpg");
    board.resize(720, 720);
    gui = loadImage("../Images/gui.png");
    gui.resize(280, 720);
  }
  
  void draw() {
    background(255, 255, 255);
    image(board, 0, 0);
    image(gui, 720, 0);
    if (player == 2) {
    }
  }
}
    
    