class Schwarmfisch {

  PImage img;
  PImage imgr;

  float x;
  float y;
  float ampl;
  float h;
  int bool;
  float xa;
  float ab;

  Schwarmfisch(float x) {
    this.x = x;
    this.y = 0;
    this.ampl = random(15, 25);
    this.h = random(500, 800);
    this.bool = 0;
    this.xa = x;
    this.ab = random(250, 330);


    img = loadImage("neon.png");
    imgr = loadImage("neon_1.png");
  }

  void draw() {
    fill(#000000);

    y = sin(x * 0.5);
    y = y * ampl + h;


    if (x > int(width-ab)) {
      bool = 1;
    }

    if (x < int(xa)) {
      bool = 0;
    }



    if (bool == 0) {

      //println("bool = 0");

      x = x + random(0.01, 0.1);

      image(img, x, y, 78, 78);
    }

    if (bool == 1) {

      //println("bool = 1");

      x = x - random(0.01, 0.1);

      image(imgr, x, y, 78, 78);
    }

    //image(img, x, y, 50, 20);
  }
}
