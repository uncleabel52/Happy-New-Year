

PImage[] get4Tiles(PImage img, int x, int y) {
     //img: original image, x: width of each tile, y: height of each tile
     
     PImage Img = img;
     Img.resize(x*2, y*2);
     PImage[] t = new PImage[4];
     
     //to divide img as tile
     for (int i = 0; i < y; i++) {
       for (int j = 0; j < x; j++) {
         t[i*x+j] = Img.get(j*x, i*y, x, y);
       }
     }
     return t;
   }


PImage combine4tiles(PImage img1, PImage img2, PImage img3, PImage img4, int x, int y) {
  PImage theImg;
  PImage[] Img = new PImage[4];
  Img[0] = img1;
  Img[1] = img2;
  Img[2] = img3;
  Img[3] = img4;
  for (int i = 0; i < 4; i++) {
    Img[i].resize(x/2, y/2);
  }
  for (int j = 0; j < 2; j++) {
    for (int i = 0; i < 2; i++) {
      Img[j*2+i].resize(x/2, y/2);
      image(Img[j*2+i], -x+i*x/2, -y+j*y/2, x/2, y/2);
    }
  }
  
  theImg = get(-x, -y, x, y);
  
  return theImg;
}
