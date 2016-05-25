class Game {
  int totalPlayers;
  boolean ranOnce, ranOnce2;
  Die newDie;
  Board newBoard;
  Chance newChance;
  Chest newChest;
  
  Game(int totalPlayers) {
    this.totalPlayers = totalPlayers;
    newDie = new Die();
    newBoard = new Board(totalPlayers);
    newChance = new Chance();
    newChest = new Chest();
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
      // drawing Chance cards
      if (newBoard.numPlayers[newBoard.currentPlayer].location == 7 || newBoard.numPlayers[newBoard.currentPlayer].location == 22 || newBoard.numPlayers[newBoard.currentPlayer].location == 36) {
        newChance.getChanceCard(newBoard.numPlayers[newBoard.currentPlayer]);
        //exceptions for interactions with other players
        if (newChance.action.equals("You have been elected chairman of the board – pay each player $50")) {
          for (int i = 0; i < newBoard.totalPlayers; i ++) {
            if (!newBoard.numPlayers[i].equals(newBoard.numPlayers[newBoard.currentPlayer])) {
              newBoard.numPlayers[i].money += 50;
              newBoard.numPlayers[newBoard.currentPlayer].money -= 50;
            }
          }
        }
        else if (newChance.action.equals("Advance token to nearest Utility. If unowned, you may buy it from the Bank. If owned, throw dice and pay owner a total ten times the amount thrown.")) {
          if (newBoard.Spaces[newBoard.numPlayers[newBoard.currentPlayer].location].purchased) {
            newDie.roll();
            newBoard.numPlayers[newBoard.currentPlayer].money -= newDie.getTotal() * 10;
            newBoard.Spaces[newBoard.numPlayers[newBoard.currentPlayer].location].owner.money += newDie.getTotal() * 10;
          }
        }
        else if (newChance.action.equals("Advance token to the nearest Railroad and pay owner twice the rental to which he/she is otherwise entitled. If Railroad is unowned, you may buy it from the Bank.")) {
          if (newBoard.Spaces[newBoard.numPlayers[newBoard.currentPlayer].location].purchased) {
            newBoard.numPlayers[newBoard.currentPlayer].money -= newBoard.Spaces[newBoard.numPlayers[newBoard.currentPlayer].location].rentPrice * 2;
            newBoard.Spaces[newBoard.numPlayers[newBoard.currentPlayer].location].owner.money += newBoard.Spaces[newBoard.numPlayers[newBoard.currentPlayer].location].rentPrice * 2;
          }
        }
        else if (newChance.action.equals("Go back 3 spaces")) {
          if (newBoard.numPlayers[newBoard.currentPlayer].location == 4) {
            newBoard.numPlayers[newBoard.currentPlayer].money -= 200;
          }
          else if (newBoard.numPlayers[newBoard.currentPlayer].location == 19) {
          }
          else if (newBoard.numPlayers[newBoard.currentPlayer].location == 33) {
            newChest.getChestCard();
          }
        }
        
      }
      else if (newBoard.numPlayers[newBoard.currentPlayer].location == 4) {
        newBoard.numPlayers[newBoard.currentPlayer].money -= 200;
      }
      else if (newBoard.numPlayers[newBoard.currentPlayer].location == 38) {
        newBoard.numPlayers[newBoard.currentPlayer].money -= 100;
      }
        
      
      ranOnce = true;
    }
    //what happens after the next is pressed and continually happens
    else if (newBoard.nextPressed && ranOnce) {
      if (newDie.isDouble() && !newBoard.numPlayers[newBoard.currentPlayer].inJail) {
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
          newBoard.numPlayers[newBoard.currentPlayer].goToJail();
          newDie.draw();
          newBoard.done[newBoard.currentPlayer].draw();
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
   