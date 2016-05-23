class Board {
  PImage board, gui;
  PFont font;
  int totalPlayers, currentPlayer, currentTurn;
  boolean nextPressed;
  txtButton[] next;
  txtButton[] done;
  Player[] numPlayers;
  
  Board(int totalPlayers) {
    this.totalPlayers = totalPlayers;
    colorMode(RGB);
    font = createFont("../Fonts/BebasNeue.otf", 24, true);
    board = loadImage("../Images/board.jpg");
    board.resize(720, 720);
    gui = loadImage("../Images/gui.png");
    gui.resize(280, 720);
    currentPlayer = 0;
    currentTurn = 0;
    nextPressed = false;
    next = new txtButton[totalPlayers];
    done = new txtButton[totalPlayers];
    numPlayers = new Player[totalPlayers];
    if (totalPlayers == 2) {
      numPlayers[0] = new Player("Player 1", 1, "red");
      numPlayers[1] = new Player("Player 2", 2, "blue");
      next[0] = new txtButton(800, 17, ">", 28, color(0, 0, 0), color(155, 155, 155));
      next[1] = new txtButton(800, 195, ">", 28, color(0, 0, 0), color(155, 155, 155));
      done[0] = new txtButton(800, 15, "DONE", 16, color(0, 0, 0), color(155, 155, 155));
      done[1] = new txtButton(800, 193, "DONE", 16, color(0, 0, 0), color(155, 155, 155));
    }
    else if (totalPlayers == 3) {
      numPlayers[0] = new Player("Player 1", 1, "red");
      numPlayers[1] = new Player("Player 2", 2, "blue");
      numPlayers[2] = new Player("Player 3", 3, "green");
      next[0] = new txtButton(800, 17, ">", 28, color(0, 0, 0), color(155, 155, 155));
      next[1] = new txtButton(800, 195, ">", 28, color(0, 0, 0), color(155, 155, 155));
      next[2] = new txtButton(800, 376, ">", 28, color(0, 0, 0), color(155, 155, 155));
      done[0] = new txtButton(800, 15, "DONE", 16, color(0, 0, 0), color(155, 155, 155));
      done[1] = new txtButton(800, 193, "DONE", 16, color(0, 0, 0), color(155, 155, 155));
      done[2] = new txtButton(800, 374, "DONE", 16, color(0, 0, 0), color(155, 155, 155));
    }
    else if (totalPlayers == 4) {
      numPlayers[0] = new Player("Player 1", 1, "red");
      numPlayers[1] = new Player("Player 2", 2, "blue");
      numPlayers[2] = new Player("Player 3", 3, "green");
      numPlayers[3] = new Player("Player 4", 4, "yellow");
      next[0] = new txtButton(800, 17, ">", 28, color(0, 0, 0), color(155, 155, 155));
      next[1] = new txtButton(800, 195, ">", 28, color(0, 0, 0), color(155, 155, 155));
      next[2] = new txtButton(800, 376, ">", 28, color(0, 0, 0), color(155, 155, 155));
      next[3] = new txtButton(800, 555, ">", 28, color(0, 0, 0), color(155, 155, 155));
      done[0] = new txtButton(800, 15, "DONE", 16, color(0, 0, 0), color(155, 155, 155));
      done[1] = new txtButton(800, 193, "DONE", 16, color(0, 0, 0), color(155, 155, 155));
      done[2] = new txtButton(800, 374, "DONE", 16, color(0, 0, 0), color(155, 155, 155));
      done[3] = new txtButton(800, 553, "DONE", 16, color(0, 0, 0), color(155, 155, 155));
    }
  }
  
  void setCurrentPlayer() {
    currentPlayer = currentTurn % totalPlayers;
  }
  
  void draw() {
    background(255, 255, 255);
    image(board, 0, 0);
    image(gui, 720, 0);
    setCurrentPlayer();
    for (int i = 0; i < totalPlayers; i ++) {
      numPlayers[i].draw();
    }
  }
}
    
    