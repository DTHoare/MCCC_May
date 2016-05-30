//define colours:
color darkBlue = #222831;
color blue = #2D4059;
color red = #FF5722;
color white = #EEEEEE;

//Object setup
Sea sea;
Star star;
ArrayList<Star> stars;



void setup() {
  size(540,540, P3D);
  background(darkBlue);
  frameRate(30);
  
  //create the sea and the stars in the sky
  sea = new Sea();
  stars = new ArrayList<Star>();
  populateStars();
}



void draw(){
  background(darkBlue);
  directionalLight(255, 255, 255, 0.5,0.8,-0.5);
    
  //display things in order from back to front
  for(Star s : stars) {
    s.display();
  }
  sea.display();
  
  //floaty box
  pushMatrix();
    fill(red);
    //box bobs in the middle
    translate(width/2,height/1.75, 40*sin(2*PI/30*frameCount)*sea.waveAmplitude()+100);
    
    //rotate with wave
    rotateX(PI/4+PI/90*sea.waveAmplitude()*abs(sin(2*PI/30*frameCount)));
    rotateY(sea.calculateWaveAngle());
    rotateZ(-PI/30);
    
    box(120,120,150);
  popMatrix();
  
  //saveFrames(150);
}



//save first n frames
void saveFrames(int n) {
  if(frameCount <= n) {
    saveFrame("frame_###.png");
  }
}



//create a bunch of stars for the sky
void populateStars() {
  for(int i = 0; i < 480; i++) {
    //using noise creates more galaxy like star patterns
    //however, this takes a long time to setup
    float x = map(noise(0.05*i),0,1,-width,width*2);
    float y = map(noise(1000+0.05*i),0,1,-height/3,2*height/3);
    
    //no stars below the horizon
    if(y > height/3) {
      y -= height/3;
    }
    
    star = new Star(x, y);
    stars.add(star);
  }
}