static int state; //0 Main Menu, 1 Player Select, 2 Game 
mainMenu newMainMenu;
playerSelect newPlayerSelect;
Game newGame;

void setup() {
  size(1000, 720);
  state = 0;
  newMainMenu = new mainMenu();
  newPlayerSelect = new playerSelect();
}

void draw() {
  if (state == 0) {
    newMainMenu.draw();
  }
  if (state == 1) {
    newPlayerSelect.draw();
  }
  if (state == 2) {
    newGame.draw();
  }
}

void mousePressed() {
  if (state == 0) {
    if (newMainMenu.mainMenuButtons[0].over == true) {
      state = 1;
      println("Clicked Play");
    }
    else if (newMainMenu.mainMenuButtons[1].over == true) {
      exit();
    }
  }
  if (state == 1) {
    if (newPlayerSelect.playerSelectButtons[0].over == true) {
      newGame = new Game(2);
      state = 2;
    }
    else if (newPlayerSelect.playerSelectButtons[1].over == true) {
      newGame = new Game(3);
      state = 2;
    }
    else if (newPlayerSelect.playerSelectButtons[2].over == true) {
      newGame = new Game(4);
      state = 2;
    }
  }
  if (state == 2) {
    if (newGame.newBoard.next[newGame.newBoard.currentPlayer].over) {
      newGame.newBoard.nextPressed = true;
      newGame.newBoard.next[newGame.newBoard.currentPlayer].over = false;
    }
    if (newGame.newBoard.done[newGame.newBoard.currentPlayer].over) {
      newGame.newBoard.currentTurn += 1;
      newGame.ranOnce = false;
      newGame.newBoard.nextPressed = false;
      newGame.newBoard.done[newGame.newBoard.currentPlayer].over = false;
    }
    if (newGame.newBoard.nextDouble[newGame.newBoard.currentPlayer].over) {
      newGame.ranOnce = false;
      newGame.newBoard.nextDouble[newGame.newBoard.currentPlayer].over = false;
      newGame.ranOnce2 = false;
    }
    if (newGame.newBoard.nextTriple[newGame.newBoard.currentPlayer].over) {
      newGame.ranOnce = false;
      newGame.newBoard.nextDouble[newGame.newBoard.currentPlayer].over = false;
      newGame.ranOnce2 = false;
    }
  }
}