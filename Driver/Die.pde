import java.util.*;
class Die {
  Random r;
  int[] setOfDice;
  PFont font;
  int doubleCount;
  
  Die() {
    r = new Random();
    setOfDice = new int[2];
    font = createFont("../Fonts/BebasNeue.otf", 24, true);
    doubleCount = 0;
  }
  
  void roll() {
    for (int i = 0; i < 2; i ++) {
      //setOfDice[i] = r.nextInt(6) + 1;
      setOfDice[i] = 1;
    }
  }
  
  int getTotal() {
    int total = 0;
    for (int i = 0; i < 2; i ++) {
      total += setOfDice[i];
    }
    return total;
  }
  
  boolean isDouble() {
    return setOfDice[0] == setOfDice[1];
  }
    
  void reset() {
    for (int i = 0; i < 2; i ++) {
      setOfDice[i] = 0;
    }
  }
  
  void draw() {
    fill(255, 255, 255);
    rect(320, 330, 80, 30);
    textFont(font);
    textSize(30);
    fill(0, 0, 0);
    text(Integer.toString(setOfDice[0]), 335, 353);
    text(Integer.toString(setOfDice[1]), 375, 353);
  }
}