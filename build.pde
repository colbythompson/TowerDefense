//This function draws the BUILD screen

void build() {
  mapchoice();

  originalBackground();// sets up taskbar, money/ live display

  textSize(70);
  fill(white);
  text("BUILD MODE", 400, 90);

  //Coords on map
  fill(black);
  textSize(25);
  text(mouseX + "," +mouseY, mouseX, mouseY-40);

  handleBuildClicks();
  animateThings();

  //build mode buttons
  buyRegularTower.show();
  buySniperTower.show();
  buyRingTower.show();
  play.show();

  //money display
  moneyDisplay(855, 620);


  //font color
  fill(white);

  //prices
  text("$5", 865, 250); //gun
  text("$25", 865, 375 ); //AOE
  text("$50", 865, 500); //sniper


  //title
  textSize(65);
  text("TOWERS", 865, 115);
}

void handleBuildClicks() {
  if (play.clicked) {
    mode = PLAY;
  }
  if (towers.size() == 0 || towers.get(towers.size() - 1).towerMode() == 1) {
    if (buyRegularTower.clicked && money >= 5) {
      towers.add(new Tower(0, 0, 0, 30, 1));
      money = money - 5;
    } else if (buyRingTower.clicked && money >= 25) {
      money = money - 25;
      towers.add(new Tower(0, 0, 0, 60, 2));
    } else if (buySniperTower.clicked && money >= 50) {
      towers.add(new Tower(0, 0, 0, 60, 3));
      money = money - 50;
    }
  }
}
