

class Firework {
  /*
  Firework class
  every instant of this class is a bomb that explodes after a certain amount of time
  */
  ArrayList<Particle> particles = new ArrayList<Particle>();
  Particle particle;
  int n_particles=150;
  boolean exploded = false;
  boolean soundPlayed=false;
  int c;
  
  
  Firework(float xPos,float yPos,float xAcc,float yAcc) {
    this.particle = new Particle(xPos, yPos);
    this.particle.applyForce(new PVector(xAcc, yAcc));
    this.particles.add(particle);
    this.c = color(random(0, 255), 255, 255, 200);
    
  }
  
  void update() {
    for (Particle p : particles) {
      p.applyForce(gravity);
      p.update();
    }
    
    if (particle.v.y >= 0 && !exploded) {
      particles.clear();
      exploded = true;
      for (int i = 0; i < n_particles; i++) {
        Particle p = new Particle(particle.pos.x, particle.pos.y);
        p.applyForce(PVector.random2D().setMag(random(-1,1))); // explosion
        particles.add(p);
      }
    } else if (exploded) {
      
      for (int i = particles.size() - 1; i >= 0; i--) {
        if (particles.get(i).pos.y > height)
          particles.remove(i);
      }
    }
  }
  
  void show() {
    stroke(c);
    for (Particle p : particles) {
      p.show();
    }
  }
}
