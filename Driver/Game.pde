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
    if (!newBoard.nextPressed) {
      newDie.reset();
      newDie.draw();
      newBoard.next[newBoard.currentPlayer].draw();
    }
    else if (newBoard.nextPressed && !ranOnce) {
      newDie.roll();
      newDie.draw();
      newBoard.numPlayers[newBoard.currentPlayer].move(newDie.getTotal());
      newBoard.draw();
      ranOnce = true;
    }
    else if (newBoard.nextPressed && ranOnce) {
      newBoard.done[newBoard.currentPlayer].draw();
      newDie.draw();
    }
      
  }
}
   