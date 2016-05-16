public class Space{
  int location;
  int price;
  String name;
  boolean purchased; 
  boolean monopolized; 
  public Space(int space){
     location = space;
     purchased = false;
     monopolized = false;
  }
  public Space(int space,String name_){
    this(space);
    name = name_;
  }
}
  
 