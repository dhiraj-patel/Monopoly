public class Player{
  public int location; //0 Go, 10 Jail, 20 Free Parking, 30 Go To Jail 
  public int money; 
  String name;
  int numInJail;
  boolean inJail;
  
  public Player(String name) {
      this.name = name;
      money = 1500;
      numInJail = 0; 
      location = 40; 
      inJail = false;
  }
  
  public int getMoney() {
      return money;
  }

  public void setMoney(int money) {
     this.money = money;
  }
  
  public void movePlayer(int spaces) {
     this.location += spaces;
  }
  
  void display() {
    if (location <= 10) {
      fill(#00ff7f);
      ellipse((550 - (50 * location)), 550, 25, 25);    
    }
    else if (location <= 20) {
      fill(#00ff7f);
      ellipse(25, 550 - (50 * (location - 10)), 25, 25);
    }
    else if (location <= 30) {
      fill(#00ff7f);
      ellipse((50 + (50 * (location - 20))), 25, 25, 25);  
    }
    else if (location <= 40) {
        if (location == 40) {
          location = 0;
          display();
        }
        else {
          fill(#00ff7f);
          ellipse(550,50+(50*(location-30)),25,25);
        }
    }
  }
}