import javax.swing.*;

public class Chance {
  private ArrayList<String> cards;     
  String action;
  
  public Chance() {
    action = "";
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
  }
  
  public void execute(Player actor, String action) {
    if (action.equals("Advance to Go (Collect $200)")) {
      actor.setLocation(0);
      actor.setMoney(actor.getMoney() + 200);
    }
    if (action.equals("Advance to Illinois Ave")) {
      if (actor.location < 40 && actor.location >= 25) {
        actor.setMoney(actor.getMoney() + 200); // if they pass go collect 200
      }
      actor.setLocation(24);
    }
    if (action.equals("Advance token to nearest Utility. If unowned, you may buy it from the Bank. If owned, throw dice and pay owner a total ten times the amount thrown.")) {
      if (actor.location == 36) {
        actor.setMoney(actor.getMoney() + 200);
        actor.setLocation(12);
        
        //will continue to need work
      }
      else if (actor.location == 7) {
        actor.setLocation(12);
      }
      else if (actor.location == 22) {
        actor.setLocation(28);
      }
        
    }
    if (action.equals("Advance token to the nearest Railroad and pay owner twice the rental to which he/she is otherwise entitled. If Railroad is unowned, you may buy it from the Bank.")) {
      if (actor.location == 36) {
        actor.setMoney(actor.getMoney() + 200);
        actor.setLocation(5);
      }
      else if (actor.location == 7) {
        actor.setLocation(15);
      }
      else if (actor.location == 22) {
        actor.setLocation(25);
      }
    }
    if (action.equals("Advance to St. Charles Place – if you pass Go, collect $200")) {
      if (actor.location > 11) {
        actor.setMoney(actor.getMoney() + 200);
      }
      actor.setLocation(11);
    }
    if (action.equals("Bank pays you dividend of $50")) {
      actor.setMoney(actor.getMoney() + 50);
    }
    if (action.equals("Get out of Jail free – this card may be kept until needed, or traded/sold")) {
      actor.incrementJFC();
    }
    if (action.equals("Go back 3 spaces")) {
      actor.setLocation(actor.location - 3);
    }
    if (action.equals("Go directly to Jail – do not pass Go, do not collect $200")) {
      actor.goToJail();
    }
    if (action.equals("Make general repairs on all your property – for each house pay $25 – for each hotel $100")) {
      int cost = 0;
      cost = cost + (25 * actor.numOfHouses) + (100 * actor.numOfHotels);
      actor.money -= cost;
    }
    if (action.equals("Pay poor tax of $15")) { 
      actor.setMoney(actor.getMoney() - 15);
    }
    if (action.equals("Take a trip to Reading Railroad – if you pass Go collect $200")) {
      if (actor.location > 5) {
        actor.setMoney(actor.getMoney() + 200);
      }
      actor.setLocation(5);
    }
    if (action.equals("Take a walk on the Boardwalk – advance token to Boardwalk")) {
      actor.setLocation(39);
    }
    if (action.equals("Your building loan matures – collect $150")) {
      actor.setMoney(actor.getMoney() + 150);
    }
    if (action.equals("You have won a crossword competition - collect $100")) {
      actor.setMoney(actor.getMoney() + 100);
    }  
  }
  
  // main method for choosing chances 
  public void getChanceCard(Player actor) {
    action = cards.remove(0);
    if (!(action.equals("Get out of Jail free – this card may be kept until needed, or traded/sold"))) {
      cards.add(action);
    }
    JOptionPane.showMessageDialog(frame, action);
    execute(actor, action);
  }
  
 
}

    