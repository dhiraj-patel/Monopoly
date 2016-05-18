public class Space {
  int location, cost, monopolyNum, numOfHouses, numOfHotels, rentPrice, mortgage;
  String name;
  String spaceColor;
  boolean purchased; 
  boolean monopolized; 
  boolean isRailroad;
  Player owner;
  
  public Space(int space) {
     initializeVars(space);
     purchased = false;
     monopolized = false;
  }
  
  public Space(int space,String name) {
    this(space);
    this.name = name;
  }
  
  public void initializeVars(int space) {
    location = space;
    //BROWN BROWN BROWN
    if (space == 1) {
      cost = 60;
      spaceColor = "brown";
      monopolyNum = 2;
      numOfHouses = 0;
      numOfHotels = 0;
      name = "Mediterranean Avenue";
      isRailroad = false;
      rentPrice = 2;
      mortgage = 30;
    }
    else if (space == 3) {
      cost = 60;
      spaceColor = "brown";
      monopolyNum = 2;
      numOfHouses = 0;
      numOfHotels = 0;
      name = "Baltic Avenue";
      isRailroad = false;
      rentPrice = 4;
      mortgage = 30;
    }
    //RAILROAD RAILROAD RAILROAD
    else if (space == 5) {
      cost = 200;
      spaceColor = "black";
      monopolyNum = 4;
      numOfHouses = 0;
      numOfHotels = 0;
      name = "Reading Railraod";
      isRailroad = true;
      //rentPrice = ;
      mortgage = 100;
    }
    else if (space == 15) {
      cost = 200;
      spaceColor = "black";
      monopolyNum = 4;
      numOfHouses = 0;
      numOfHotels = 0;
      name = "Pennsylvania Railraod";
      isRailroad = true;
      //rentPrice = 2;
      mortgage = 100;
    }
    else if (space == 25) {
      cost = 200;
      spaceColor = "black";
      monopolyNum = 4;
      numOfHouses = 0;
      numOfHotels = 0;
      name = "B&O Railraod";
      isRailroad = true;
      //rentPrice = 2;
      mortgage = 100;
    }
    else if (space == 35) {
      cost = 200;
      spaceColor = "black";
      monopolyNum = 4;
      numOfHouses = 0;
      numOfHotels = 0;
      name = "Short Line";
      isRailroad = true;
      //rentPrice = 2;
      mortgage = 100;
    }
    //LIGHT BLUE LIGHT BLUE LIGHT BLUE
    else if (space == 6) {
      cost = 100;
      spaceColor = "skyblue";
      monopolyNum = 3;
      numOfHouses = 0;
      numOfHotels = 0;
      name = "Oriental Avenue";
      isRailroad = false;
      rentPrice = 6;
      mortgage = 50;
    }
    else if (space == 8) {
      cost = 100;
      spaceColor = "skyblue";
      monopolyNum = 3;
      numOfHouses = 0;
      numOfHotels = 0;
      name = "Vermont Avenue";
      isRailroad = false;
      rentPrice = 6;
      mortgage = 50;
    }
    else if (space == 9) {
      cost = 120;
      spaceColor = "skyblue";
      monopolyNum = 3;
      numOfHouses = 0;
      numOfHotels = 0;
      name = "Connecticut Avenue";
      isRailroad = false;
      rentPrice = 8;
      mortgage = 60;
    }
    //PURPLE PURPLE PURPLE
    else if (space == 11) {
      cost = 140;
      spaceColor = "purple";
      monopolyNum = 3;
      numOfHouses = 0;
      numOfHotels = 0;
      name = "St. Charles Place";
      isRailroad = false;
      rentPrice = 10;
      mortgage = 70;
    }
    else if (space == 13) {
      cost = 140;
      spaceColor = "purple";
      monopolyNum = 3;
      numOfHouses = 0;
      numOfHotels = 0;
      name = "States Avenue";
      isRailroad = false;
            rentPrice = 10;
      mortgage = 70;
    }
    else if (space == 14) {
      cost = 160;
      spaceColor = "purple";
      monopolyNum = 3;
      numOfHouses = 0;
      numOfHotels = 0;
      name = "Virginia Avenue";
      isRailroad = false;
      rentPrice = 12;
      mortgage = 80;
    }
    //ORANGE ORANGE ORANGE
    else if (space == 16) {
      cost = 180;
      spaceColor = "orange";
      monopolyNum = 3;
      numOfHouses = 0;
      numOfHotels = 0;
      name = "St. James Place";
      isRailroad = false;
      rentPrice = 14;
      mortgage = 90;
    }    
    else if (space == 18) {
      cost = 180;
      spaceColor = "orange";
      monopolyNum = 3;
      numOfHouses = 0;
      numOfHotels = 0;
      name = "Tennessee Avenue";
      isRailroad = false;
      rentPrice = 14;
      mortgage = 90;
    }
    else if (space == 19) {
      cost = 200;
      spaceColor = "orange";
      monopolyNum = 3;
      numOfHouses = 0;
      numOfHotels = 0;
      name = "New York Avenue";
      isRailroad = false;
      rentPrice = 16;
      mortgage = 100;
    }   
    //RED RED RED
    else if (space == 21) {
      cost = 220;
      spaceColor = "red";
      monopolyNum = 3;
      numOfHouses = 0;
      numOfHotels = 0;
      name = "Kentucky Avenue";
      isRailroad = false;
      rentPrice = 18;
      mortgage = 110;
    }   
    else if (space == 23) {
      cost = 220;
      spaceColor = "red";
      monopolyNum = 3;
      numOfHouses = 0;
      numOfHotels = 0;
      name = "Indiana Avenue";
      isRailroad = false;
      rentPrice = 18;
      mortgage = 110;
    }       
    else if (space == 24) {
      cost = 240;
      spaceColor = "red";
      monopolyNum = 3;
      numOfHouses = 0;
      numOfHotels = 0;
      name = "Illinois Avenue";
      isRailroad = false;
      rentPrice = 20;
      mortgage = 120;
    }   
    //YELLOW YELLOW YELLOW
    else if (space == 26) {
      cost = 260;
      spaceColor = "yellow";
      monopolyNum = 3;
      numOfHouses = 0;
      numOfHotels = 0;
      name = "Atlantic Avenue";
      isRailroad = false;
      rentPrice = 22;
      mortgage = 130;
    }   
    else if (space == 27) {
      cost = 260;
      spaceColor = "red";
      monopolyNum = 3;
      numOfHouses = 0;
      numOfHotels = 0;
      name = "Ventnor Avenue";
      isRailroad = false;
      rentPrice = 22;
      mortgage = 130;
    }   
    else if (space == 29) {
      cost = 280;
      spaceColor = "red";
      monopolyNum = 3;
      numOfHouses = 0;
      numOfHotels = 0;
      name = "Marvin Gardens";
      isRailroad = false;
      rentPrice = 22;
      mortgage = 140;
    }   
    //GREEN GREEN GREEN
    else if (space == 31) {
      cost = 300;
      spaceColor = "green";
      monopolyNum = 3;
      numOfHouses = 0;
      numOfHotels = 0;
      name = "Pacific Avenue";
      isRailroad = false;
      rentPrice = 26;
      mortgage = 150;
    }   
    else if (space == 32) {
      cost = 300;
      spaceColor = "green";
      monopolyNum = 3;
      numOfHouses = 0;
      numOfHotels = 0;
      name = "North Carolina Avenue";
      isRailroad = false;
      rentPrice = 26;
      mortgage = 150;
    }     
    else if (space == 34) {
      cost = 320;
      spaceColor = "green";
      monopolyNum = 3;
      numOfHouses = 0;
      numOfHotels = 0;
      name = "Pennsylvania Avenue";
      isRailroad = false;
      rentPrice = 28;
      mortgage = 160;
    }         
    //BLUES BLUES BLUES 
    else if (space == 37) {
      cost = 350;
      spaceColor = "blue";
      monopolyNum = 3;
      numOfHouses = 0;
      numOfHotels = 0;
      name = "Park Place";
      isRailroad = false;
      rentPrice = 35;
      mortgage = 175;
    }     
    else if (space == 39) {
      cost = 400;
      spaceColor = "blue";
      monopolyNum = 3;
      numOfHouses = 0;
      numOfHotels = 0;
      name = "Boardwalk";
      isRailroad = false;
      rentPrice = 50;
      mortgage = 200;
    }        
  }
  
  //mutators
  public void setOwner(Player owner) {
    this.owner = owner;
    purchased = true;
  }
  
  public void removeOwner() {
    this.owner = null;
    purchased = false;
  }
  
  //accessors
  public Player getOwner() {
    if (purchased) {
      return owner;
    }
    else {
      return null;
    }
  }
}
  
 