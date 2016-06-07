class Board {
  PImage board, gui;
  PFont font;
  int totalPlayers, currentPlayer, currentTurn;
  boolean nextPressed;
  txtButton[] next;
  txtButton[] nextDouble;
  txtButton[] nextTriple;
  txtButton[] done;
  Player[] numPlayers;
  Space[] Spaces;
  txtButton[] useJFC;
  txtButton[] payOutOfJail;
  
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
    nextDouble = new txtButton[totalPlayers];
    nextTriple = new txtButton[totalPlayers];
    done = new txtButton[totalPlayers];
    numPlayers = new Player[totalPlayers];
    useJFC = new txtButton[totalPlayers];
    payOutOfJail = new txtButton[totalPlayers];
    if (totalPlayers == 2) {
      numPlayers[0] = new Player("Player 1", 1, "red");
      numPlayers[1] = new Player("Player 2", 2, "blue");
      next[0] = new txtButton(800, 17, ">", 28, color(0, 0, 0), color(155, 155, 155));
      next[1] = new txtButton(800, 195, ">", 28, color(0, 0, 0), color(155, 155, 155));
      nextDouble[0] = new txtButton(800, 17, ">>", 28, color(0, 0, 0), color(155, 155, 155));
      nextDouble[1] = new txtButton(800, 195, ">>", 28, color(0, 0, 0), color(155, 155, 155));
      nextTriple[0] = new txtButton(800, 17, ">>>", 28, color(0, 0, 0), color(155, 155, 155));
      nextTriple[1] = new txtButton(800, 195, ">>>", 28, color(0, 0, 0), color(155, 155, 155));
      done[0] = new txtButton(800, 15, "DONE", 16, color(0, 0, 0), color(155, 155, 155));
      done[1] = new txtButton(800, 193, "DONE", 16, color(0, 0, 0), color(155, 155, 155));
      useJFC[0] = new txtButton(724, 50, "Use JFC", 12, color(0, 0, 0), color(155, 155, 155));
      useJFC[1] = new txtButton(724, 230, "Use JFC", 12, color(0, 0, 0), color(155, 155, 155));
      payOutOfJail[0] = new txtButton(724, 70, "Pay 50", 12, color(0, 0, 0), color(155, 155, 155));
      payOutOfJail[1] = new txtButton(724, 250, "Pay 50", 12, color(0, 0, 0), color(155, 155, 155));
    }
    else if (totalPlayers == 3) {
      numPlayers[0] = new Player("Player 1", 1, "red");
      numPlayers[1] = new Player("Player 2", 2, "blue");
      numPlayers[2] = new Player("Player 3", 3, "green");
      next[0] = new txtButton(800, 17, ">", 28, color(0, 0, 0), color(155, 155, 155));
      next[1] = new txtButton(800, 195, ">", 28, color(0, 0, 0), color(155, 155, 155));
      next[2] = new txtButton(800, 376, ">", 28, color(0, 0, 0), color(155, 155, 155));
      nextDouble[0] = new txtButton(800, 17, ">>", 28, color(0, 0, 0), color(155, 155, 155));
      nextDouble[1] = new txtButton(800, 195, ">>", 28, color(0, 0, 0), color(155, 155, 155));
      nextDouble[2] = new txtButton(800, 376, ">>", 28, color(0, 0, 0), color(155, 155, 155));
      nextTriple[0] = new txtButton(800, 17, ">>>", 28, color(0, 0, 0), color(155, 155, 155));
      nextTriple[1] = new txtButton(800, 195, ">>>", 28, color(0, 0, 0), color(155, 155, 155));
      nextTriple[2] = new txtButton(800, 376, ">>>", 28, color(0, 0, 0), color(155, 155, 155));
      done[0] = new txtButton(800, 15, "DONE", 16, color(0, 0, 0), color(155, 155, 155));
      done[1] = new txtButton(800, 193, "DONE", 16, color(0, 0, 0), color(155, 155, 155));
      done[2] = new txtButton(800, 374, "DONE", 16, color(0, 0, 0), color(155, 155, 155));
      useJFC[0] = new txtButton(724, 50, "Use JFC", 12, color(0, 0, 0), color(155, 155, 155));
      useJFC[1] = new txtButton(724, 230, "Use JFC", 12, color(0, 0, 0), color(155, 155, 155));
      useJFC[2] = new txtButton(724, 410, "Use JFC", 12, color(0, 0, 0), color(155, 155, 155));
      payOutOfJail[0] = new txtButton(724, 70, "Pay 50", 12, color(0, 0, 0), color(155, 155, 155));
      payOutOfJail[1] = new txtButton(724, 250, "Pay 50", 12, color(0, 0, 0), color(155, 155, 155));
      payOutOfJail[2] = new txtButton(724, 430, "Pay 50", 12, color(0, 0, 0), color(155, 155, 155));
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
      nextDouble[0] = new txtButton(800, 17, ">>", 28, color(0, 0, 0), color(155, 155, 155));
      nextDouble[1] = new txtButton(800, 195, ">>", 28, color(0, 0, 0), color(155, 155, 155));
      nextDouble[2] = new txtButton(800, 376, ">>", 28, color(0, 0, 0), color(155, 155, 155));
      nextDouble[3] = new txtButton(800, 555, ">>", 28, color(0, 0, 0), color(155, 155, 155));
      nextTriple[0] = new txtButton(800, 17, ">>>", 28, color(0, 0, 0), color(155, 155, 155));
      nextTriple[1] = new txtButton(800, 195, ">>>", 28, color(0, 0, 0), color(155, 155, 155));
      nextTriple[2] = new txtButton(800, 376, ">>>", 28, color(0, 0, 0), color(155, 155, 155));
      nextTriple[3] = new txtButton(800, 555, ">>>", 28, color(0, 0, 0), color(155, 155, 155));
      done[0] = new txtButton(800, 15, "DONE", 16, color(0, 0, 0), color(155, 155, 155));
      done[1] = new txtButton(800, 193, "DONE", 16, color(0, 0, 0), color(155, 155, 155));
      done[2] = new txtButton(800, 374, "DONE", 16, color(0, 0, 0), color(155, 155, 155));
      done[3] = new txtButton(800, 553, "DONE", 16, color(0, 0, 0), color(155, 155, 155));
      useJFC[0] = new txtButton(724, 50, "Use JFC", 12, color(0, 0, 0), color(155, 155, 155));
      useJFC[1] = new txtButton(724, 230, "Use JFC", 12, color(0, 0, 0), color(155, 155, 155));
      useJFC[2] = new txtButton(724, 410, "Use JFC", 12, color(0, 0, 0), color(155, 155, 155));
      useJFC[3] = new txtButton(724, 590, "Use JFC", 12, color(0, 0, 0), color(155, 155, 155));
      payOutOfJail[0] = new txtButton(724, 70, "Pay 50", 12, color(0, 0, 0), color(155, 155, 155));
      payOutOfJail[1] = new txtButton(724, 250, "Pay 50", 12, color(0, 0, 0), color(155, 155, 155));
      payOutOfJail[2] = new txtButton(724, 430, "Pay 50", 12, color(0, 0, 0), color(155, 155, 155));
      payOutOfJail[3] = new txtButton(724, 610, "Pay 50", 12, color(0, 0, 0), color(155, 155, 155));
    }
    Spaces = new Space[40];
    for (int i = 0; i < 40; i ++) {
      Spaces[i] = new Space(i);
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
    textSize(12);
    fill(0, 0, 0);
    if (totalPlayers == 2) {
      text(("$" + numPlayers[0].money), 724, 30);
      text(("$" + numPlayers[1].money), 724, 210);
      text(("JFC: " + numPlayers[0].JFCNum), 764, 30);
      text(("JFC: " + numPlayers[1].JFCNum), 764, 210);
    }
    else if (totalPlayers == 3) {
      text(("$" + numPlayers[0].money), 724, 30);
      text(("$" + numPlayers[1].money), 724, 210);
      text(("$" + numPlayers[2].money), 724, 390);
      text(("JFC: " + numPlayers[0].JFCNum), 764, 30);
      text(("JFC: " + numPlayers[1].JFCNum), 764, 210);
      text(("JFC: " + numPlayers[2].JFCNum), 764, 390);
    }
    else if (totalPlayers == 4) {
      text(("$" + numPlayers[0].money), 724, 30);
      text(("$" + numPlayers[1].money), 724, 210);
      text(("$" + numPlayers[2].money), 724, 390);
      text(("$" + numPlayers[3].money), 724, 570);
      text(("JFC: " + numPlayers[0].JFCNum), 764, 30);
      text(("JFC: " + numPlayers[1].JFCNum), 764, 210);
      text(("JFC: " + numPlayers[2].JFCNum), 764, 390);
      text(("JFC: " + numPlayers[3].JFCNum), 764, 570);
    } 
  }
}
    
    