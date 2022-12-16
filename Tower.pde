//A Tower is the player's main defense against the mobs.
//Towers are placed on the maps and then automatically
//act. There are 3 kinds of towers (but you can make more!)

//Gun Tower: These towers shoot bullets that fly across
//           the screen and do damage to mobs.

//AoE Tower: These towers place AoE_Rings that deal damage
//           to all mobs in the ring.

//Sniper Tower: These towers automatically target the first
//              mob no matter where they are on the scren.

class Tower {

  final int PLACING = 0; //moving the tower
  final int PLACED = 1; //tower is now still where you placed it

  final int Regular = 1; //one from each side
  final int AoE = 2; //radius damage
  final int Sniper = 3; //snipes first mob

  int towerType;

  float x, y;
  int cooldown, threshold; //counts frames between when bullets are fired
  int towerMode;

  Tower(float _x, float _y, int c, int th, int _t) {
    x = _x;
    y = _y;
    cooldown = c;
    threshold = th;
    towerMode = PLACING;
    towerType = _t;
  }

  void show() {
    stroke(black);
    strokeWeight(4);
    fill(blue);
    if (towerMode == PLACED) {
      if (towerType == Regular) showRegularTower();
      if (towerType == AoE) showAoETower();
      if (towerType == Sniper) showSniperTower();
    } else if (towerMode == PLACING) {
      if (towerType == Regular) {
        fill(green);
        square(mouseX, mouseY, 40);
      } else if (towerType == AoE) {
        fill(white);
        circle(mouseX, mouseY, 40);
      } else if (towerType == Sniper) {
        fill(blue);
        triangle(mouseX, mouseY, mouseX + 15, mouseY - 30, mouseX + 30, mouseY);
      }
      if (mousePressed && checkPerimeter(mouseX, mouseY)) {
        towerMode = PLACED;
        x = mouseX;
        y = mouseY;
      }
    }
  }
  void showRegularTower() {
    fill(green);
    square(x, y, 40); //reg tower = square
  }

  void showAoETower() {
    fill(white);
    circle(x, y, 40); //AoE
  }

  void showSniperTower() {
    fill(blue);
    triangle(x, y, x + 15, y - 30, x + 30, y); //Sniper
  }

  void act() {
    if (mobs.size() > 0) {
      cooldown++;
      if (cooldown >= threshold) {
        if (towerType == Regular) {
          cooldown = -40;
          bullets.add(new Bullet(x, y, 0, -10)); //up
          bullets.add(new Bullet(x, y, 0, 10)); //down
          bullets.add(new Bullet(x, y, -10, 0)); //left
          bullets.add(new Bullet(x, y, 10, 0)); //right
        } else if (towerType == Sniper) {
          cooldown = -10;
          //targets first mob in array list
          //line(x, y, mobs.x, mobs.y); //sniper line
          Mob myMob =  mobs.get(0);

          myMob.hp--;
        } else if (towerType == AoE) {
          cooldown = -10;
          ring.add(new AoE_Ring(x, y, 200));
        }
      }
    }
  }

  //checks if tower placement is within game perimeter
  boolean checkPerimeter(int x, int y) {
    if (y < height && y > 0 && x < 750 && x > 0) {
      return true;
    }
    return false;
  }

  //returns tower type
  int towerType() {
    return towerType;
  }

  //returns towerMode
  int towerMode() {
    return towerMode;
  }
}
