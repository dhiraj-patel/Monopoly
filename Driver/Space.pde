public class Space{
  int location,cost,monopolyNum,numOfHouses,numOfHotels;
  int cost;
  String name;
  String spaceColor;
  boolean purchased; 
  boolean monopolized; 
  boolean isRailroad;
  public Space(int space){
     initializeVars(space);
     purchased = false;
     monopolized = false;
  }
  public Space(int space,String name_){
    this(space);
    name = name_;
  }
 
  public void initializeVars(int space){
    location = space;
    // BROWNS: BROWNS BROWNS
    if(space == 1){
      cost = 60;
      spaceColor = "brown";
      monopolyNum = 2;
      numOfHouses = 0;
      numOfHotels = 0;
      name = "Mediterranean Avenue";
      isRailroad = false;
    }
    else if (space == 3){
      cost = 60;
      spaceColor = "brown";
      monopolyNum = 2;
      numOfHouses = 0;
      numOfHotels = 0;
      name = "Baltic Avenue";
      isRailroad = false;
    }
    
    
    // RAILROADS RAILROADS RAILROADS
    else if (space == 5){
      cost = 200;
      spaceColor = "black";
      monopolyNum = 4;
      numOfHouses = 0;
      numOfHotels = 0;
      name = "Reading Railraod";
      isRailroad = true;
    }
    else if (space == 15){
      cost = 200;
      spaceColor = "black";
      monopolyNum = 4;
      numOfHouses = 0;
      numOfHotels = 0;
      name = "Pennsylvania Railraod";
      isRailroad = true;
    }
    else if (space == 25){
      cost = 200;
      spaceColor = "black";
      monopolyNum = 4;
      numOfHouses = 0;
      numOfHotels = 0;
      name = "B&O Railraod";
      isRailroad = true;
    }
    else if (space == 35){
      cost = 200;
      spaceColor = "black";
      monopolyNum = 4;
      numOfHouses = 0;
      numOfHotels = 0;
      name = "Short Line";
      isRailroad = true;
    }
    
    // SKYBLUES SKYBLUES SKYBLUES    
    else if (space == 6){
      cost = 100;
      spaceColor = "skyblue";
      monopolyNum = 3;
      numOfHouses = 0;
      numOfHotels = 0;
      name = "Oriental Avenue";
      isRailroad = false;
    }
        else if (space == 8){
      cost = 100;
      spaceColor = "skyblue";
      monopolyNum = 3;
      numOfHouses = 0;
      numOfHotels = 0;
      name = "Vermont Avenue";
      isRailroad = false;
    }
    else if (space == 9){
      cost = 120;
      spaceColor = "skyblue";
      monopolyNum = 3;
      numOfHouses = 0;
      numOfHotels = 0;
      name = "Connecticut Avenue";
      isRailroad = false;
    }
    // PURPLES PURPLES PURPLES 
    else if (space == 11){
      cost = 140;
      spaceColor = "purple";
      monopolyNum = 3;
      numOfHouses = 0;
      numOfHotels = 0;
      name = "St. Charles Place";
      isRailroad = false;
    }
    else if (space == 13){
      cost = 140;
      spaceColor = "purple";
      monopolyNum = 3;
      numOfHouses = 0;
      numOfHotels = 0;
      name = "States Avenue";
      isRailroad = false;
    }
    else if (space == 14){
      cost = 160;
      spaceColor = "purple";
      monopolyNum = 3;
      numOfHouses = 0;
      numOfHotels = 0;
      name = "Virginia Avenue";
      isRailroad = false;
    }
    // ORANGES ORANGES ORANGES
    else if (space == 16){
      cost = 180;
      spaceColor = "orange";
      monopolyNum = 3;
      numOfHouses = 0;
      numOfHotels = 0;
      name = "St. James Place";
      isRailroad = false;
    }    
    else if (space == 18){
      cost = 180;
      spaceColor = "orange";
      monopolyNum = 3;
      numOfHouses = 0;
      numOfHotels = 0;
      name = "Tennessee Avenue";
      isRailroad = false;
    }
    else if (space == 19){
      cost = 200;
      spaceColor = "orange";
      monopolyNum = 3;
      numOfHouses = 0;
      numOfHotels = 0;
      name = "New York Avenue";
      isRailroad = false;
    }   
    // RED RED RED RED RED RED RED
    else if (space == 21){
      cost = 220;
      spaceColor = "red";
      monopolyNum = 3;
      numOfHouses = 0;
      numOfHotels = 0;
      name = "Kentucky Avenue";
      isRailroad = false;
    }   
    else if (space == 23){
      cost = 220;
      spaceColor = "red";
      monopolyNum = 3;
      numOfHouses = 0;
      numOfHotels = 0;
      name = "Indiana Avenue";
      isRailroad = false;
    }       
    else if (space == 24){
      cost = 240;
      spaceColor = "red";
      monopolyNum = 3;
      numOfHouses = 0;
      numOfHotels = 0;
      name = "Illinois Avenue";
      isRailroad = false;
    }   
    // YELLOW YELLOW YELLOW
    else if (space == 26){
      cost = 260;
      spaceColor = "yellow";
      monopolyNum = 3;
      numOfHouses = 0;
      numOfHotels = 0;
      name = "Atlantic Avenue";
      isRailroad = false;
    }   
    else if (space == 27){
      cost = 260;
      spaceColor = "red";
      monopolyNum = 3;
      numOfHouses = 0;
      numOfHotels = 0;
      name = "Ventnor Avenue";
      isRailroad = false;
    }   
    else if (space == 29){
      cost = 280;
      spaceColor = "red";
      monopolyNum = 3;
      numOfHouses = 0;
      numOfHotels = 0;
      name = "Marvin Gardens";
      isRailroad = false;
    }   
    //GREEN GREEN GREEN
    else if (space == 31){
      cost = 300;
      spaceColor = "green";
      monopolyNum = 3;
      numOfHouses = 0;
      numOfHotels = 0;
      name = "Pacific Avenue";
      isRailroad = false;
    }   
    else if (space == 32){
      cost = 300;
      spaceColor = "green";
      monopolyNum = 3;
      numOfHouses = 0;
      numOfHotels = 0;
      name = "North Carolina Avenue";
      isRailroad = false;
    }     
    else if (space == 34){
      cost = 320;
      spaceColor = "green";
      monopolyNum = 3;
      numOfHouses = 0;
      numOfHotels = 0;
      name = "Pennsylvania Avenue";
      isRailroad = false;
    }         
    // BLUES BLUES BLUES 
    else if (space == 37){
      cost = 350;
      spaceColor = "blue";
      monopolyNum = 3;
      numOfHouses = 0;
      numOfHotels = 0;
      name = "Park Place";
      isRailroad = false;
    }     
    else if (space == 39){
      cost = 400;
      spaceColor = "blue";
      monopolyNum = 3;
      numOfHouses = 0;
      numOfHotels = 0;
      name = "Boardwalk";
      isRailroad = false;
    }        
  }
}
  
 