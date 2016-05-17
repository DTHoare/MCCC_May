//define colours:
color darkBlue = #222831;
color blue = #2D4059;
color red = #FF5722;
color white = #EEEEEE;

//3D effect
float perspectiveAngle = PI/5;

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
  for(int i = 0; i < 480; i++) {
    //using noise creates more galaxy like star patterns
    //however, this takes a long time to setup
    float v1 = map(noise(0.05*i),0,1,-width,width*2);
    float v2 = map(noise(1000+0.05*i),0,1,-height/3,2*height/3);
    //no stars below the horizon
    if(v2 > height/3) {
      v2 -= height/3;
    }
    star = new Star(v1, v2);
    //star = new Star(random(0,width), random(0, height/3));
    stars.add(star);
  }
}

void draw(){
  background(darkBlue);
  directionalLight(255, 255, 255, 0.5,0.8,-0.6);
    
  for(Star s : stars) {
    s.display();
  }
  sea.display();
  
  //floaty box
  pushMatrix();
    fill(red);
    translate(width/2,height/1.5);
    rotateX(perspectiveAngle);
    box(80,80,40*cos(2*PI/30*frameCount)+350);
  popMatrix();
  
  //saveFrames(30);
}

//save first n frames
void saveFrames(int n) {
  if(frameCount <= n) {
    saveFrame("frame_###.png");
  }
}