public class Player {
  public int location; //0 Go, 10 Jail, 20 Free Parking, 30 Go To Jail 
  public int money;
  public String playerColor;
  int playerNum;
  String name;
  int numInJail, numOfHouses, numOfHotels;
  boolean inJail;
  boolean isBankrupt;
  int JFCNum;
  ArrayList<Space> properties;
  
  public Player(String name, int playerNum, String playerColor) {
    this.name = name;
    this.playerNum = playerNum;
    this.playerColor = playerColor;
    money = 1500;
    numInJail = -1; 
    location = 0;
    inJail = false;
    JFCNum = 0;
    isBankrupt = false;
    colorMode(RGB);
    numOfHouses = 0;
    numOfHotels = 0;
    properties = new ArrayList<Space>();
  }
  
  public int getMoney() {
    return money;
  }

  public void setMoney(int money) {
    this.money = money;
  }
  
  public void setLocation(int location){
    this.location = location;
  }
  
  public void incrementJFC() {
    JFCNum ++;
  }
  
  public void move(int spaces) {
     location += spaces;
     if (location >= 40) {
       location -= 40;
       money += 200;
     }
  }
  
  public void goToJail() {
    location = 10;
    inJail = true;
  }
  
  public void buySpace(Space s) {
    if (!s.purchased) {
      s.purchased = true;
      s.owner = this;
      properties.add(s);
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
        ellipse(665 + (playerNum * 5), 695, 15, 15);
      }
      else if (location < 10) {
        ellipse(575 - (location - 1) * 60 + (playerNum * 5), 695, 15, 15);  
      }
      else if (location == 10) {
        ellipse(30 + (playerNum * 5), 695, 15, 15);
      }
      else if (location < 20) {
        ellipse(30, 575 - (location - 11) * 60 + (playerNum * 5), 15, 15);
      }
      else if (location == 20) {
        ellipse(25 + (playerNum * 5), 30, 15, 15);
      }
      else if (location < 30) {
        ellipse(100 + (location - 21) * 60 + (playerNum * 5), 30, 15, 15);
      }
      else if (location == 30) {
        ellipse(680, 25 + (playerNum * 5), 15, 15);
      }
      else if (location < 40) {
        ellipse(680, 100 + (location - 31) * 60 + (playerNum * 5), 15, 15);
      }      
    }
  }
  public void helper(int r, int g, int b, Space space, int perma){
    fill(r,g,b);
    if(space.location < 10){
      rect((575 - (perma - 1) * 60), 700,50, 15);  
    }
    else if (space.location < 20) {
      rect(5, 575 - (perma - 11) * 60,15, 50);
    }
    else if (space.location <30){
      rect(100 + (perma - 21) * 60, 30, 50, 15);
    }
    else if (space.location < 40){
      rect(680, 100 + (perma - 31) * 60, 15, 50);
    }
  }
  public void tester(){
    for(Space space:properties){
        if(space.purchased){
          int permax = space.location;
          String s = space.owner.playerColor;
          if(s.equals("green")){
            helper(0,255,0,space,permax);
          }
          else if(s.equals("yellow")){
            helper(255,255,0,space,permax);
          }
          else if(s.equals("blue")){
            helper(0,0,255,space,permax);
          }
          else if(s.equals("red")){
            helper(255,0,0,space,permax);
          }
        }
      }
  }
}