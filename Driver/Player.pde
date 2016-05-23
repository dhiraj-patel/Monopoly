public class Player {
  public int location; //0 Go, 10 Jail, 20 Free Parking, 30 Go To Jail 
  public int money;
  public String playerColor;
  int playerNum;
  String name;
  int numInJail;
  boolean inJail;
  boolean isBankrupt;
  ArrayList<Integer> properties;
  PImage token; 
  public Player(String name, int playerNum, String playerColor) {
      setImage();
      this.name = name;
      this.playerNum = playerNum;
      this.playerColor = playerColor;
      money = 1500;
      numInJail = 0; 
      location = 0;
      inJail = false;
      isBankrupt = false;
      colorMode(RGB);
      properties = new ArrayList<Integer>();
  }
  
  public int getMoney() {
      return money;
  }
  public void setImage(){
    int r = (int)(Math.random()*8);    
    if(r == 0){ token = loadImage("../Images/Pieces/boot.png"); }
    else if(r == 1){ token = loadImage("../Images/Pieces/car.png"); }
    else if(r == 2){ token = loadImage("../Images/Pieces/dog.png"); }
    else if(r == 3){ token = loadImage("../Images/Pieces/hat.png"); }
    else if(r == 4){ token = loadImage("../Images/Pieces/iron.png"); }
    else if(r == 5){ token = loadImage("../Images/Pieces/ship.png"); }
    else if(r == 6){ token = loadImage("../Images/Pieces/thimble.png"); }
    else if(r == 7){ token = loadImage("../Images/Pieces/wheelbarrow.png"); }
  }
  public void setMoney(int money) {
     this.money = money;
  }
  
  public void move(int spaces) {
     location += spaces;
     if (location >= 40) {
       location -= 40;
       money += 200;
     }
  }
  
  public void buyLocation(Space s) {
    if (!s.purchased) {
      s.purchased = true;
      s.setOwner(this);
      properties.add(s.location);
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
        image(token, 665 + (playerNum * 5), 695, 15, 15);
      }
    
      else if (location < 10) {
       image(token,575 - (location - 1) * 60 + (playerNum * 5), 695, 15, 15);  
      }
      else if (location == 10) {
        image(token,30 + (playerNum * 5), 695, 15, 15);
      }
      else if (location < 20) {
        image(token,30, 575 - (location - 11) * 60 + (playerNum * 5), 15, 15);
      }
      else if (location == 20) {
        image(token,25 + (playerNum * 5), 30, 15, 15);
      }
      else if (location < 30) {
        image(token,100 + (location - 21) * 60 + (playerNum * 5), 30, 15, 15);
      }
      else if (location == 30) {
        image(token,680, 25 + (playerNum * 5), 15, 15);
      }
      else if (location < 40) {
        image(token,680, 100 + (location - 31) * 60 + (playerNum * 5), 15, 15);
      } 
    }
  }
}