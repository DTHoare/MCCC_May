class Star {
  PVector position;
  float offset;
  float value;
  float size;
  
  Star(float x_, float y_) {
    position = new PVector(x_, y_);
    offset = random(0,3);
    size = random(0.5, 3);
  }
  
  void display() {
    noStroke();
    ellipseMode(CENTER);
    value = sin(offset + 2*PI/30 * frameCount);
    fill(white, 200 + 55*value);
    ellipse(position.x, position.y, size + size/2*value, size + size/2*value);
  }
}