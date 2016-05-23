class Game {
  int totalPlayers;
  boolean ranOnce, ranOnce2;
  Die newDie;
  Board newBoard;
  
  Game(int totalPlayers) {
    this.totalPlayers = totalPlayers;
    newDie = new Die();
    newBoard = new Board(totalPlayers);
    ranOnce = false;
    ranOnce = false;
  }

  void draw() {
    newBoard.draw();
    //if the next button wasn't pressed
    if (!newBoard.nextPressed) {
      newDie.reset();
      newDie.draw();
      newBoard.next[newBoard.currentPlayer].draw();
    }
    //action that happens once the next is pressed
    else if (newBoard.nextPressed && !ranOnce) {
      newDie.roll();
      newDie.draw();
      newBoard.numPlayers[newBoard.currentPlayer].move(newDie.getTotal());
      newBoard.draw();
      ranOnce = true;
    }
    //what happens after the next is pressed and continually happens
    else if (newBoard.nextPressed && ranOnce) {
      if (newDie.isDouble()) {
        if (!ranOnce2) {
          newDie.doubleCount += 1;
          ranOnce2 = true;
        }
        if (newDie.doubleCount == 1) {
          newBoard.nextDouble[newBoard.currentPlayer].draw();
          newDie.draw();
        }
        else if (newDie.doubleCount == 2) {
          newBoard.nextTriple[newBoard.currentPlayer].draw();
          newDie.draw();
        }
        else if (newDie.doubleCount == 3) {
          newDie.doubleCount = 0;
          newBoard.numPlayers[newBoard.currentPlayer].goToJail();
        }
      }
      else {   
        newBoard.done[newBoard.currentPlayer].draw();
        newDie.doubleCount = 0;
        newDie.draw();
      }
    }
      
  }
}
   