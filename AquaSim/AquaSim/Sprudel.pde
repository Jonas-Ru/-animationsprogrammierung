class Sprudel {
  ArrayList<Blase> blasen;

  PShape sprudelShape;

  Sprudel(int n) {
    blasen = new ArrayList<Blase>();
    sprudelShape = createShape(PShape.GROUP);

    for (int i = 0; i < n; i++) {
      Blase b = new Blase();
      blasen.add(b);
      sprudelShape.addChild(b.getShape());
    }
  }

  void update() {
    for (Blase b : blasen) {
      b.update();
    }
  }

  void setEmitter(float x, float y) {
    for (Blase b : blasen) {
      if (b.isDead()) {
        b.rebirth(x, y);
      }
    }
  }

  void display() {

    shape(sprudelShape);
  }
}
