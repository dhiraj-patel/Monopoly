public class House {
  int x, y;
  boolean fourYet, purchased;
  int price; // price for each house;
  int rent; // rent for single house on the property. 
  PImage house;
  String colorOfPieceBeingPlacedOn;
  int howMany;
  
  public House(int x, int y, PImage house, int howMany, Space space) {
    this.x = x;
    this.y = y;
    this.house = house;
    purchased = false;
    if (howMany == 4) {
      fourYet = true;
    }
    else {
      fourYet = false;
    }
    rent = space.rentPrice;
    price = getPrice(space);
    colorOfPieceBeingPlacedOn = space.spaceColor;
    this.howMany = howMany;
  }
  
  public int getPrice(Space s) {
    if ((s.spaceColor.equals("brown")) || (s.spaceColor.equals("skyblue"))) {
      return 50;
    }
    if ((s.spaceColor.equals("purple")) || (s.spaceColor.equals("orange"))) {
      return 100;
    }
    if ((s.spaceColor.equals("red")) || (s.spaceColor.equals("yellow"))) {
      return 150;
    }
    if ((s.spaceColor.equals("green")) || (s.spaceColor.equals("blue"))) {
      return 200;
    }
    return -1;
  }
  
  public void display() {
    if ((!fourYet) && (purchased)) {
      image(house, x, y, 66, 60);
    }
  }
  
  public int getNumHousesWithOutPieces(Space s) {
    Player p = s.getOwner();
    String check = colorOfPieceBeingPlacedOn;
    int appearances = 0;
    
    for (Integer i : p.properties) {
      Space temp = new Space(i);
      if (temp.spaceColor.equals(check)) {
        appearances ++;
      }
    }
    return appearances;
  }
   
}