class Game {
  int totalPlayers;
  boolean ranOnce;
  Die newDie;
  Board newBoard;
  
  Game(int totalPlayers) {
    this.totalPlayers = totalPlayers;
    newDie = new Die();
    newBoard = new Board(totalPlayers);
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
    else if (newBoard.nextPressed && newDie.isDouble()) {
      newDie.doubleCount += 1;
      if (newDie.doubleCount == 3) {
        newDie.doubleCount = 0;
        newBoard.numPlayers[newBoard.currentPlayer].goToJail();
      }
      else if (newDie.doubleCount == 1) {
        newBoard.nextDouble[newBoard.currentPlayer].draw();
        newDie.draw();
      }
      else if (newDie.doubleCount == 2) {
        newBoard.nextTriple[newBoard.currentPlayer].draw();
      }
        
    }
    //what happens after the next is pressed and continually happens
    else if (newBoard.nextPressed && ranOnce) {
      newBoard.done[newBoard.currentPlayer].draw();
      newDie.draw();
    }
      
  }
}
   