//This function draws the GAMEOVER screen.

void gameOver() {
  introAnimation.show();
  start.show();
  playSymbol(490, 385); //triangle in play button
  fill(white);
  textSize(fontsize);
  //Word 'animation'
  if (fontIncreasing == true) {
    fontsize = fontsize + 1;
  } else {
    fontsize = fontsize - 1;
  }

  if (fontsize == 100) {
    fontIncreasing = false;
  } else if (fontsize < 70) {
    fontIncreasing = true;
  }
  text("NICE TRY!", 500, 200 );
  if (start.clicked) {
    mode = MAPSELECT;
    lives = 10;
    money = 800;
  }
  textSize(50);
  text("play again?", 500, 300);
}
