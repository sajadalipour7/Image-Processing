import processing.sound.*;
ArrayList<Firework> fireworks = new ArrayList<Firework>();
PVector gravity;

SoundFile file;
int temporaryCounter;

void setup() {
  size(1000, 800);
  
  colorMode(HSB);
  stroke(255);
  strokeWeight(5);
  
  gravity = new PVector(0, 0.2); //setting gravity for simulation
  
  file=new SoundFile(this,"Boom.mp3");
}

void draw() {
  background(0, 0, 0, 10);

  if (random(0, 1) < 0.02) {
    Firework f = new Firework(random(0,width),random(0,height),0,random(-12,-8));
    fireworks.add(f);
  }
 
  for (int i = fireworks.size() - 1; i >= 0; i--) {
    if (fireworks.get(i).exploded && !fireworks.get(i).soundPlayed){
      // play boom sound contemporary to the firework
      file.play();
      fireworks.get(i).soundPlayed=true;
    }
    
    if (fireworks.get(i).particles.size() < 1) {
      fireworks.remove(i);
    }
    else {
      fireworks.get(i).update();
      fireworks.get(i).show();
    }
  }
}
void mousePressed() {
  temporaryCounter=millis();
}
void mouseReleased(){
  // throw bomb with acceleration of how much mouse was held
  Firework f=new Firework(mouseX,mouseY,0,(millis()-temporaryCounter+200)/-50);
  fireworks.add(f);
}

void keyPressed(){
  if(key=='1'){
    // from bottom to up bombs
    for(int i=0;i<int(random(10,20));i++){
      Firework f=new Firework(random(0,width),random(0,height),0,random(-12,-8));
      fireworks.add(f);
    }
  }else if(key=='2'){
    // from right to left bombs
    for(int i=0;i<int(random(10,20));i++){
      Firework f=new Firework(random(0,width),random(0,height),-5,random(-12,-8));
      fireworks.add(f);
    }
  }else if(key=='3'){
    // from left to right bombs
    for(int i=0;i<int(random(10,20));i++){
      Firework f=new Firework(random(0,width),random(0,height),5,random(-12,-8));
      fireworks.add(f);
    }
  }
}
