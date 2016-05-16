import java.util.*;
PImage board;

void setup() {
  size(1000, 1000);
  board = loadImage("../Images/board.jpg");
  board.resize(1000, 1000);
  background(board);
  Player p = new Player("Player1", 0, "green");
  Player p2 = new Player("Player2", 1, "blue");
  
  p.draw();
  p2.draw();
}

void draw() {
}  