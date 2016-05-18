static int state; //0 Main Menu, 1 Player Select, 2 Game 
mainMenu newMainMenu;
Board newBoard;

void setup() {
  size(1000, 720);
  state = 0;
  newMainMenu = new mainMenu();
  newBoard = new Board();
}

void draw() {
  if (state == 0) {
    newMainMenu.draw();
  }
  if (state == 1) {
    background(128, 128, 128);
  }
  if (state == 2) {
    newBoard.draw();
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
}  