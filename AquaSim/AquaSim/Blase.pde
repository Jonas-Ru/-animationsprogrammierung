class Blase {

  PVector velocity;
  float lifespan;

  PShape part;
  float partSize;

  PVector gravity = new PVector(0, -0.1);


  Blase() {
    partSize = random(0.01, 5);
    part = createShape();
    part.beginShape(QUAD);
    part.noStroke();
    part.texture(blase);
    part.normal(0, 0, 1);
    part.vertex(-partSize/2, -partSize/2, 0, 0);
    part.vertex(+partSize/2, -partSize/2, blase.width, 0);
    part.vertex(+partSize/2, +partSize/2, blase.width, blase.height);
    part.vertex(-partSize/2, +partSize/2, 0, blase.height);
    part.endShape();

    rebirth(width/2, height/2);
    lifespan = random(255);
  }

  PShape getShape() {
    return part;
  }

  void rebirth(float x, float y) {
    float a = random(PI);
    float speed = random(0.01, 0.9);
    velocity = new PVector(cos(a), sin(a));
    velocity.mult(speed);
    lifespan = 255;   
    part.resetMatrix();
    part.translate(x, y);
  }

  boolean isDead() {
    if (lifespan < 0) {
      return true;
    } else {
      return false;
    }
  }


  public void update() {
    lifespan = lifespan - 1;
    velocity.add(gravity);

    part.setTint(color(255, lifespan));
    part.translate(velocity.x, velocity.y);
  }
}
