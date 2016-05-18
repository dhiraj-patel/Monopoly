class Board {
  PImage board;
  PFont font;
  
  Board() {
    colorMode(RGB);
    font = createFont("../Fonts/BebasNeue.otf", 24, true);
    board = loadImage("../Images/board.jpg");
    board.resize(720, 720);
  }
  
  void draw() {
    background(255, 255, 255);
    image(board, 0, 0);
  }
}
    
    