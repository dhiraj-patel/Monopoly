import javax.swing.*;
public class Chest{
  public boolean finished;
  public Player player;
  private ArrayList<String> chestCards;     
  private String action;
  
  public Chest() {
    chestCards = new ArrayList<String>();
    chestCards.add("Advance to Go (Collect $200)");
    chestCards.add("Bank error in your favor – collect $75");
    chestCards.add("Doctor's fees – Pay $50");
    chestCards.add("Get out of jail free – this card may be kept until needed, or sold");
    chestCards.add("Go to jail – go directly to jail – Do not pass Go, do not collect $200");
    chestCards.add("It is your birthday Collect $10 from each player");
    chestCards.add("Grand Opera Night – collect $50 from every player for opening night seats");
    chestCards.add("Income Tax refund – collect $20");
    chestCards.add("Life Insurance Matures – collect $100");
    chestCards.add("Pay Hospital Fees of $100");
    chestCards.add("Pay School Fees of $50");
    chestCards.add("Receive $25 Consultancy Fee");
    chestCards.add("You are assessed for street repairs – $40 per house, $115 per hotel");
    chestCards.add("You have won second prize in a beauty contest– collect $10");
    chestCards.add("You inherit $100");
    chestCards.add("From sale of stock you get $50");
    chestCards.add("Holiday Fund matures - Receive $100");
    Collections.shuffle(chestCards);
    finished = false;
  }
  
  public void execute(Player actor, String action){
    if (action.equals("Advance to Go (Collect $200)")) {
      actor.setLocation(0);
      actor.setMoney(actor.getMoney() + 200);
    }
    if (action.equals("Bank error in your favor – collect $75")) {
      actor.setMoney(actor.getMoney()+75);
    }
    if (action.equals("Doctor's fees – Pay $50")) {
      actor.setMoney(actor.getMoney()-50);
    }
    if (action.equals("Get out of jail free – this card may be kept until needed, or sold")) {
      actor.incrementJFC();
    }
    if (action.equals("Go to jail – go directly to jail – Do not pass Go, do not collect $200")) {
      actor.goToJail();
    }
    if (action.equals("It is your birthday Collect $10 from each player")) {
      // JACKEY
    }
    if (action.equals("Grand Opera Night – collect $50 from every player for opening night seats")) {
      // JACKEY
    }
    if (action.equals("Income Tax refund – collect $20")) {
      actor.setMoney(actor.getMoney()+20);
    }
    if (action.equals("Life Insurance Matures – collect $100")) {
      actor.setMoney(actor.getMoney()+100);
    }
    if (action.equals("Pay Hospital Fees of $100")) {
      actor.setMoney(actor.getMoney()-100);
    }
    if (action.equals("Pay School Fees of $50")) {
      actor.setMoney(actor.getMoney()-50);
    }
    if (action.equals("Receive $25 Consultancy Fee")) {
      actor.setMoney(actor.getMoney()+25);
    }
    if (action.equals("You are assessed for street repairs – $40 per house, $115 per hotel")) {
      // JACKEY LMAO
    }
    if (action.equals("You have won second prize in a beauty contest– collect $10")) {
      actor.setMoney(actor.getMoney()+10);
    }
    if (action.equals("You inherit $100")) {
      actor.setMoney(actor.getMoney()+100);
    }
    if (action.equals("From sale of stock you get $50")) {
      actor.setMoney(actor.getMoney()+50);
    }
    if (action.equals("Holiday Fund matures - Receive $100")) {
      actor.setMoney(actor.getMoney()+100);
    }
  }
  public String getChestCard(){
    String removed = chestCards.remove(0);
    chestCards.add(removed);
    return removed;
  }
 
  public void run() { 
    //if ((player.location == 7)||(player.location == 22)||(player.location == 36)) {   
      JOptionPane.showMessageDialog(frame, getChestCard());
      execute(player,getChestCard());
    //}  
  }
}

    