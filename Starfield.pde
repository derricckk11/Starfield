
class Particle {
  double myX, myY, myAngle, mySpeed;
  int myColor1, myColor2, myColor3, mySize;

  Particle() { //constructor
    myX = 400;
    myY = 400; //makes it be at the center
    //myColor1 = (int)(Math.random()* 255 + 1); 
    myColor1 = 29; 
    myColor2 = 41; 
    myColor3 = (int)(Math.random()* 255 + 1); 
    myAngle = (Math.random()*TWO_PI);//might have to use radians
    //mySpeed = (int)(Math.random()* 30 + 1) + (int) (Math.random()*2 + 1); //the addition spaces them out, the multiplication
    mySpeed = (int) (Math.random()* 30 + 11) - (int)(Math.random()*20);
    mySize = (int)(Math.random()* 10 + 5);
  }

  void move() {
    myX += Math.cos(myAngle) * mySpeed * (int)(Math.random()*3);
    myY += Math.sin(myAngle) * mySpeed * (int)(Math.random()*3);
  } //end of move

  void show() {
    fill(myColor1, myColor2, myColor3);
    ellipse((float)myX, (float)myY, mySize, mySize);
  } //end of show
} //end of particle

class oddball extends Particle {

  oddball() { //change these values later
    myX = width/2;
    myY = height/2; //makes it be at the center
    myColor1 = (int)(Math.random()* 255 + 1); 
    myColor2 = (int)(Math.random()* 255 + 1); 
    myColor3 = (int)(Math.random()* 255 + 1); 
    myAngle = (Math.random()*TWO_PI);//might have to use radians
    //mySpeed = (int)(Math.random()* 30 + 1) + (int) (Math.random()*2 + 1); //the addition spaces them out, the multiplication
    mySpeed = (Math.random()*100 -20);
    mySize = 50;
  }

  void show() {
    fill(255);
    ellipse((float)myX, (float)myY, mySize, mySize);
    fill(0);
    ellipse((float)myX, (float)myY, mySize - 5, mySize - 5);
    //rect((float)myX, (float)myY, 10, 50);
   
  }

  void move() {

    myX += (int)(Math.random()* 10 - 5);
    myY += (int)(Math.random()* 10 - 5);
  }
} // end of oddball



Particle[] moreParticles = new Particle[1000]; //only one array to hold both particles and oddball

void setup() {
  size(800, 800);
  background(0);
  for (int i = 0; i < moreParticles.length - 1; i++) {
    moreParticles[i] = new Particle();
  }

  for (int i = 999; i < moreParticles.length; i++) {
    moreParticles[i] = new oddball();
  }
} //end of setup


void draw() {

  background(23, 23, 23);
  noStroke();

  for (int i = 0; i < 500; i++) {
    int backgroundDotsX;
    int backgroundDotsY;
    int backgroundDotsSize;

    backgroundDotsX = (int)(Math.random()* 800);
    backgroundDotsY = (int)(Math.random()* 800);
    backgroundDotsSize = (int) (Math.random()* 3 + 2);

    fill(255);
    ellipse(backgroundDotsX, backgroundDotsY, backgroundDotsSize, backgroundDotsSize);
  }

  for (int i = 0; i < moreParticles.length - 1; i++) {
    
      
  fill(23, 23, 23);
rect(390, 390, 30, 20);
    moreParticles[i].move();
    moreParticles[i].show();
  }

  for (int i = 998; i < moreParticles.length; i++) {
    moreParticles[i].move();
    moreParticles[i].show();
  }

 
}//end of draw


