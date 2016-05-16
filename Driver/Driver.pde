import java.util.*;
PImage board;

void setup() {
  size(720, 720);
  board = loadImage("../Images/board.jpg");
  board.resize(720, 720);
  background(board);
  Player p = new Player("Player1", 0, "green");
  Player p2 = new Player("Player2", 1, "blue");
  
  p.draw();
  p2.draw();
}

void draw() {
}  