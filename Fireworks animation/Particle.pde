class Particle {
  /*
  Particle class
  V is for veclocity and A is for acceleration
  */
  PVector pos, v, a;
  
  Particle(float x, float y) {
    this.pos = new PVector(x, y);
    this.v = new PVector(0, 0);
    this.a = new PVector(0, 0);
  }
  
  void applyForce(PVector force) {
    a.add(force);
  }
  
  void update() {
    v.add(a);
    pos.add(v);
    a.mult(0);
  }
  
  void show() {
    point(pos.x, pos.y);
  }
}
