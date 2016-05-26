import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.util.concurrent.TimeUnit;

public class Space extends JFrame implements ActionListener{
  int location, cost, monopolyNum, numOfHouses, rentPrice, mortgage, oneHousePrice, oneHouseRent,twoHouseRent,threeHouseRent,fourHouseRent,hotelRent;
  String name, spaceColor;
  boolean purchased, buyable, monopolized, isRailroad, hasHotel; 
  Player current, owner;
  JPanel currentProperty;
  
  public Space(int space) {
     buyable = true;
     purchased = false;
     monopolized = false;
     initializeVars(space);  
     currentProperty = new JPanel();
     owner = null;
     current = null;
  }
  
  public Space(int space, String name) {
    this(space);
    this.name = name;
  }
  
  public void initializeVars(int space) {
    location = space;
    //NON BUYABLES
    if (space == 0 || space == 2 || space == 4 || space == 7 || space == 10 || space == 17 || space == 20 || space == 22 || space == 30 || space == 33 || space == 36 || space == 38) {
      buyable = false;
    }
    //BROWN BROWN BROWN
    if (space == 1) {
      cost = 60;
      spaceColor = "brown";
      monopolyNum = 2;
      numOfHouses = 0;
      hasHotel = false;;
      name = "Mediterranean Avenue";
      isRailroad = false;
      rentPrice = 2;
      mortgage = 30;
      oneHousePrice = 50;
      oneHouseRent = 10;
      twoHouseRent = 30;
      threeHouseRent = 90;
      fourHouseRent = 160;
      hotelRent = 250;
    }
    else if (space == 3) {
      cost = 60;
      spaceColor = "brown";
      monopolyNum = 2;
      numOfHouses = 0;
      hasHotel = false;;
      name = "Baltic Avenue";
      isRailroad = false;
      rentPrice = 4;
      mortgage = 30;
      oneHousePrice = 50;
      oneHouseRent = 20;
      twoHouseRent = 60;
      threeHouseRent = 180;
      fourHouseRent = 320;
      hotelRent = 450;
    }
    //RAILROAD RAILROAD RAILROAD
    else if (space == 5) {
      cost = 200;
      spaceColor = "black";
      monopolyNum = 4;
      numOfHouses = 0;
      hasHotel = false;
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
      hasHotel = false;
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
      hasHotel = false;
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
      hasHotel = false;
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
      hasHotel = false;
      name = "Oriental Avenue";
      isRailroad = false;
      rentPrice = 6;
      mortgage = 50;
      oneHousePrice = 50;
      oneHouseRent = 30;
      twoHouseRent = 90;
      threeHouseRent = 270;
      fourHouseRent = 400;
      hotelRent = 550;
    }
    else if (space == 8) {
      cost = 100;
      spaceColor = "skyblue";
      monopolyNum = 3;
      numOfHouses = 0;
      hasHotel = false;
      name = "Vermont Avenue";
      isRailroad = false;
      rentPrice = 6;
      mortgage = 50;
      oneHousePrice = 50;
      oneHouseRent = 30;
      twoHouseRent = 90;
      threeHouseRent = 270;
      fourHouseRent = 400;
      hotelRent = 550;
    }
    else if (space == 9) {
      cost = 120;
      spaceColor = "skyblue";
      monopolyNum = 3;
      numOfHouses = 0;
      hasHotel = false;
      name = "Connecticut Avenue";
      isRailroad = false;
      rentPrice = 8;
      mortgage = 60;
      oneHousePrice = 50;
      oneHouseRent = 40;
      twoHouseRent = 100;
      threeHouseRent = 300;
      fourHouseRent = 450;
      hotelRent = 600;
    }
    //PURPLE PURPLE PURPLE
    else if (space == 11) {
      cost = 140;
      spaceColor = "purple";
      monopolyNum = 3;
      numOfHouses = 0;
      hasHotel = false;
      name = "St. Charles Place";
      isRailroad = false;
      rentPrice = 10;
      mortgage = 70;
      oneHousePrice = 100;
      oneHouseRent = 50;
      twoHouseRent = 150;
      threeHouseRent = 450;
      fourHouseRent = 625;
      hotelRent = 750;
    }
    else if (space == 13) {
      cost = 140;
      spaceColor = "purple";
      monopolyNum = 3;
      numOfHouses = 0;
      hasHotel = false;
      name = "States Avenue";
      isRailroad = false;
      rentPrice = 10;
      mortgage = 70;
      oneHousePrice = 100;
      oneHouseRent = 50;
      twoHouseRent = 150;
      threeHouseRent = 450;
      fourHouseRent = 625;
      hotelRent = 750;
    }
    else if (space == 14) {
      cost = 160;
      spaceColor = "purple";
      monopolyNum = 3;
      numOfHouses = 0;
      hasHotel = false;
      name = "Virginia Avenue";
      isRailroad = false;
      rentPrice = 12;
      mortgage = 80;
      oneHousePrice = 100;
      oneHouseRent = 60;
      twoHouseRent = 180;
      threeHouseRent = 500;
      fourHouseRent = 700;
      hotelRent = 900;
    }
    //ORANGE ORANGE ORANGE
    else if (space == 16) {
      cost = 180;
      spaceColor = "orange";
      monopolyNum = 3;
      numOfHouses = 0;
      hasHotel = false;
      name = "St. James Place";
      isRailroad = false;
      rentPrice = 14;
      mortgage = 90;
      oneHousePrice = 100;
      oneHouseRent = 70;
      twoHouseRent = 200;
      threeHouseRent = 550;
      fourHouseRent = 750;
      hotelRent = 950;
    }    
    else if (space == 18) {
      cost = 180;
      spaceColor = "orange";
      monopolyNum = 3;
      numOfHouses = 0;
      hasHotel = false;
      name = "Tennessee Avenue";
      isRailroad = false;
      rentPrice = 14;
      mortgage = 90;
      oneHousePrice = 100;
      oneHouseRent = 70;
      twoHouseRent = 200;
      threeHouseRent = 550;
      fourHouseRent = 750;
      hotelRent = 950;
    }
    else if (space == 19) {
      cost = 200;
      spaceColor = "orange";
      monopolyNum = 3;
      numOfHouses = 0;
      hasHotel = false;
      name = "New York Avenue";
      isRailroad = false;
      rentPrice = 16;
      mortgage = 100;
      oneHousePrice = 100;
      oneHouseRent = 80;
      twoHouseRent = 220;
      threeHouseRent = 600;
      fourHouseRent = 800;
      hotelRent = 1000;
    }   
    //RED RED RED
    else if (space == 21) {
      cost = 220;
      spaceColor = "red";
      monopolyNum = 3;
      numOfHouses = 0;
      hasHotel = false;
      name = "Kentucky Avenue";
      isRailroad = false;
      rentPrice = 18;
      mortgage = 110;
      oneHousePrice = 150;
      oneHouseRent = 90;
      twoHouseRent = 250;
      threeHouseRent = 700;
      fourHouseRent = 875;
      hotelRent = 1050;
    }   
    else if (space == 23) {
      cost = 220;
      spaceColor = "red";
      monopolyNum = 3;
      numOfHouses = 0;
      hasHotel = false;
      name = "Indiana Avenue";
      isRailroad = false;
      rentPrice = 18;
      mortgage = 110;
      oneHousePrice = 150;
      oneHouseRent = 90;
      twoHouseRent = 250;
      threeHouseRent = 700;
      fourHouseRent = 875;
      hotelRent = 1050;
    }       
    else if (space == 24) {
      cost = 240;
      spaceColor = "red";
      monopolyNum = 3;
      numOfHouses = 0;
      hasHotel = false;
      name = "Illinois Avenue";
      isRailroad = false;
      rentPrice = 20;
      mortgage = 120;
      oneHousePrice = 150;
      oneHouseRent = 100;
      twoHouseRent = 300;
      threeHouseRent = 750;
      fourHouseRent = 925;
      hotelRent = 1100;
    }   
    //YELLOW YELLOW YELLOW
    else if (space == 26) {
      cost = 260;
      spaceColor = "yellow";
      monopolyNum = 3;
      numOfHouses = 0;
      hasHotel = false;
      name = "Atlantic Avenue";
      isRailroad = false;
      rentPrice = 22;
      mortgage = 130;
      oneHousePrice = 150;
      oneHouseRent = 110;
      twoHouseRent = 330;
      threeHouseRent = 800;
      fourHouseRent = 975;
      hotelRent = 1150;
    }   
    else if (space == 27) {
      cost = 260;
      spaceColor = "red";
      monopolyNum = 3;
      numOfHouses = 0;
      hasHotel = false;
      name = "Ventnor Avenue";
      isRailroad = false;
      rentPrice = 22;
      mortgage = 130;
      oneHousePrice = 150;
      oneHouseRent = 110;
      twoHouseRent = 330;
      threeHouseRent = 800;
      fourHouseRent = 975;
      hotelRent = 1150;
    }   
    else if (space == 29) {
      cost = 280;
      spaceColor = "red";
      monopolyNum = 3;
      numOfHouses = 0;
      hasHotel = false;
      name = "Marvin Gardens";
      isRailroad = false;
      rentPrice = 22;
      mortgage = 140;
      oneHousePrice = 150;
      oneHouseRent = 120;
      twoHouseRent = 360;
      threeHouseRent = 850;
      fourHouseRent = 1025;
      hotelRent = 1200;
    }   
    //GREEN GREEN GREEN
    else if (space == 31) {
      cost = 300;
      spaceColor = "green";
      monopolyNum = 3;
      numOfHouses = 0;
      hasHotel = false;
      name = "Pacific Avenue";
      isRailroad = false;
      rentPrice = 26;
      mortgage = 150;
      oneHousePrice = 200;
      oneHouseRent = 130;
      twoHouseRent = 390;
      threeHouseRent = 900;
      fourHouseRent = 1100;
      hotelRent = 1275;
    }   
    else if (space == 32) {
      cost = 300;
      spaceColor = "green";
      monopolyNum = 3;
      numOfHouses = 0;
      hasHotel = false;
      name = "North Carolina Avenue";
      isRailroad = false;
      rentPrice = 26;
      mortgage = 150;
      oneHousePrice = 200;
      oneHouseRent = 130;
      twoHouseRent = 390;
      threeHouseRent = 900;
      fourHouseRent = 1100;
      hotelRent = 1275;
    }     
    else if (space == 34) {
      cost = 320;
      spaceColor = "green";
      monopolyNum = 3;
      numOfHouses = 0;
      hasHotel = false;
      name = "Pennsylvania Avenue";
      isRailroad = false;
      rentPrice = 28;
      mortgage = 160;
      oneHousePrice = 200;
      oneHouseRent = 150;
      twoHouseRent = 450;
      threeHouseRent = 1000;
      fourHouseRent = 1200;
      hotelRent = 1400;
    }         
    //BLUES BLUES BLUES 
    else if (space == 37) {
      cost = 350;
      spaceColor = "blue";
      monopolyNum = 3;
      numOfHouses = 0;
      hasHotel = false;
      name = "Park Place";
      isRailroad = false;
      rentPrice = 35;
      mortgage = 175;
      oneHousePrice = 200;
      oneHouseRent = 175;
      twoHouseRent = 500;
      threeHouseRent = 1100;
      fourHouseRent = 1300;
      hotelRent = 1500;
    }     
    else if (space == 39) {
      cost = 400;
      spaceColor = "blue";
      monopolyNum = 3;
      numOfHouses = 0;
      hasHotel = false;
      name = "Boardwalk";
      isRailroad = false;
      rentPrice = 50;
      mortgage = 200;
      oneHousePrice = 200;
      oneHouseRent = 200;
      twoHouseRent = 600;
      threeHouseRent = 1400;
      fourHouseRent = 1700;
      hotelRent = 2000;
    }        
  }
  public void buyProperty(Player newOwn){
    newOwn.properties.add(this.location);
    this.setOwner(newOwn);
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

  public void display(){
    if(!this.purchased){
      currentProperty.setLayout(new BoxLayout(currentProperty,BoxLayout.X_AXIS));
      JLabel l1 = new JLabel(this.name);
      l1.setAlignmentX(Component.CENTER_ALIGNMENT);
      
      JLabel l2 = new JLabel("Rent $"+ this.rentPrice);
      l2.setAlignmentX(Component.LEFT_ALIGNMENT);
      
      JLabel l3 = new JLabel("With 1 House $"+this.oneHouseRent);
      l3.setAlignmentX(Component.LEFT_ALIGNMENT);
      
      JLabel l4 = new JLabel("With 2 Houses $"+this.twoHouseRent);
      l4.setAlignmentX(Component.LEFT_ALIGNMENT);
      
      JLabel l5 = new JLabel("With 3 Houses $"+this.threeHouseRent);
      l5.setAlignmentX(Component.LEFT_ALIGNMENT);
      
      JLabel l6 = new JLabel("With 4 Houses $"+this.fourHouseRent);
      l6.setAlignmentX(Component.LEFT_ALIGNMENT);  
      
      JLabel l7 = new JLabel("With Hotel $"+this.hotelRent);
      l7.setAlignmentX(Component.LEFT_ALIGNMENT);  

      JLabel l8 = new JLabel("Mortage Value $" + this.mortgage);
      l8.setAlignmentX(Component.LEFT_ALIGNMENT); 

      JLabel l9 = new JLabel("House cost $"+ this.oneHousePrice +" each");
      l9.setAlignmentX(Component.LEFT_ALIGNMENT);  

      JLabel l10 = new JLabel("Hotels, $"+this.oneHousePrice+" plus 4 houses");
      l10.setAlignmentX(Component.LEFT_ALIGNMENT);  
    /*  
      JButton b1 = new JButton("Buy");
      b1.addActionListener(this);
      b1.setActionCommand("Buy");

      JButton b2 = new JButton("Don't Buy");
      b2.addActionListener(this);
      b2.setActionCommand("Dont");
  */
      currentProperty.add(l1);
      currentProperty.add(l2);
      currentProperty.add(l3);
      currentProperty.add(l4);
      currentProperty.add(l5);
      currentProperty.add(l6);
      currentProperty.add(l7);
      currentProperty.add(l8);
      currentProperty.add(l9);
      currentProperty.add(l10);
      //currentProperty.add(b1);
     // currentProperty.add(b2);
    }
    else{
      // code to pay the owner of the property the correct rent!
      this.payOwner();
    }
  }
  
  
  public void payOwner(){
    if(this.hasHotel){
      current.setMoney(current.getMoney()-this.hotelRent);
      owner.setMoney(owner.getMoney()+this.hotelRent);
    }
    else if(this.numOfHouses == 4){
      current.setMoney(current.getMoney()-this.fourHouseRent);
      owner.setMoney(owner.getMoney()+this.fourHouseRent);
    }
    else if(this.numOfHouses == 3){
      current.setMoney(current.getMoney()-this.threeHouseRent);
      owner.setMoney(owner.getMoney()+this.threeHouseRent);
    }
    else if(this.numOfHouses == 2){
      current.setMoney(current.getMoney()-this.twoHouseRent);
      owner.setMoney(owner.getMoney()+this.twoHouseRent);
    }
    else if(this.numOfHouses == 1){
      current.setMoney(current.getMoney()-this.oneHouseRent);
      owner.setMoney(owner.getMoney()+this.oneHouseRent);
    }
    else{
      current.setMoney(current.getMoney()-this.rentPrice);
      owner.setMoney(owner.getMoney()+this.rentPrice);
    }
  }
      
    
  public void actionPerformed(ActionEvent e){
    String event = e.getActionCommand();
    if(event.equals("Buy")){
      if(current.money<this.cost){
        JOptionPane.showMessageDialog(this,"Not enough money to buy this property","WARNING!",JOptionPane.ERROR_MESSAGE);
      }else{
        int reply = JOptionPane.showConfirmDialog(this,"Are you sure you want to buy this property?","CONFIRM YOUR CHOICE!",JOptionPane.YES_NO_OPTION);
        if(reply == JOptionPane.YES_OPTION){
          current.properties.add(this.location);
          buyProperty(current);
        }else{
          //terminate();//temp, this will eventually be replaced by auction.
        }
      }
    }else{
    }
    //player.getDisplayer().updateProperty();  ADD IT TO THE LIST OF PROPERTIES THAT THE PLAYER HAS?
  }
    
  public void terminate(){    
    
  }
      
      
      

  

  
  
}
  
 