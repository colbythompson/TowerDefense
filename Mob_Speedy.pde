class SpeedyMob extends Mob {

  SpeedyMob(float _x, float _y, float _vx, float _vy) {
    super(_x, _y, _vx, _vy);
    d = 40;
    maxhp = 3;
    hp = maxhp;
    value = 5;
    fillColor = red;
    strokeColor = black;
    speed = 3;
  }
}
