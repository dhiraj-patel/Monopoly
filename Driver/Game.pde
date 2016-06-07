class Game {
  int totalPlayers, numberOfUtilities, numOfActivePlayers;
  boolean ranOnce, ranOnce2, drewChanceCard, justGotIntoOrOutOfJail;
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
    ranOnce2 = false;
    numberOfUtilities = 0;
    drewChanceCard = false;
    justGotIntoOrOutOfJail = false;
    numOfActivePlayers = totalPlayers;
  }
  
  void checkEvent() {
    if (!drewChanceCard && !newBoard.numPlayers[newBoard.currentPlayer].isBankrupt) {
      newDie.roll();
      if (!newBoard.numPlayers[newBoard.currentPlayer].inJail && !(newDie.doubleCount == 2 && newDie.isDouble())) {
        newBoard.numPlayers[newBoard.currentPlayer].move(newDie.getTotal());
      }
    }
    newBoard.draw();
    newDie.draw();
    if (!(newDie.doubleCount == 2 && newDie.isDouble()) && !newBoard.numPlayers[newBoard.currentPlayer].isBankrupt) {
      if (newBoard.numPlayers[newBoard.currentPlayer].location == 2 || newBoard.numPlayers[newBoard.currentPlayer].location == 17 || newBoard.numPlayers[newBoard.currentPlayer].location == 33) {
        newChest.getChestCard(newBoard.numPlayers[newBoard.currentPlayer]);
        if (newChest.action.equals("IT IS YOUR BIRTHDAY. COLLECT $10 FROM EVERY PLAYER.")) {
          for (int i = 0; i < newBoard.totalPlayers; i ++) {
            if (!newBoard.numPlayers[i].equals(newBoard.numPlayers[newBoard.currentPlayer])) {
              newBoard.numPlayers[i].money -= 10;
              newBoard.numPlayers[newBoard.currentPlayer].money += 10;
            }
          }
        }
        else if (newChest.action.equals("GO TO JAIL. GO DIRECTLY TO JAIL, DO NOT PASS \"GO\", DO NOT COLLECT $200.")) {
          justGotIntoOrOutOfJail = true;
        }
      } 
      else if (newBoard.numPlayers[newBoard.currentPlayer].location == 7 || newBoard.numPlayers[newBoard.currentPlayer].location == 22 || newBoard.numPlayers[newBoard.currentPlayer].location == 36) {
        newChance.getChanceCard(newBoard.numPlayers[newBoard.currentPlayer]);
        if (newChance.action.equals("YOU HAVE BEEN ELECTED CHAIRMAN OF THE BOARD. PAY EACH PLAYER $50.")) {
          for (int i = 0; i < newBoard.totalPlayers; i ++) {
            if (!newBoard.numPlayers[i].equals(newBoard.numPlayers[newBoard.currentPlayer])) {
              newBoard.numPlayers[i].money += 50;
              newBoard.numPlayers[newBoard.currentPlayer].money -= 50;
            }
          }
        } 
        else if (newChance.action.equals("ADVANCE TO THE NEAREST UTILITY. If UNOWNED, you may buy it from the Bank. If OWNED, throw dice and pay owner a total ten times amount thrown.")) {
          if (newBoard.Spaces[newBoard.numPlayers[newBoard.currentPlayer].location].purchased) {
            newDie.roll();
            newBoard.numPlayers[newBoard.currentPlayer].money -= newDie.getTotal() * 10;
            newBoard.Spaces[newBoard.numPlayers[newBoard.currentPlayer].location].owner.money += newDie.getTotal() * 10;
          }
          else {
            drewChanceCard = true;
            checkEvent();
            drewChanceCard = false;
          }
        } 
        else if (newChance.action.equals("ADVANCE TO THE NEAREST RAILROAD. If UNOWNED, you may buy it from the Bank. If OWNED, pay owner twice the rental to which they are otherwise entitled.")) {
          if (newBoard.Spaces[newBoard.numPlayers[newBoard.currentPlayer].location].purchased) {
            newBoard.Spaces[newBoard.numPlayers[newBoard.currentPlayer].location].payOwner();
            newBoard.Spaces[newBoard.numPlayers[newBoard.currentPlayer].location].payOwner();
          }
          else {
            drewChanceCard = true;
            checkEvent();
            drewChanceCard = false;
          }
        } 
        else if (newChance.action.equals("GO BACK THREE SPACES.")) {
          drewChanceCard = true;
          checkEvent();
          drewChanceCard = false;
        }
        else if (newChance.action.equals("GO TO JAIL. GO DIRECTLY TO JAIL, DO NOT PASS \"GO\", DO NOT COLLECT $200.")) {
          justGotIntoOrOutOfJail = true;
        }
        else if (newChance.action.equals("ADVANCE TO ILLINOIS AVENUE. IF YOU PASS \"GO\" COLLECT $200.") || newChance.action.equals("ADVANCE TO ST. CHARLES PLACE. IF YOU PASS \"GO\" COLLECT $200.") || newChance.action.equals("TAKE A TRIP TO READING RAILROAD. IF YOU PASS \"GO\" COLLECT $200.") || newChance.action.equals("ADVANCE TO BOARDWALK.")) {
          drewChanceCard = true;
          checkEvent();
          drewChanceCard = false;
        }
      }
      else if (newBoard.numPlayers[newBoard.currentPlayer].location == 30) {
        newBoard.numPlayers[newBoard.currentPlayer].location = 10;
        newBoard.numPlayers[newBoard.currentPlayer].inJail = true;
      }
      else if (newBoard.numPlayers[newBoard.currentPlayer].location == 4) {
        newBoard.numPlayers[newBoard.currentPlayer].money -= 200;
      } 
      else if (newBoard.numPlayers[newBoard.currentPlayer].location == 38) {
        newBoard.numPlayers[newBoard.currentPlayer].money -= 100;
      } 
      else if (newBoard.Spaces[newBoard.numPlayers[newBoard.currentPlayer].location].buyable) {
        newBoard.Spaces[newBoard.numPlayers[newBoard.currentPlayer].location].setCurrent(newBoard.numPlayers[newBoard.currentPlayer]);
        newBoard.Spaces[newBoard.numPlayers[newBoard.currentPlayer].location].display(); // accounts for if it's purchased
        if (newBoard.Spaces[newBoard.numPlayers[newBoard.currentPlayer].location].isUtility && newBoard.Spaces[newBoard.numPlayers[newBoard.currentPlayer].location].purchased && newBoard.Spaces[newBoard.numPlayers[newBoard.currentPlayer].location].owner != newBoard.Spaces[newBoard.numPlayers[newBoard.currentPlayer].location].current) {
          numberOfUtilities = 0;
          for (Space s: newBoard.Spaces[newBoard.numPlayers[newBoard.currentPlayer].location].owner.properties) {
            if (s.isUtility) {
              numberOfUtilities ++;
            }
          }
          if (numberOfUtilities == 1) {
            newDie.roll();
            newBoard.numPlayers[newBoard.currentPlayer].money -= newDie.getTotal() * 4;
            newBoard.Spaces[newBoard.numPlayers[newBoard.currentPlayer].location].owner.money += newDie.getTotal() * 4;
          }
          else if (numberOfUtilities == 2) {
            newDie.roll();
            newBoard.numPlayers[newBoard.currentPlayer].money -= newDie.getTotal() * 10;
            newBoard.Spaces[newBoard.numPlayers[newBoard.currentPlayer].location].owner.money += newDie.getTotal() * 10;
          }
        }
      }
      newDie.draw();
      newBoard.draw();
    }
    if (newBoard.numPlayers[newBoard.currentPlayer].money <= 0) {
      newBoard.numPlayers[newBoard.currentPlayer].isBankrupt = true;
      for (Space s:newBoard.numPlayers[newBoard.currentPlayer].properties) {
        s.purchased = false;
      }
      while (!newBoard.numPlayers[newBoard.currentPlayer].properties.isEmpty()) {
        newBoard.numPlayers[newBoard.currentPlayer].properties.remove(0);
      }
      numOfActivePlayers --;
      ranOnce = false;
      ranOnce2 = false;
      newBoard.nextPressed = false;
      justGotIntoOrOutOfJail = false;
      newDie.doubleCount = 0;
    } 
  }
  
  void findNextPlayer() {
    while (newBoard.numPlayers[newBoard.currentPlayer].isBankrupt) {
      newBoard.currentTurn ++;
      newBoard.setCurrentPlayer();
    }
  }

  void draw() {
    findNextPlayer();
    newBoard.draw();
    //if the next button wasn't pressed
    if (!newBoard.nextPressed) {
      newDie.reset();
      newDie.draw();
      if (newBoard.numPlayers[newBoard.currentPlayer].numInJail <= 3) {
        newBoard.next[newBoard.currentPlayer].draw();
      }
      if (newBoard.numPlayers[newBoard.currentPlayer].inJail) {
        if (newBoard.numPlayers[newBoard.currentPlayer].JFCNum > 0) {
          newBoard.useJFC[newBoard.currentPlayer].draw();
        }
        if (newBoard.numPlayers[newBoard.currentPlayer].money > 50) {
          newBoard.payOutOfJail[newBoard.currentPlayer].draw();
        }
      } 
    }
    //what happens once after the next is pressed
    else if (newBoard.nextPressed && !ranOnce) {
      checkEvent();
      ranOnce = true;
    }
    //what happens after the next is pressed and continually happens
    else if (newBoard.nextPressed && ranOnce) {
      if (newDie.isDouble() && !justGotIntoOrOutOfJail && !newBoard.Spaces[newBoard.numPlayers[newBoard.currentPlayer].location].displayIsOn) {
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
          justGotIntoOrOutOfJail = true;
          if (!newBoard.numPlayers[newBoard.currentPlayer].inJail) {
            newBoard.numPlayers[newBoard.currentPlayer].goToJail();
          }
          else {
            newBoard.numPlayers[newBoard.currentPlayer].inJail = false;
            newBoard.numPlayers[newBoard.currentPlayer].numInJail = -1;
          }
          newDie.draw();
        }
      }
      
      else if (!newBoard.Spaces[newBoard.numPlayers[newBoard.currentPlayer].location].displayIsOn) {
        newBoard.done[newBoard.currentPlayer].draw();
        newDie.draw();
      }
    }
  }
}