class Tap {
  ArrayList<TapBlase> blasen;

  PShape sprudelShape;

  Tap(int n) {
    blasen = new ArrayList<TapBlase>();
    sprudelShape = createShape(PShape.GROUP);

    for (int i = 0; i < n; i++) {
      TapBlase b = new TapBlase();
      blasen.add(b);
      sprudelShape.addChild(b.getShape());
    }
  }

  void update() {
    for (TapBlase b : blasen) {
      b.update();
    }
  }

  void setEmitter(float x, float y) {
    for (TapBlase b : blasen) {

      b.rebirth(x, y);
    }
  }

  void display() {

    shape(sprudelShape);
  }
}
