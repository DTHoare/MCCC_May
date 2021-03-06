class Sea {
  int sizeX, sizeY;
  float waveWidth;
  
  Sea() {
    sizeX = width*2;
    sizeY = height*2;
    waveWidth = 1;
  }
  
  /*
  Calculate wave height multiplier
  */
  float waveAmplitude() {
    float wavelength = 5 * frameRate;
    return( 0.4 + 1.9*pow(sin(PI/wavelength * (frameCount+5)),2) );
  }
  
  /*
  Calculate an angle of the normal to the wave at the middle point of the screen
  */
  float calculateWaveAngle() {
    float angle = 0;
    //make tangent
    float dx = 2;
    float y1 = waveAmplitude() * sin(2*PI/30 * (frameCount) + 0.01*(-dx/2));
    float y2 = waveAmplitude() * sin(2*PI/30 * (frameCount) + 0.01*(dx/2));
    //angle between tangent and vertical
    angle = PVector.angleBetween(new PVector(0,1), new PVector(dx, 8*(y2-y1)));
    return(angle-PI/2);
  }
  
  /*
  The sea is created as a series of long rectangles
  This is done to approximate a smooth rolling of waves across the surface
  Thinner strips are more accurate but slower
  Rotates around the top point, at the horizon
  */
  void display() {
    for(int x = -20; x < width+20; x+=waveWidth) {
      pushMatrix();
        fill(blue);
        noStroke();
        //bobbing sea
        translate(x,height/3, 10*sin(2*PI/30 * frameCount));
        
        //main wave affect as waves roll across the screen
        rotateX(PI/5 + PI/20 * waveAmplitude() * sin(2*PI/30 * (frameCount) + 0.01*(x-width/2)));
        
        //give a slight angle to waves aross screen
        rotateZ(-PI/15);
        rect(-waveWidth/2,0,waveWidth*1.5,sizeY);
      popMatrix();   
    }
  }
}