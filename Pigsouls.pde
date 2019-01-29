//Jonathan Chan
//28-1-2019
//pigsoul system


class pigsouls {
  PImage img;
  color[] c= new color[1024*1024];
  int maxPigX, maxPigY;
  float[] off = new float[100];
  
  pigsouls(PImage imgfile, int maxX, int maxY) {
    //imgfile: name of the image, maxX: width of picture, maxY: height of picture
    img = imgfile;
    maxPigX = maxX;
    maxPigY = maxY;   
    
    //off for noiseDrawing()
    for (int i = 0; i < 100; i++) {
      off[i] = 100*i;
    }
  }
  
  void getPixels() {
    //save every single pixels
    for (int y = 0; y < maxPigY; y++) {
      for (int x = 0; x < maxPigX; x++) {
        c[y*maxPigX + x] = img.get(x, y);
      }
    }
   }
   void mouseDrawing(float Size, String omg, boolean spddy) {
     //Size: size of the pixel, omg(REAL or BLUR): style of drawing, spddy(true or false): whether size related to the speed
     
     //save the position of the mouse
     int x = floor(min(max(0,mouseX), maxPigX));
     int y = floor(min(max(0,mouseY), maxPigY));
     
     //calculate the speed
     float mspd = (((mouseY-pmouseY)^2 + (mouseX-pmouseX)^2)^(1/2))/0.3;
     
     //display the pixels
     if (x < maxPigX && x > 0){
       if (y < maxPigY && y > 0){
         if (omg == "REAL") {
           for (int i = 0; i < maxPigX; i++) {
             for (int j = 0; j < maxPigY; j++) {
               if (spddy == true) {
                 if (dist(x, y, i, j) < mspd*Size/15) {
                 pushMatrix();
                 translate(i, j);
                 display(i, j, 1);
                 popMatrix();              
               }
               } else if (spddy == false) {
                 if (dist(x, y, i, j) < Size) {
                 pushMatrix();
                 translate(i, j);
                 display(i, j, 1);
                 popMatrix(); 
                 }
               }
             }
           }  
         } else if (omg == "BLUR") {
           
          pushMatrix();
          translate(x, y);
          if (spddy == true) {
            display(x, y, mspd*Size/15);
          } else if (spddy == false) {
            display(x, y, Size);
          }
          popMatrix();
         }
       }
     }
   }
   void noiseDrawing(int num, float Size, float spd, String omg, boolean spddy) {
     //num: number of "snakes", Size: size of pixels, spd: speed of snakes
     //omg(REAL or BLUR): style of drawing, spddy(true or false): whether size related to the speed
     
     for (int r = 0; r < num; r++) {
       
       //path of snake by noise()
       int x = round(map(noise(off[r]+=spd), 0, 1, -maxPigX*.5, maxPigX*1.5));
       int y = round(map(noise(off[r+50]+=spd), 0, 1, -maxPigY*.5, maxPigY*1.5));
       
       //last position of "snakes"
       int px = round(map(noise(off[r]-spd), 0, 1, -maxPigX*.5, maxPigX*1.5));
       int py = round(map(noise(off[r+50]-spd), 0, 1, -maxPigY*.5, maxPigY*1.5));
       
       //calculate the speed
       float mspd = (((x-px)^2 + (y-py)^2)^(1/2))/0.3;
       
       //display the pixels
       if (x < maxPigX && x > 0){
         if (y < maxPigY && y > 0){
           if (omg == "REAL") {
             for (int i = 0; i < maxPigX; i++) {
               for (int j = 0; j < maxPigY; j++) {
                 if (spddy == true) {
                   if (dist(x, y, i, j) < mspd*Size/15) {
                   pushMatrix();
                   translate(i, j);
                   display(i, j, 1);
                   popMatrix();              
                   }
                 } else if (spddy == false) {
                   if (dist(x, y, i, j) < Size) {
                   pushMatrix();
                   translate(i, j);
                   display(i, j, 1);
                   popMatrix(); 
                   }
                 }
               }
             }  
           } else if (omg == "BLUR") {
              pushMatrix();
              translate(x, y);
              if (spddy == true) {
                display(x, y, mspd*Size/15);
               } else if (spddy == false) {
                display(x, y, Size);
              }
            popMatrix();
           }
         }
       }   
     }
  
   }
   
   
   void display(int x, int y, float Size) {
     //x: x-coord of pixel, y: y-coord of pixel, Size: size of pixel
     
     //display pixel as circle
     fill(c[y*maxPigX+x]);
     ellipse(0, 0, Size, Size);
   }
     
   void getTiles(pigsouls[] pigName, int x, int y) {
     //pigName: name of variables to save, x: width separartion, y: height separation
     
     pigName = new pigsouls[x*y];
     PImage[] TileImg = new PImage[x*y];
     
     //to divide img as tile
     for (int i = 0; i < maxPigY/y; i++) {
       for (int j = 0; j < maxPigX/x; j++) {
         TileImg[i*x+j] = img.get(j*maxPigX/x, i*maxPigY/y, maxPigX/x, maxPigY/y);
         pigName[i*x+j] = new pigsouls(TileImg[i*x+j], maxPigX/x, maxPigY/y);
       }
     }
   }
     
}
