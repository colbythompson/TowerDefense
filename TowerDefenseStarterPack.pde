//Tower Defense Game
//COLBY THOMPSON
//Programming 12

// ================ GLOBAL VARIABLES =================

final int INTRO     = 0;
final int MAPSELECT = 1;
final int PLAY      = 2;
final int BUILD     = 3;
final int GAMEOVER  = 4;
int mode;
int waveNum = 0;
int money = 50;
int lives = 3;
int fontsize = 50;
int taskbarx1 = 900; //size of taskbar 
int taskbary1 = 400;
int taskbarx2 = 300;
int taskbary2 = 800;
boolean fontIncreasing;


//Pallette
color white = #ffffff;
color black = #000000;
color red = #d11149;
color orange = #f06305;
color yellow = #fadf7f;
color green = #adc178;
color blue = #8ecae6;
color purple = #9d80cb;
color pink = #ffc8dd;
color beige = #bb9457;

//Mouse & Keyboard interaction variables
boolean mouseReleased;
boolean wasPressed;

//Buttons
Button start;
Button nextWave;
Button build;
Button play; //play again after entering build mode

//tower Buttons
Button buyRegularTower; //purchase new tower
Button buySniperTower;
Button buyRingTower;

//map select buttons
Button map1;
Button map2;

//Collections of objects
Node[] map1nodes, map2nodes;
ArrayList<Mob> mobs;
ArrayList<Tower> towers;
ArrayList<Bullet> bullets;
ArrayList<AoE_Ring> ring;

//Images and Gifs
Gif introAnimation;
PImage map1Pic;
PImage map2Pic;


//Fonts
PFont AmericanCaptain;

// ===================== SETUP =========================

void setup() {
  map1Pic = loadImage("Screenshot_20221121_010629.png");
  map2Pic = loadImage("Screenshot_20221121_010541.png");
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  AmericanCaptain = createFont("AmericanCaptain.otf", 200); //Custom font
  size(1000, 800);
  initializeModes();
  initializeVariables();
  makeButtons();
  makeNodes();
  fontIncreasing = true;
}

void initializeModes() {
  //set up the default mode for things

  textFont(AmericanCaptain);
  mode = INTRO;
}

void initializeVariables() {
  //Load Images & Gifs
  introAnimation = new Gif("gif/frame_0", "_delay-0.03s.gif", 100, 1, width/2, height/2, width, height);
  //Load Fonts

  //Create Collections of Objects
  mobs = new ArrayList<Mob>(waveNum);
  towers = new ArrayList<Tower>();
  bullets = new ArrayList<Bullet>();
  ring = new ArrayList<AoE_Ring>();
}

void makeButtons() {
  //INTRO - Start
  start = new Button("", width/2, height/2, 200, 100, white, blue);

  //PLAY - Next Wave, To Build Mode
  nextWave = new Button(">>", 865, 210, 150, 80, white, blue);
  build = new Button("BUILD", 865, 345, 150, 80, white, blue);
  map1 = new Button(map1Pic, 200, height/2, 400, 350, black, black);
  map2 = new Button(map2Pic, 800, height/2, 400, 350, black, black);


  //BUILD - To play mode, Buy Sniper, Buy Gun, Buy AoE
  play = new Button ("PLAY", 865, 690, 150, 75, white, blue);
  buyRegularTower = new Button("Gun", 865, 195, 150, 75, white, green);
  buySniperTower = new Button("Sniper", 865, 445, 150, 75, white, red);
  buyRingTower = new Button("AOE", 865, 320, 150, 75, white, orange);


  //GAMEOVER - Reset
}

void makeNodes() {
  //Plot the nodes on the map
  map1nodes = new Node[8];

  map1nodes[0] = new Node(350, 400, 0, 1);
  map1nodes[1] = new Node(350, 525, -1, 0);
  map1nodes[2] = new Node(225, 525, 0, -1);
  map1nodes[3] = new Node(225, 225, 1, 0);
  map1nodes[4] = new Node(400, 225, 0, -1);
  map1nodes[5] = new Node(400, 150, 1, 0);
  map1nodes[6] = new Node(550, 150, 0, 1);
  map1nodes[7] = new Node(550, 400, 1, 0);

  map2nodes = new Node[12];
  map2nodes[0] = new Node(300, 400, 0, -1);
  map2nodes[1] = new Node(300, 275, -1, 0);
  map2nodes[2] = new Node(175, 275, 0, 1);
  map2nodes[3] = new Node(175, 575, 1, 0);
  map2nodes[4] = new Node(300, 575, 0, 1);
  map2nodes[5] = new Node(300, 700, 1, 0);
  map2nodes[6] = new Node(550, 700, 0, -1);
  map2nodes[7] = new Node(550, 575, 1, 0);
  map2nodes[8] = new Node(675, 575, 0, -1);
  map2nodes[9] = new Node(675, 450, -1, 0);
  map2nodes[10] = new Node(550, 450, 0, -1);
  map2nodes[11] = new Node(550, 325, 1, 0);
}


// ===================== DRAW ===========================

void draw() {
  click();
  if (mode == INTRO) {
    intro();
  } else if (mode == MAPSELECT) {
    map_select();
  } else if (mode == PLAY) {
    play();
  } else if (mode == BUILD) {
    build();
  } else if (mode == GAMEOVER) {
    gameOver();
  }
}
