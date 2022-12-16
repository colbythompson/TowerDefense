//Some classes place AoE rings on the map. The AoE ring
//hurts all mobs in the ring. The ring only lasts for a
//short period of time.

class AoE_Ring {
  float x, y, r; //x, y, radius
  int timer, threshold;

  AoE_Ring (float _x, float _y, float _r) {
    x = _x;
    y = _y;
    r = _r;
    threshold = 400;
    timer =  0;
  }

  void show() {
    stroke(white, 170);
    fill(blue, 140);
    circle(x, y, r);
  }
}
