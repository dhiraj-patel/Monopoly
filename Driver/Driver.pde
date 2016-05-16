import java.util.*;
PImage board;

void setup() {
  size(1000, 1000);
  board = loadImage("../Images/board.jpg");
  board.resize(1000, 1000);
  background(board);
  Player p = new Player("test");
  
  p.display();
}

void draw(){
}  