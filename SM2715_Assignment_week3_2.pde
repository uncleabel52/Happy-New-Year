//Jonathan Chan
//28-1-2019
//sm2715 assignment 1


PImage[] img = new PImage[6];
pigsouls[] PigTures = new pigsouls[6];
int r = 0;
float timer = 4000;
float[] off = new float[100];
    
void setup() {
  //fullScreen();
   size(512, 512);
   noiseSeed(int(random(1000)));

  //load the pictures
  for (int i = 0; i < 6; i++) {
    img[i] = loadImage("NY0" + i + ".png");
    PigTures[i] = new pigsouls(img[i], 512, 512);
    PigTures[i].moreRed();
  }
  

  for (int i = 0; i < 100; i++) {
      off[i] = 100*i;
    }
  
     background(255);
     textAlign(CENTER);
     textSize(30);
     fill(0);
     text("click 'a' to change picture", width/2, height/2-20);
     text("click 's' to clear the canvas", width/2, height/2+20);
     noStroke(); 
}


void draw() {
  if (millis() > timer) {
    //Time for reading the instruction
  for (int i = 0; i < 5; i++) {
    for (int j = 0; j < 1000; j++) {
       PigTures[r].noiseDrawing(1, 10, 0.0007, "BLUR", "SPEED");

    }
     
  }
  for (int i = 0; i < 100; i++) {
    if (off[i] >  10000) {
       off[i] = 100*i;
    }
    }
  }
 if (millis()-timer > 10000) {
    r = randomArray(r, 6);
      //println(r);
      timer = millis();
 }
  
}

void keyReleased() {  
  //random system to pick a different random picture each click
  if (key == 'a') {
    r = randomArray(r, 6);
      //println(r);
      timer = millis();
  }
  
  //to clear the canvas
  if (key == 's') {
    background(255);
    fill(0);
     text("click 'a' to change picture", width/2, height/2-20);
     text("click 's' to clear the canvas", width/2, height/2+20);
  }
 
  
}
  
  
