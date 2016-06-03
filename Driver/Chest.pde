import javax.swing.*;
public class Chest {
  private ArrayList<String> cards;     
  private String action;
  
  public Chest() {
    cards = new ArrayList<String>();
    cards.add("ADVANCE TO GO. (COLLECT $200)");
    cards.add("BANK ERROR IN YOUR FAVOR. COLLECT $200.");
    cards.add("DOCTOR'S FEES. PAY $50.");
    cards.add("GET OUT OF JAIL FREE. This card may be kept until needed or traded.");
    cards.add("GO TO JAIL. GO DIRECTLY TO JAIL, DO NOT PASS \"GO\", DO NOT COLLECT $200.");
    cards.add("IT IS YOUR BIRTHDAY. COLLECT $10 FROM EVERY PLAYER.");
    cards.add("INCOME TAX REFUND. COLLECT $20.");
    cards.add("LIFE INSURANCE MATURES. COLLECT $100.");
    cards.add("PAY HOSPITAL FEES OF $100.");
    cards.add("PAY SCHOOL FEES OF $50.");
    cards.add("RECEIVE $25 CONSULTANCY FEE.");
    cards.add("YOU ARE ASSESSED FOR STREET REPAIRS: $40 PER HOUSE, $115 PER HOTEL.");
    cards.add("YOU HAVE WON SECOND PRIZE IN A BEAUTY CONTEST. COLLECT $10.");
    cards.add("YOU INHERIT $100.");
    cards.add("FROM SALE OF STOCK YOU GET $50.");
    cards.add("HOLIDAY FUND MATURES. RECEIVE $100.");
    Collections.shuffle(cards);
  }
  
  public void execute(Player actor, String action) {
    if (action.equals("ADVANCE TO GO. (COLLECT $200)")) {
      actor.location = 0;
      actor.money += 200;
    }
    if (action.equals("BANK ERROR IN YOUR FAVOR. COLLECT $200.")) {
      actor.money += 200;
    }
    if (action.equals("DOCTOR'S FEES. PAY $50.")) {
      actor.money -= 50;
    }
    if (action.equals("GET OUT OF JAIL FREE. This card may be kept until needed or traded.")) {
      actor.incrementJFC();
    }
    if (action.equals("GO TO JAIL. GO DIRECTLY TO JAIL, DO NOT PASS \"GO\", DO NOT COLLECT $200.")) {
      actor.goToJail();
    }
    if (action.equals("IT IS YOUR BIRTHDAY. COLLECT $10 FROM EVERY PLAYER.")) {
    }
    if (action.equals("INCOME TAX REFUND. COLLECT $20.")) {
      actor.money += 20;
    }
    if (action.equals("LIFE INSURANCE MATURES. COLLECT $100.")) {
      actor.money += 100;
    }
    if (action.equals("PAY HOSPITAL FEES OF $100.")) {
      actor.money -= 100;
    }
    if (action.equals("PAY SCHOOL FEES OF $50.")) {
      actor.money -= 50;
    }
    if (action.equals("RECEIVE $25 CONSULTANCY FEE.")) {
      actor.money += 25;
    }
    if (action.equals("YOU ARE ASSESSED FOR STREET REPAIRS: $40 PER HOUSE, $115 PER HOTEL.")) {
      actor.money = actor.money - (40 * actor.numOfHouses) - (115 * actor.numOfHotels);
    }
    if (action.equals("YOU HAVE WON SECOND PRIZE IN A BEAUTY CONTEST. COLLECT $10.")) {
      actor.money += 10;
    }
    if (action.equals("YOU INHERIT $100.")) {
      actor.money += 100;
    }
    if (action.equals("FROM SALE OF STOCK YOU GET $50.")) {
      actor.money += 50;
    }
    if (action.equals("HOLIDAY FUND MATURES. RECEIVE $100.")) {
      actor.money += 100;
    }
  }
 
  public void getChestCard(Player actor) {
    action = cards.remove(0);
    if (!(action.equals("Get out of jail free – this card may be kept until needed, or sold"))) {
      cards.add(action);
    }
    JOptionPane.showMessageDialog(frame, action);
    execute(actor, action);
  }  
 
}

    