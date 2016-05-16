public class Utilities extends Space{
  String whatUtility;
  int diceroll;
  public Utilities(){
    if(location == 12){
      super(12);
      whatUtility = "electricCompany";
      price = 150;
    }
    else if(location == 28){
      super(28);
      whatUtility = "waterWorks";
      price = 150;
    }
  }
}
    
      