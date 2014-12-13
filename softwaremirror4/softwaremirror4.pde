//parts of code gotten from http://blog.datasingularity.com/?p=362


ArrayList particles;
int savedTime;
int totalTime = 180000;
import processing.video.*;
Capture video;
Particle a;

void setup() {
  size(800, 600); 
  noStroke();
  video = new Capture(this, 800, 600, 30);
  smooth();
  video.start();
  particles = new ArrayList();
}

void draw() {
  background(255);
  if (video.available()) {
    video.read();
  }
  for (int i = particles.size ()-1; i >= 0; i--) {
    Particle p = (Particle)particles.get(i);
    //   if (!(p.atEdge())) {
    applyDissipativeForce(p, 0.01);
    p.checkBounds();
    int xPos = (int)p.returnLocationX();
    int yPos = (int)p.returnLocationY();

    if (xPos < video.width && yPos < video.height)
    {

      int location = (xPos + yPos*video.width);
      color c = video.pixels[location];
      p.update();
      if (p.ifRested()) {
        p.setColor(c);
      } else {
        p.display();
      }
      int passedTime = millis() - savedTime;
      if (passedTime > totalTime) {
        p.setColor(c);
      }
    }


    //   }
  }
}
void applyDissipativeForce(Particle p, float friction) {
  PVector f = PVector.mult(p.velocity, -friction);
  p.applyForce(f);
}


void mouseDragged() {
  particles.add(new Particle());
}

