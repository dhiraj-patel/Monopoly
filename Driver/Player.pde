public class Player{
  // maybe use a 2d array for each player to show what properties they have? 
  // like the row would be the first color one, and hte col to cehck if they
  // have any more:
  /*
  ____________
  P1 VIRGINIA      BALTIC
     STATES        MEDITT
     ST CHARLES
  _____________
  */
  public int location; //location on the board 0 is the GO; 10 is jail; 20 is free park
                       //30 is go to jail; no 40 it resets to 0! 
  private int money; 
  String pieceName;
  int numInJail;
  boolean inJail;
  public Player(String piece){
      pieceName = piece;
      money = 1500;
      numInJail = 0; 
      location = 40; 
      inJail = false;
  }
  // ACCESSORS
  public int getMoney(){
      return money;
  }
  // MUTATORS:
  public void setMoney(int money){
     this.money = money;
  }
  public void movePlayer(int spaces){
     this.location += spaces;
  }
  void display(){
    if(location<=10){
      fill(#00ff7f);
      ellipse((550-(50*location)),550,25,25);    
    }
    else if(location<=20){
      fill(#00ff7f);
      ellipse(25,550-(50*(location-10)),25,25);
    }
    else if(location<=30){
      fill(#00ff7f);
      ellipse((50+(50*(location-20))),25,25,25);  
    }
    else if(location<=40){
        if(location == 40){
          location = 0;
          display();
        }
        else{
          fill(#00ff7f);
          ellipse(550,50+(50*(location-30)),25,25);
        }
    }
  }
    
    
    
}