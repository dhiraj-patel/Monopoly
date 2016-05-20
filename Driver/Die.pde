import java.util.*;
class Die {
  Random r;
  int[] setOfDice;
  PFont font;
  
  Die() {
    r = new Random();
    setOfDice = new int[2];
    font = createFont("../Fonts/BebasNeue.otf", 24, true);
  }
  
  int[] roll() {
    for (int i = 0; i < 2; i ++) {
      setOfDice[i] = r.nextInt(6) + 1;
    }
    return setOfDice;
  }
    
  
  void draw() {
    fill(255, 255, 255);
    rect(320, 330, 80, 30);
    textFont(font);
    textSize(30);
    fill(0, 0, 0);
    text(Integer.toString(setOfDice[0]), 340, 355);
    text(Integer.toString(setOfDice[1]), 380, 355);
  }
}