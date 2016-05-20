static int state; //0 Main Menu, 1 Player Select, 2 Game 
mainMenu newMainMenu;
Board newBoard;
playerSelect newPlayerSelect;
Die newDice;

void setup() {
  size(1000, 720);
  state = 1;
  newMainMenu = new mainMenu();
  newPlayerSelect = new playerSelect();
  newDice = new Die();
}

void draw() {
  if (state == 0) {
    newMainMenu.draw();
  }
  if (state == 1) {
    newPlayerSelect.draw();
  }
  if (state == 2) {
    newBoard.draw();
    newDice.draw();
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
      newBoard = new Board(2);
      state = 2;
    }
  }
}