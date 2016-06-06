class Game {
  int totalPlayers;
  boolean ranOnce, ranOnce2, isChanceCardGoBackThree, justGotIntoOrOutOfJail;
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
    isChanceCardGoBackThree = false;
    justGotIntoOrOutOfJail = false;
  }
 /* void giveNewDie(){
    int x = newDie.setOfDice[0];
    int x2 = newDie.setOfDice[1];
    newBoard.Spaces[newBoard.numPlayers[newBoard.currentPlayer].location].die1 = x;
    newBoard.Spaces[newBoard.numPlayers[newBoard.currentPlayer].location].die2 = x2;
    System.out.println(x);
    System.out.println(x2);
  }*/
  void checkEvent() {
    //giveNewDie();
    if (!isChanceCardGoBackThree) {
      newDie.roll();
      if (!newBoard.numPlayers[newBoard.currentPlayer].inJail && !(newDie.doubleCount == 2 && newDie.isDouble())) {
        newBoard.numPlayers[newBoard.currentPlayer].move(newDie.getTotal());
      }
    }
    newBoard.draw();
    newDie.draw();
    if (!(newDie.doubleCount == 2 && newDie.isDouble())) {
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
      else if (newBoard.numPlayers[newBoard.currentPlayer].location == 4) {
        newBoard.numPlayers[newBoard.currentPlayer].money -= 200;
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
        } 
        else if (newChance.action.equals("ADVANCE TO THE NEAREST RAILROAD. If UNOWNED, you may buy it from the Bank. If OWNED, pay owner twice the rental to which they are otherwise entitled.")) {
          if (newBoard.Spaces[newBoard.numPlayers[newBoard.currentPlayer].location].purchased) {
            newBoard.numPlayers[newBoard.currentPlayer].money -= newBoard.Spaces[newBoard.numPlayers[newBoard.currentPlayer].location].rentPrice * 2;
            newBoard.Spaces[newBoard.numPlayers[newBoard.currentPlayer].location].owner.money += newBoard.Spaces[newBoard.numPlayers[newBoard.currentPlayer].location].rentPrice * 2;
          }
        } 
        else if (newChance.action.equals("GO BACK THREE SPACES.")) {
          isChanceCardGoBackThree = true;
          checkEvent();
          isChanceCardGoBackThree = false;
        }
        else if (newChance.action.equals("GO TO JAIL. GO DIRECTLY TO JAIL, DO NOT PASS \"GO\", DO NOT COLLECT $200.")) {
          justGotIntoOrOutOfJail = true;
        }
      }
      else if (newBoard.numPlayers[newBoard.currentPlayer].location == 30) {
        newBoard.numPlayers[newBoard.currentPlayer].setLocation(10);
        newBoard.numPlayers[newBoard.currentPlayer].inJail = true;
      }
      else if (newBoard.numPlayers[newBoard.currentPlayer].location == 38) {
        newBoard.numPlayers[newBoard.currentPlayer].money -= 100;
      }
      else if (newBoard.Spaces[newBoard.numPlayers[newBoard.currentPlayer].location].buyable) {
        newBoard.Spaces[newBoard.numPlayers[newBoard.currentPlayer].location].setCurrent(newBoard.numPlayers[newBoard.currentPlayer]);
        newBoard.Spaces[newBoard.numPlayers[newBoard.currentPlayer].location].display();
      }
    }
  }

  void draw() {
    //println(newDie.doubleCount);
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