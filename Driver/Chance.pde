import javax.swing.*;
public class Chance {
  private ArrayList<String> cards;     
  String action;
  
  public Chance() {
    action = "";
    cards = new ArrayList<String>();
    cards.add("ADVANCE TO \"GO\". (COLLECT $200)");
    cards.add("ADVANCE TO ILLINOIS AVENUE. IF YOU PASS \"GO\" COLLECT $200.");
    cards.add("ADVANCE TO THE NEAREST UTILITY. If UNOWNED, you may buy it from the Bank. If OWNED, throw dice and pay owner a total ten times amount thrown.");
    cards.add("ADVANCE TO THE NEAREST RAILROAD. If UNOWNED, you may buy it from the Bank. If OWNED, pay owner twice the rental to which they are otherwise entitled.");
    cards.add("ADVANCE TO THE NEAREST RAILROAD. If UNOWNED, you may buy it from the Bank. If OWNED, pay owner twice the rental to which they are otherwise entitled.");      
    cards.add("ADVANCE TO ST. CHARLES PLACE. IF YOU PASS \"GO\" COLLECT $200.");
    cards.add("BANK PAYS YOU DIVIDEND OF $50.");
    cards.add("GET OUT OF JAIL FREE. This card may be kept until needed or traded.");
    cards.add("GO BACK THREE SPACES.");
    cards.add("GO TO JAIL. GO DIRECTLY TO JAIL, DO NOT PASS \"GO\", DO NOT COLLECT $200.");
    cards.add("MAKE GENERAL REPAIRS ON ALL YOUR PROPERTY: FOR EACH HOUSE PAY $25, FOR EACH HOTEL PAY $100.");
    cards.add("SPEEDING FINE $15.");
    cards.add("TAKE A TRIP TO READING RAILROAD. IF YOU PASS \"GO\" COLLECT $200.");
    cards.add("ADVANCE TO BOARDWALK.");
    cards.add("YOU HAVE BEEN ELECTED CHAIRMAN OF THE BOARD. PAY EACH PLAYER $50.");
    cards.add("YOUR BUILDING LOAN MATURES. COLLECT $150.");
    Collections.shuffle(cards);
  }
  
  public void execute(Player actor, String action) {
    if (action.equals("ADVANCE TO \"GO\". (COLLECT $200)")) {
      actor.location = 0;
      actor.money += 200;
    }
    if (action.equals("ADVANCE TO ILLINOIS AVENUE. IF YOU PASS \"GO\" COLLECT $200.")) {
      if (actor.location == 36) {
        actor.money += 200;
        actor.location = 24;
      }
      else if (actor.location == 7) {
        actor.location = 24;
      }
      else if (actor.location == 22) {
        actor.location = 24;
      }
    }
    if (action.equals("ADVANCE TO THE NEAREST UTILITY. If UNOWNED, you may buy it from the Bank. If OWNED, throw dice and pay owner a total ten times amount thrown.")) {
      if (actor.location == 36) {
        actor.money += 200;
        actor.location = 12;
      }
      else if (actor.location == 7) {
        actor.location = 12;
      }
      else if (actor.location == 22) {
        actor.location = 28;
      }
        
    }
    if (action.equals("ADVANCE TO THE NEAREST RAILROAD. If UNOWNED, you may buy it from the Bank. If OWNED, pay owner twice the rental to which they are otherwise entitled.")) {
      if (actor.location == 36) {
        actor.money += 200;
        actor.location = 5;
      }
      else if (actor.location == 7) {
        actor.location = 15;
      }
      else if (actor.location == 22) {
        actor.location = 25;
      }
    }
    if (action.equals("ADVANCE TO ST. CHARLES PLACE. IF YOU PASS \"GO\" COLLECT $200.")) {
      if (actor.location == 36) {
        actor.money += 200;
      }
      else if (actor.location == 7) {
      }
      else if (actor.location == 22) {
        actor.money += 200;
      }
      actor.location = 11;
    }
    if (action.equals("BANK PAYS YOU DIVIDEND OF $50.")) {
      actor.money += 50;
    }
    if (action.equals("GET OUT OF JAIL FREE. This card may be kept until needed or traded.")) {
      actor.incrementJFC();
    }
    if (action.equals("GO BACK THREE SPACES.")) {
      actor.location -= 3;
    }
    if (action.equals("GO TO JAIL. GO DIRECTLY TO JAIL, DO NOT PASS \"GO\", DO NOT COLLECT $200.")) {
      actor.goToJail();
    }
    if (action.equals("MAKE GENERAL REPAIRS ON ALL YOUR PROPERTY: FOR EACH HOUSE PAY $25, FOR EACH HOTEL PAY $100.")) {
      actor.money = actor.money - (25 * actor.numOfHouses) - (100 * actor.numOfHotels);
    }
    if (action.equals("SPEEDING FINE $15.")) { 
      actor.money -= 15;
    }
    if (action.equals("TAKE A TRIP TO READING RAILROAD. IF YOU PASS \"GO\" COLLECT $200.")) {
      actor.money += 200;
      actor.location = 5;
    }
    if (action.equals("ADVANCE TO BOARDWALK.")) {
      actor.location = 39;
    }
    if (action.equals("YOUR BUILDING LOAN MATURES. COLLECT $150.")) {
      actor.money += 150;
    }
    if (action.equals("YOU HAVE BEEN ELECTED CHAIRMAN OF THE BOARD. PAY EACH PLAYER $50.")) {
      //action is in Game tab
    }  
  }
  
  // main method for choosing chances 
  public void getChanceCard(Player actor) {
    action = cards.remove(0);
    if (!(action.equals("GET OUT OF JAIL FREE. This card may be kept until needed or traded."))) {
      cards.add(action);
    }
    JOptionPane.showMessageDialog(frame, action);
    execute(actor, action);
  }
  
 
}

    