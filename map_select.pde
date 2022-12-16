int map;
Node[] nodes;
void map_select() {
  background(black);
  fill(white);
  textSize(70);
  text("MAP SELECT", 500, 140);
  textSize(50);
  text("Map 1", 200, 180);
  text("Map 2", 800, 180);
  map1.show();
  map2.show();
  if (map1.clicked) {
    map = 1;
    nodes = map1nodes;
    mode = PLAY;
    map1show();
  }

  if (map2.clicked) {
    map = 2;
    nodes = map2nodes;
    mode = PLAY;
    map2show();
  }
}

void map1show() {
  background(green);

  //line
  stroke(beige) ;
  strokeWeight(40);
  line(0, 400, 350, 400);
  line(350, 400, 350, 525);
  line(350, 525, 225, 525);
  line(225, 525, 225, 225);
  line(225, 225, 400, 225);
  line(400, 225, 400, 150);
  line(400, 150, 550, 150);
  line(550, 150, 550, 400);
  line(550, 400, 770, 400);
}
void map2show() {
  background(blue);

  //line
  stroke(white) ;
  strokeWeight(40);
  line(0, 400, 300, 400);
  line(300, 400, 300, 275);
  line(300, 275, 175, 275);
  line(175, 275, 175, 575);
  line(175, 575, 300, 575);
  line(300, 575, 300, 700);
  line(300, 700, 425, 700);
  line(425, 700, 550, 700);
  line(550, 700, 550, 575);
  line(550, 575, 675, 575);
  line(675, 575, 675, 450);
  line(675, 450, 550, 450);
  line(550, 450, 550, 325);
  line(550, 325, 770, 325);
}

void mapchoice() {
  if (map == 1) {
    nodes = map1nodes;
    map1show();
  }
  if (map == 2) {
    nodes = map2nodes;
    map2show();
  }
}
