class Sea {
  int sizeX, sizeY;
  float angle;
  float rotateAngle;
  float waveWidth;
  
  Sea() {
    sizeX = width*2;
    sizeY = height*2;
    angle = 0;
    rotateAngle = -PI/15;
    waveWidth = 1;
  }
  
  /*
  The sea is created as a series of long rectangles
  This is done to approximate a smooth rolling of waves across the surface
  Thinner strips are more accurate but slower
  */
  void display() {
    for(int x = -20; x < width+20; x+=waveWidth) {
      pushMatrix();
        fill(blue);
        noStroke();
        translate(x,height/3, 10*sin(2*PI/30 * frameCount));
        rotateX(perspectiveAngle + PI/10*sin(2*PI/30 * frameCount + 0.01*x));
        rotateZ(rotateAngle);
        rect(-waveWidth/2,0,waveWidth*1.5,sizeY);
      popMatrix();   
    }
  }
}