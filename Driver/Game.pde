class Game {
  int currentTurn;
  int currentPlayer;
  int totalPlayers;
  txtButton next;
  
  Game(int totalPlayers) {
    currentTurn = 0;
    currentPlayer = 0;
    this.totalPlayers = totalPlayers;
    next = new txtButton(800, 20, ">", 8, 
  }
  
  void setCurrentPlayer() {
    if (currentTurn % totalPlayers == 0) {
      currentPlayer = totalPlayers;
    }
    else {
      currentPlayer = currentTurn % totalPlayers;
    }
  }   
  
  void draw() {
    
    if (cur
  }
}
   