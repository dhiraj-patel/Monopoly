public class Player {
  public int location; //0 Go, 10 Jail, 20 Free Parking, 30 Go To Jail 
  public int money;
  public String playerColor;
  int playerNum;
  String name;
  int numInJail;
  boolean inJail;
  boolean isBankrupt;
  
  public Player(String name, int playerNum, String playerColor) {
      this.name = name;
      this.playerNum = playerNum;
      this.playerColor = playerColor;
      money = 1500;
      numInJail = 0; 
      location = 32;
      inJail = false;
      isBankrupt = false;
      colorMode(RGB);
  }
  
  public int getMoney() {
      return money;
  }

  public void setMoney(int money) {
     this.money = money;
  }
  
  public void movePlayer(int spaces) {
     location += spaces;
     if (location >= 40) {
       location -= 40;
       money += 200;
     }
  }
  
  public void setColor() {
    if (playerColor.equals("green")) {
      fill(0, 255, 0);
    }
    else if (playerColor.equals("red")) {
      fill(255, 0, 0);
    }
    else if (playerColor.equals("blue")) {
      fill(0, 0, 255);
    }
    else if (playerColor.equals("orange")) {
      fill(255, 165, 9);
    }
    else if (playerColor.equals("yellow")) {
      fill(255, 255, 0);
    }
    else if (playerColor.equals("white")) {
      fill(255, 255, 255);
    }
  }
  
  void draw() {
    if (isBankrupt) {
    }
    else {
      setColor();
      if (location == 0) {
        ellipse(935, 920 + (playerNum * 5), 25, 25);
      }
      else if (location < 10) {
        ellipse(827.5 - (location - 1) * 82, 920 + (playerNum * 5), 25, 25);  //935  //827.5 //747 //80.5
      }
      else if (location == 10) {
        ellipse(70, 920 + (playerNum * 5), 25, 25);
      }
      else if (location < 20) {
        ellipse(70 - (playerNum * 5), 827.5 - (location - 11) * 82, 25, 25); //827.5
      }
      else if (location == 20) {
        ellipse(70, 75 - (playerNum * 5), 25, 25);
      }
      else if (location < 30) {
        ellipse(172.5 + (location - 21) * 82, 75 - (playerNum * 5), 25, 25);
      }
      else if (location == 30) {
        ellipse(930 + (playerNum * 5), 70, 25, 25);
      }
      else if (location < 40) {
        ellipse(930 + (playerNum * 5), 172 + (location - 31) * 82, 25, 25); //173.5
      } 
    }
  }
}