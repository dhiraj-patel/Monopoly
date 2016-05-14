//Left click to random face.
//Right click to roll the dice, then left to stop.
 
int diceSize = 25;

void setup() {
  frameRate(10);
  size(1200,1200);
  noLoop();
}
 
void draw() {
  //if(rollDice){
      createRollButton();
      diceroll();
      //}
  //dice
}
void createRollButton(){
    rect(400,800,900,1100);
   // fill(204, 102, 0);
    if(mousePressed){
        if(mouseX>width/2+50 && mouseX<width/2+50+diceSize && mouseY > height/2+50 
        && mouseY < height/2+50+diceSize){
            println("this worked");
            fill(204, 102, 0);
        }
    }
}
        
    
void diceroll(){
  noStroke();
  fill(#FFF3D6);
  rectMode(CENTER);
  rect(width/2, height/2, diceSize, diceSize, diceSize/5);
  //dots
  fill(50);
  int side = int(random(1, 7));
  if (side == 1 || side == 3 || side == 5)
    ellipse(width/2, height/2, diceSize/5, diceSize/5);
  if (side == 2 || side == 3 || side == 4 || side == 5 || side == 6) {
    ellipse(width/2 - diceSize/4, height/2 - diceSize/4, diceSize/5, diceSize/5);
    ellipse(width/2 + diceSize/4, height/2 + diceSize/4, diceSize/5, diceSize/5);
  }
  if (side == 4 || side == 5 || side == 6) {
    ellipse(width/2 - diceSize/4, height/2 + diceSize/4, diceSize/5, diceSize/5);
    ellipse(width/2 + diceSize/4, height/2 - diceSize/4, diceSize/5, diceSize/5);
  }
  if (side == 6) {
    ellipse(width/2, height/2 - diceSize/4, diceSize/5, diceSize/5);
    ellipse(width/2, height/2 + diceSize/4, diceSize/5, diceSize/5);
  }
  if (mousePressed && mouseButton == LEFT){
    noLoop();  
  }
}

void mousePressed(){
  loop();
}