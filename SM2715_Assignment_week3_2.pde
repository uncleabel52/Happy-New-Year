//Jonathan Chan
//28-1-2019
//sm2715 assignment 1


PImage[] img = new PImage[6];
pigsouls[] PigTures = new pigsouls[6];
int r = 0;
float timer = 4000;
    
void setup() {
   size(512, 512);
   
  //load the pictures
  for (int i = 0; i < 6; i++) {
    img[i] = loadImage("NY0" + i + ".png");
    PigTures[i] = new pigsouls(img[i], 512, 512);
    PigTures[i].getPixels();
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
     PigTures[r].noiseDrawing(30, 10, 0.0007, "BLUR", true);
  }
  }
 if (millis()-timer > 40000) {
    IntList PigNum2 = new IntList();
    for (int i = 0; i < 6; i++) {
      if (i != r) {
      PigNum2.append(i);
      }  
    }
      int rr = floor(random(5));
      r = PigNum2.get(rr);
      //println(r);
      timer = millis();
 }
  
}

void keyReleased() {  
  //random system to pick a different random picture each click
  if (key == 'a') {
    IntList PigNum2 = new IntList();
    for (int i = 0; i < 6; i++) {
      if (i != r) {
      PigNum2.append(i);
      }  
    }
      int rr = floor(random(5));
      r = PigNum2.get(rr);
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
  
  
