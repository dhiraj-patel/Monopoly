class Board {
  PImage board, gui;
  PFont font;
  int player;
  Player[] numPlayers;
  txtButton next;
  
  Board(int player) {
    this.player = player;
    colorMode(RGB);
    font = createFont("../Fonts/BebasNeue.otf", 24, true);
    board = loadImage("../Images/board.jpg");
    board.resize(720, 720);
    gui = loadImage("../Images/gui.png");
    gui.resize(280, 720);
    numPlayers = new Player[player];
    if (player == 2) {
      numPlayers[0] = new Player("Player 1", 1, "red");
      numPlayers[1] = new Player("Player 2", 2, "blue");
    }
    else if (player == 3) {
      numPlayers[0] = new Player("Player 1", 1, "red");
      numPlayers[1] = new Player("Player 2", 2, "blue");
      numPlayers[2] = new Player("Player 3", 3, "green");
    }
    else if (player == 4) {
      numPlayers[0] = new Player("Player 1", 1, "red");
      numPlayers[1] = new Player("Player 2", 2, "blue");
      numPlayers[2] = new Player("Player 3", 3, "green");
      numPlayers[3] = new Player("Player 4", 4, "yellow");
    }
  }
  
  void draw() {
    background(255, 255, 255);
    image(board, 0, 0);
    image(gui, 720, 0);
    for (int i = 0; i < player; i ++) {
      numPlayers[i].draw();
    }
  }
}
    
    