//This function draws the INTRO screen.

void intro() {
  introAnimation.show();
  start.show();
  playSymbol(490, 385); //triangle in play button
  if (start.clicked) {
    mode = MAPSELECT;
  }

  fill(white);
  textSize(fontsize);
  //Word 'animation'
  if (fontIncreasing == true) {
    fontsize = fontsize + 2;
  } else {
    fontsize = fontsize - 2;
  }

  if (fontsize == 100) {
    fontIncreasing = false;
  } else if (fontsize < 70) {
    fontIncreasing = true;
  }
  text("TOWER DEFENSE", 500, 200 );
}

void playSymbol(int x, int y) {
  //Play symbol
  fill(blue);
  stroke(blue);
  triangle(x, y, x + 30, y + 20, x, y + 40);
}
