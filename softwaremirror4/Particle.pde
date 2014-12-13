public class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  boolean inRestState = false;
  boolean atEdge = true;

  public Particle() {
    //  if (!atEdge) {
    location = new PVector(mouseX, mouseY);
    //get velocity from direction and speed of mouse movement
    velocity = new PVector(mouseX-pmouseX, mouseY-pmouseY);   
    acceleration = new PVector(0, 0, 0);
    mass = 1;
    // }
  }
  void display() {
    int rand1 = (int)random(0, 255);
    int rand2 = (int)random(0, 255);
    int rand3 = (int)random(0, 255);
    fill(rand1, rand2, rand3, 100);
    ellipse(location.x, location.y, 30, 30);
  }
  public void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  void applyForce(PVector force) {
    acceleration.add(PVector.div(force, mass));

  }
  float returnLocationX() {
    return abs(location.x);
  }
  float returnLocationY() {
    return abs(location.y);
  }
  void setColor(color c) {
    fill(c, 100);
    ellipse(location.x, location.y, 30, 30);
  }

  void checkBounds() {
    if ((location.x >= width-30) || (location.x <= 30)) {
      velocity.x = velocity.x * -1;
    }
    if ((location.y >= height-30) || (location.y <= 30)) {
      velocity.y = velocity.y * -1;
    }
  }
  boolean ifRested() {
    if ((velocity.x < 0.1) && (velocity.y < 0.1)) {
      inRestState = true;
    } else {
      inRestState = false;
    }
    return inRestState;
  }

}

