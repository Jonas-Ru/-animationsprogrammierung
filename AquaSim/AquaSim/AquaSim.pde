import processing.sound.*;
SoundFile file;
SoundFile tapsound;

float x = 0;
Schwarmfisch[] s1;
Schwarmfisch[] s2;
int anz = int(random(8, 20));
int anz2 = int(anz*0.7);

Sprudel s;
PImage blase;

PImage h;
PImage m;
PImage v;

int value =0;

int xLoc;
int yLoc;
float speed = 1;
int richtung = 0;

PImage links;
PImage rechts;

PImage strg;
PImage strg1;
int strgb = 0;

Sprudel sm;
Sprudel sp1;
Sprudel sp2;

Tap tap;

boolean okay = true;

void setup() {
  
  size(1920, 1080, P2D);
  
//Schwarm 
  s1 = new Schwarmfisch[anz];
  s2 = new Schwarmfisch[anz2];
  initSchwf();

//Bilder
  h = loadImage("H.png");
  m = loadImage("M.png");
  v = loadImage("V.png");

  links = loadImage("Betta.png");
  rechts = loadImage("Betta_1.png");

//Sprudel
  blase = loadImage("blase.png");
  s = new Sprudel(10000);
  sm = new Sprudel(500);
  sp1 = new Sprudel(100);
  sp2 = new Sprudel(100);

  tap = new Tap(300);
  
  hint(DISABLE_DEPTH_MASK);
  
//Steuerung
  strg = loadImage("steuerung.png");
  strg1 = loadImage("steuerung_1.png");
  
//StartPosFisch
  xLoc = int(900);
  yLoc = int(800);
  
//soundfiles
  file = new SoundFile(this, "asmr.mp3");
  file.loop();
  
  tapsound = new SoundFile(this,"tapsound.mp3");
  tapsound.amp(0.1);
  tapsound.cue(0.1);
}

void initSchwf() {
  for (int i =0; i < anz; i++) {
    s1[i] = new Schwarmfisch(int(random(30, 200)));
  }

  for (int i =0; i < anz2; i++) {
    s2[i] = new Schwarmfisch(int(random(30, 200)));
  }
}

void draw() {

  noCursor();

  // background(#eeeeee);

  image(h, 0, 0); //Hintergrund

  //  rect(300,700,30,30);

  for (int i =0; i < anz; i++) {
    s1[i].draw();
  }

  int xs = int(random(100, 600));

  sp1.setEmitter(xs, 890);
  sp1.update();
  sp1.display();

  image(m, 0, 0);  //Mitte

  for (int i =0; i < anz2; i++) {
    s2[i].draw();
  }

  s.setEmitter(1803, 890);
  s.update();
  s.display();

  int xs2 = int(random(1200, 1800));

  sp2.setEmitter(xs2, 890);
  sp2.update();
  sp2.display();


  image(v, 0, 0);  //Vordergrund

  if (keyPressed) {
    keyPressed();
  }

  drawFisch();

  if (strgb == 1) {
    image(strg, 0, 0);
  }
  if (strgb == 0) {
    image(strg1, 0, 0);
  }
  
  tap.update();
  tap.display();


  sm.setEmitter(mouseX, mouseY);
  sm.update();
  sm.display();
}





void drawFisch() {

  float test = sin(xLoc*0.3)+yLoc;

  if (richtung == 1) {

    pushStyle();
    imageMode(CENTER);
    image(links, xLoc, test, 300, 120);
    popStyle();
  }

  if (richtung == 0) {

    pushStyle();
    imageMode(CENTER);
    image(rechts, xLoc, test, 300, 120);
    popStyle();
  }
}

//key released oder framecount
void keyPressed() {
   
  if (key == CODED) {
    if (keyCode == LEFT) {
      if (xLoc >= 220) {
        xLoc -= speed;
      }
      richtung = 0;
    }
    if (keyCode == RIGHT) {
      if (xLoc <= 1700) {
        xLoc += speed;
      }
      richtung = 1;
    }
    if (keyCode == UP) {
      if (yLoc >= 300) {
        yLoc -= speed;
      }
    }
    if (keyCode == DOWN) {
      if (yLoc <= 900) {
        yLoc += speed;
      }
    }
  } 

  if (key == TAB && okay) {

    if (strgb == 0) {
      strgb = 1;
    } 
    else{strgb = 0;
    }
    
    okay = false;
    
  }
}

void keyReleased() {
  if (key == TAB){
  okay = true;
  }//Only when the key is released the boolean is set to true again
}

void mousePressed() {

  tap.setEmitter(mouseX, mouseY);  
  tapsound.play();
}
