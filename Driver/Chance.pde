public class Chance {
  private ArrayList<String>cards;     
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
    // Constructor should generate a random chance card and display it as a gui message. ....
    // there are 17 possible chance cards  
  }
  public String getRandomChanceCard(){
    int cardNum = (int)(Math.random()*17);
    String chosenCard = cards.get(cardNum);
    return chosenCard;
  }
}