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
    if (money <= 0) {
      isBankrupt = true;
      for (Space s:properties) {
        s.purchased = false;
      }
      while (!properties.isEmpty()) {
        properties.remove(0);
      }
    }
    if (!isBankrupt) {
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
      setLabel();
    }
  }
  
  public void setLabel() {
    if(!hasMonopoly("brown") && !hasMonopoly("skyblue") && !hasMonopoly("purple") && !hasMonopoly("orange") && !hasMonopoly("red") && !hasMonopoly("yellow")
        && !hasMonopoly("green") && !hasMonopoly("blue")){
      setColor();
      for (Space space:properties) {
        if (space.location <= 10) {
          rect(568 - (space.location - 1) * 59, 647.5, 56, 3);
        }
        else if (space.location <= 20) {
          rect(69, 568.5 - (space.location - 11) * 59, 3, 56);
        }
        else if (space.location <= 30) {
          rect(95 + (space.location - 21) * 59, 69, 56, 3);
        }
        else if (space.location < 40) {
          rect(647.5, 94.5 + (location - 31) * 59, 3, 56);
        }
      }
    }
    else{
      setColor();
      for (Space space:properties) {
        if (space.location <= 10) {
          rect(568 - (space.location - 1) * 59, 647.5, 56, 3);
          txtButton tb1 = new txtButton(568-(space.location - 1) * 59, 647, "Buy Houses Here", 20, color(0, 0, 0), color(155, 155, 155));
          tb1.draw();
        }
        else if (space.location <= 20) {
          rect(69, 568.5 - (space.location - 11) * 59, 3, 56);
          txtButton tb2 = new txtButton(568-(space.location - 1) * 59, 647, "Buy Houses Here", 20, color(0, 0, 0), color(155, 155, 155));
          tb2.draw();
        }
        else if (space.location <= 30) {
          rect(95 + (space.location - 21) * 59, 69, 56, 3);
          txtButton tb3 = new txtButton(568-(space.location - 1) * 59, 647, "Buy Houses Here", 20, color(0, 0, 0), color(155, 155, 155));
          tb3.draw();
        }
        else if (space.location < 40) {
          rect(647.5, 94.5 + (location - 31) * 59, 3, 56);
          txtButton tb4 = new txtButton(568-(space.location - 1) * 59, 647, "Buy Houses Here", 20, color(0, 0, 0), color(155, 155, 155));
          tb4.draw();
        }
      }
    }
  }
  
  // HOUSE STUFF
  public boolean hasMonopoly(String scolor){
    int count = 0;
    for(Space s:properties){
      if (s.spaceColor.equals(scolor)){
        count++;
      }
    }
    return count == 3;
  }
    
  
  
}