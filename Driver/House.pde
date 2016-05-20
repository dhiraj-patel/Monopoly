public class House{
  int x,y;
  public boolean fourYet, purchased;
  int price; // price for each house;
  int rent; // rent for single house on the property. 
  PImage house;
  int colorOfPieceBeingPlacedOn;
  public House(int x, int y, PImage house, int howMany, Space space) {
    this.x = x;
    this.y = y;
    this.house = house;
    purchased = false;
    fourYet = false;
    rent = getCurrentRent(space);
    price = getPrice(space);
    colorOfPieceBeingPlacedOn = space.spaceColor;
  }
  public int getPrice(Space s) {
    if((s.spaceColor.equals("brown")) || (s.spaceColor.equals("skyblue"))) {
      return 50;
    }
    else if((s.spaceColor.equals("purple")) || (s.spaceColor.equals("orange"))) {
      return 100;
    }
    else if((s.spaceColor.equals("red")) || (s.spaceColor.equals("yellow"))) {
      return 150;
    }
    else if((s.spaceColor.equals("green")) || (s.spaceColor.equals("blue"))){
      return 200;
    }
  }
  public void display(){
    if((!fourYet)&&(purchased)){
      image(house, x, y, 66, 60);
    }
  }
  public int getNumHousesWithOutPieces(Space s) {
    Player p = s.getOwner();
    String check = colorOfPieceBeingPlacedOn;
    int appearances = 0;
    
    for(Integer i : p.properties){
      Space temp = new Space(i);
      if(temp.spaceColor.equals(check)){
        appearances++;
      }
    }
    return appearances;
  }
   
}