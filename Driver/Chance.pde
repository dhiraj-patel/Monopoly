import javax.swing.*;
public class Chance{
  public boolean finished;
  public Player player;
  private ArrayList<String>cards;     
  private String action;
  
  public Chance() {
    cards = new ArrayList<String>();
    cards.add("Advance to Go (Collect $200)");
    cards.add("Advance to Illinois Ave");
    cards.add("Advance token to nearest Utility. If unowned, you may buy it from the Bank. If owned, throw dice and pay owner a total ten times the amount thrown.");
    cards.add("Advance token to the nearest Railroad and pay owner twice the rental to which he/she is otherwise entitled. If Railroad is unowned, you may buy it from the Bank.");
    cards.add("Advance token to the nearest Railroad and pay owner twice the rental to which he/she is otherwise entitled. If Railroad is unowned, you may buy it from the Bank.");      
    cards.add("Advance to St. Charles Place – if you pass Go, collect $200");
    cards.add("Bank pays you dividend of $50");
    cards.add("Get out of Jail free – this card may be kept until needed, or traded/sold");
    cards.add("Go back 3 spaces");
    cards.add("Go directly to Jail – do not pass Go, do not collect $200");
    cards.add("Make general repairs on all your property – for each house pay $25 – for each hotel $100");
    cards.add("Pay poor tax of $15");
    cards.add("Take a trip to Reading Railroad – if you pass Go collect $200");
    cards.add("Take a walk on the Boardwalk – advance token to Boardwalk");
    cards.add("You have been elected chairman of the board – pay each player $50");
    cards.add("Your building loan matures – collect $150");
    cards.add("You have won a crossword competition - collect $100");
    Collections.shuffle(cards);
    finished = false;
  }
  
  
  public void execute(Player actor, String action){
    if(action.equals("Advance to Go (Collect $200)")){
      actor.setLocation(40);
      actor.setMoney(actor.getMoney()+200);
    }
    if(action.equals("Advance to Illinois Ave")){
      if(actor.location<40 && actor.location >=25){
        actor.setMoney(actor.getMoney()+200); // if they pass go collect 200
      }
        actor.setLocation(24);
    }
    if(action.equals("Advance token to nearest Utility. If unowned, you may buy it from the Bank. If owned, throw dice and pay owner a total ten times the amount thrown.")){
      if(actor.location>28){
        actor.setLocation(12);
        // need to add the 2nd part of the executable here.
      }
      else{
        actor.setLocation(28);
      }
    }
    if(action.equals("Advance token to the nearest Railroad and pay owner twice the rental to which he/she is otherwise entitled. If Railroad is unowned, you may buy it from the Bank.")) {
      if(actor.location>0 && actor.location<5){
        actor.setLocation(5);
      }
      else if(actor.location > 5 && actor.location < 15){
        actor.setLocation(15);
      }
      else if(actor.location > 15 && actor.location < 25){
        actor.setLocation(25);
      }
      else if(actor.location > 25 && actor.location < 35){
        actor.setLocation(35);
      }
      // need to add the owned part here
    }
    if(action.equals("Advance to St. Charles Place – if you pass Go, collect $200")){
      if(actor.location > 11){
        actor.setMoney(actor.getMoney()+200);
      }
      actor.setLocation(11);
    }
    if(action.equals("Bank pays you dividend of $50")){
      actor.setMoney(actor.getMoney()+50);
    }
    if(action.equals("Get out of Jail free – this card may be kept until needed, or traded/sold")){
      actor.setJFC(true);
      // need to add the part where the player can use it.
    }
    if(action.equals("Go back 3 spaces")){
      if(actor.location == 0){
        actor.setLocation(37);
      }else if(actor.location == 1){
        actor.setLocation(38);
      }else if(actor.location == 2){
        actor.setLocation(39);
      }else{
        actor.setLocation(actor.location-3);
      }
    }
    if(action.equals("Go directly to Jail – do not pass Go, do not collect $200")){
      actor.setLocation(10);
      actor.goToJail();
    }
    if(action.equals("Make general repairs on all your property – for each house pay $25 – for each hotel $100")){
      // do some shit here;
    }
    if(action.equals("Pay poor tax of $15")){ 
      actor.setMoney(actor.getMoney()-15);
    }
    if(action.equals("Take a trip to Reading Railroad – if you pass Go collect $200")) {
      if(actor.location>5){
        actor.setMoney(actor.getMoney()+200); // pass go
      }
      actor.setLocation(5);
    }
    if(action.equals("Take a walk on the Boardwalk – advance token to Boardwalk")) {
      if(actor.location == 0 || actor.location < 39){
        actor.setMoney(actor.getMoney()+200);
      }
      actor.setLocation(39);
    }
    if(action.equals("You have been elected chairman of the board – pay each player $50")) {
      // i dont know what to do here
    }
    if(action.equals("Your building loan matures – collect $150")){
      actor.setMoney(actor.getMoney()+150);
    }
    if(action.equals("You have won a crossword competition - collect $100")){
      actor.setMoney(actor.getMoney()+100);
    }
      
  }
  public String getChanceCard(){
    String removed = cards.remove(0);
    cards.add(removed);
    return removed;
  }
 
  public void run() { 
    //if ((player.location == 7)||(player.location == 22)||(player.location == 36)) {   
      JOptionPane.showMessageDialog(frame, getChanceCard());
      execute(player,getChanceCard());
    //}  
  }
}

    