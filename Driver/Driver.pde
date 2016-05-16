import java.util.*;
PImage board;

void setup(){
  ///////////////////////////////////////////////////////////////////////////
  //   SETUP THE BOARD:
  ///////////////////////////////////////////////////////////////////////////
  size(600,600);
  board = loadImage("../Images/board.jpg");
  board.resize(600,600);
  background(board);
  Player p = new Player("test");
  
  p.display();
  
  
  
}

// 50 sapce differnece
void draw(){
  

}  