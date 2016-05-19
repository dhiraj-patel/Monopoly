class txtButton {
  int x, y;
  String text;
  int size;
  color nColor;
  color overColor;
  boolean over;
 
  txtButton(int x, int y, String text, int size, color nc, color oc) {
    this.x = x;
    this.y = y;
    this.text = text;
    nColor = nc;
    overColor = oc;
    this.size = size;
  }
 
  void draw() {
    //colorMode(HSB);
    textAlign(CENTER);
    textSize(size);
    over();
    if (over) {
      fill(overColor);
    }
    else {
      fill(nColor);
    }
    text(text, x, y);
  }
 
  void over() {
    if (mouseX >= x - 130  && mouseX <= x + textWidth(text) - 50 && mouseY <= y + 35 && mouseY >= y - size - 35) {
      over = true;
    }
    else {
      over = false; 
    }
  }
}