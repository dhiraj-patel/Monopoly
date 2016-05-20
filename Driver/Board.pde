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
    if (player == 2) {
      p1 = new Player("Player 1", 1, "red");
      p2 = new Player("Player 2", 2, "blue");
    }
    else if (player == 3) {
      p1 = new Player("Player 1", 1, "red");
      p2 = new Player("Player 2", 2, "blue");
      p3 = new Player("Player 3", 3, "green");
    }
    else if (player == 4) {
      p1 = new Player("Player 1", 1, "red");
      p2 = new Player("Player 2", 1, "red");
      p3 = new Player("Player 3", 1, "red");
      p4 = new Player("Player 4", 1, "red");
    } 
  }
  
  void draw() {
    background(255, 255, 255);
    image(board, 0, 0);
    image(gui, 720, 0);
    if (player == 2) {
      
    }
  }
}
    
    