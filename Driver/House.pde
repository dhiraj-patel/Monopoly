public class House {
  int x, y;
  boolean fourYet, purchased;
  int price; // price for each house;
  PImage house;
  String colorOfPieceBeingPlacedOn;
  int howMany;
  Player owner, current;
  
  public House(int x, int y, Space space) {
    this.x = x;
    this.y = y;
    purchased = false;
    if(space.numOfHouses == 4){
      fourYet = true;
    }else{
      fourYet = false;
    }
    //price = getPrice(space);
    colorOfPieceBeingPlacedOn = space.spaceColor;
    house = loadImage("../Images/Pieces/house.png");
  }
  
  
  public void buyHouse(Space s){
    if(current.money<s.oneHousePrice && current.properties.contains(s) && s.monopolized && s.owner == current){
      current.money = current.money - s.oneHousePrice;
      s.numOfHouses++;
      current.numOfHouses++;
    }
  }
  
  public boolean checkMonopolized(Space s){
    return ((s.owner == current)&&(s.numOfHouses == 4));
  }
  
  void draw() {
    fill(0,0,0);
    //rect(width / 2, height / 2, 500, 500);
    // fix this lmao
  }   
    
  public int getNumHousesWithOutPieces(Space s) {
    Player p = s.owner;
    String check = colorOfPieceBeingPlacedOn;
    int appearances = 0;
    
    for (Space i : p.properties) {
      if (i.spaceColor.equals(check)) {
        appearances ++;
      }
    }
    return appearances;
  }
   
}