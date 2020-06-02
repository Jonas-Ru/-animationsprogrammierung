class Futter {

  float x;
  float y;
  float vx;
  float vy;
  float ax;
  float ay;
  color clr;

  Futter(float x, float y, float vx, float vy, float ax, float ay, color clr) {

    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
    this.ax = ax;
    this.ay = ay;
    this.clr = clr;
  }

  void draw() {

    pushStyle();
    fill(clr);
    rect(x, y, 30, 30);
    popStyle();
  }

  void update() {

    //vx = vx + ax;  
    x = x + vx;

    //vy = vy + ax;
    y = y + vy;
  }
}
