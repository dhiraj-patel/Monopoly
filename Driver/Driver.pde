static int state; //0 Main Menu, 1 Player Select, 2 Game 
mainMenu newMainMenu;
playerSelect newPlayerSelect;
Game newGame;
gameOver newGameOver;

void setup() {
  size(1000, 720);
  state = 1;
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
    if (newGame.numOfActivePlayers == 1) {
      newGameOver = new gameOver(newGame.findWinner());
      state = 3;
    }
  }
  if (state == 3) {
    newGameOver.draw();
  }
}

void mousePressed() {
  if (state == 0) {
    if (newMainMenu.mainMenuButtons[0].over == true) {
      state = 1;
      newMainMenu.mainMenuButtons[0].over = false;
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
      newPlayerSelect.playerSelectButtons[0].over = false;
    }
    else if (newPlayerSelect.playerSelectButtons[1].over == true) {
      newGame = new Game(3);
      state = 2;
      newPlayerSelect.playerSelectButtons[1].over = false;
    }
    else if (newPlayerSelect.playerSelectButtons[2].over == true) {
      newGame = new Game(4);
      state = 2;
      newPlayerSelect.playerSelectButtons[2].over = false;
    }
  }
  if (state == 2) {
    if (newGame.newBoard.next[newGame.newBoard.currentPlayer].over) {
      newGame.newBoard.nextPressed = true;
      newGame.newBoard.next[newGame.newBoard.currentPlayer].over = false;
    }
    if (newGame.newBoard.done[newGame.newBoard.currentPlayer].over) {
      if (newGame.newBoard.numPlayers[newGame.newBoard.currentPlayer].inJail) {
        newGame.newBoard.numPlayers[newGame.newBoard.currentPlayer].numInJail ++;
      }
      newGame.newBoard.currentTurn ++;
      newGame.newBoard.setCurrentPlayer();
      newGame.findNextPlayer();
      newGame.ranOnce = false;
      newGame.ranOnce2 = false;
      newGame.newBoard.nextPressed = false;
      newGame.justGotIntoOrOutOfJail = false;
      newGame.newDie.doubleCount = 0;
      newGame.newBoard.done[newGame.newBoard.currentPlayer].over = false;
    }
    if (newGame.newBoard.nextDouble[newGame.newBoard.currentPlayer].over) {
      newGame.ranOnce = false;
      newGame.newBoard.nextDouble[newGame.newBoard.currentPlayer].over = false;
      newGame.ranOnce2 = false;
    }
    if (newGame.newBoard.nextTriple[newGame.newBoard.currentPlayer].over) {
      newGame.ranOnce = false;
      newGame.newBoard.nextTriple[newGame.newBoard.currentPlayer].over = false;
      newGame.ranOnce2 = false;
    }
    if (newGame.newBoard.payOutOfJail[newGame.newBoard.currentPlayer].over) {
      newGame.newBoard.numPlayers[newGame.newBoard.currentPlayer].money -= 50;
      newGame.newBoard.numPlayers[newGame.newBoard.currentPlayer].inJail = false;
      newGame.newBoard.numPlayers[newGame.newBoard.currentPlayer].numInJail = -1;
      newGame.newBoard.payOutOfJail[newGame.newBoard.currentPlayer].over = false;
    }
    if (newGame.newBoard.useJFC[newGame.newBoard.currentPlayer].over) {
      newGame.newBoard.numPlayers[newGame.newBoard.currentPlayer].JFCNum -= 1;
      newGame.newBoard.numPlayers[newGame.newBoard.currentPlayer].inJail = false;
      newGame.newBoard.numPlayers[newGame.newBoard.currentPlayer].numInJail = -1;
      newGame.newBoard.useJFC[newGame.newBoard.currentPlayer].over = false;
    }
  }
  if (state == 3) {
    if (newGameOver.backToMainMenu.over) {
      state = 0;
      newGameOver.backToMainMenu.over = false;
    }
  }
}