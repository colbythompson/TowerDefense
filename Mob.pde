//Mobs are the monsters that the towers defend against.
//Mobs spawn at the start and then move across the map,
//changing direction when they hit a node. If they get
//to the end of the map, they deal damage to the player.
//Once the player has no more health, it's game over!

class Mob {

  float x, y, vx, vy, d; //vx, vy = speed along the axis
  int hp, maxhp;
  int value;
  color fillColor, strokeColor;
  float speed;

  Mob (float _x, float _y, float _vx, float _vy) {
    x = _x;
    y = _y;
    vx = _vx;
    vy = _vy;
    d = 40;
    hp = 3;
    maxhp = 3;
    value = 1;
    fillColor = purple;
    strokeColor = white;
    speed = 2;
  }

  void show() {
    stroke(strokeColor);
    fill(fillColor);
    strokeWeight(3);
    circle(x, y, d);
  }

  void act() {
    x = x + vx*speed;
    y = y + vy*speed;

    int i = 0;
    //if map 1 is selected
    if (map1.clicked) {
      while (i < map1nodes.length) {
        if (dist(map1nodes[i].x, map1nodes[i].y, x, y)  < 4) {
          vx = map1nodes[i].dx;
          vy = map1nodes[i].dy;
        }
        i++;
      }
    }
    //if map 2 is selected
    if (map2.clicked) {
      while (i < map2nodes.length) {
        if (dist(map2nodes[i].x, map2nodes[i].y, x, y)  < 4) {
          vx = map2nodes[i].dx;
          vy = map2nodes[i].dy;
        }
        i++;
      }
    }
    i = 0;
    while (i < bullets.size()) {
      Bullet myBullet = bullets.get(i);
      if (dist(myBullet.x, myBullet.y, x, y) < d/2 +myBullet.d/2) {
        hp = hp - 1;
        bullets.remove(i);
      }
      i++;
    }
    i = 0;
    while (i < ring.size()) {
      AoE_Ring myRing  = ring.get(i);
      if (dist(myRing.x, myRing.y, x, y) < d/2 +myRing.r/2) {
        myRing.show();
        hp = hp - 1;
        ring.remove(i);
      }
      i++;
    }
  }
  void healthbar() {
    rectMode(CORNER);
    noStroke();
    fill(black);
    rect(x-27, y-(d+10)-2, 54, 24);//background
    fill(purple);
    rect(x-25, y-(d+10), 50, 20);
    fill(pink);
    rect(x-25, y-(d+10), hp*50/maxhp, 20);
    rectMode(CENTER);
  }
}
