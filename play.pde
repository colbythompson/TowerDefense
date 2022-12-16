//This function draws the PLAY screen

void play() {

  mapchoice();
  handleButtonClicks(); //next wave
  animateThings();
  buildMode(); //allows build mode to be accessible
  originalBackground(); // sets up taskbar, money/ live display

  //money display
  moneyDisplay(855, 750);

  //next wave
  nextWave.show();
  fill(white);
  text("WAVE #" + waveNum, 860, 40);

  textSize(30);
  text("Next Wave", 865, 155);

  textSize(30);
  text("New Tower", 865, 290);


  //build button
  build.show();


  //GAMEOVER
  if (lives == 0) {
    mode = GAMEOVER;
  }
}

void Rect(int x, int y, int w, int h, color f) { //Function for Rectangles
  fill(f);
  stroke(f);
  rect(x, y, w, h);
}

void animateThings() {
  int i = 0;
  while (i < mobs.size()) {
    Mob myMob = mobs.get(i);
    myMob.act();
    myMob.show();
    myMob.healthbar();
    if (myMob.hp <= 0 ) {
      mobs.remove(i);
      money = money + 5;
    }
    if (myMob.x == 770) {
      lives = lives - 1;
      mobs.remove(i);
    }
    i++;
  }
  if (lives == 0) {

    mode = GAMEOVER;
  }

  i = 0;
  while (i < towers.size()) {
    Tower myTower = towers.get(i);
    if (mobs.size() > 0) myTower.act();
    myTower.show();
    i++;
  }

  i = 0;
  while (i < bullets.size()) {
    Bullet myBullet = bullets.get(i);
    myBullet.act();
    myBullet.show();
    i++;
  }
}


void handleButtonClicks() {
  if (nextWave.clicked && mobs.size() == 0) {
    waveNum = waveNum + 1;
    int numMobsSpawned = 0;
    int x = 0;
    while (numMobsSpawned < waveNum) {
      mobs.add(new Mob(0 + x, 400, 1, 0));
      x = x - 50;
      numMobsSpawned++;
    }
    numMobsSpawned = 0;
    x = 0;
    if (waveNum % 3 == 0) {
      while (numMobsSpawned < waveNum/3) {
        mobs.add(new ChonkyMob(0 + x, 400, 1, 0));
        x = x - 100;
        numMobsSpawned++;
      }
    }
    numMobsSpawned = 0;
    x = 0;
    if (waveNum % 4 == 0) {
      while (numMobsSpawned < waveNum/3) {
        mobs.add(new SpeedyMob(0 + x, 400, 1, 0));
        x = x - 100;
        numMobsSpawned++;
      }
    }
  }
}


void buildMode() {
  if (build.clicked) {
    mode = BUILD;
  }
}

void moneyDisplay(int x, int y) {
  text("$$: " +  money, x, y);
}

void livesDisplay(int x, int y) {
  text("LIVES: " + lives, x, y);
}
