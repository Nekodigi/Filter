//based on this site https://blog.shikoan.com/pytorch-laplacian-pyramid/
//extend image when use filter

PImage img, img2;
float[][] kgauss = {{1,  4,  6,  4, 1},
                    {4, 16, 24, 16, 4},
                    {6, 24, 36, 24, 6},
                    {4, 16, 24, 16, 4},
                    {1,  4,  6,  4, 1}};
                    
boolean useNegative = true;

void setup(){
  for(int i=0; i<5; i++){
    for(int j=0; j<5; j++){
      kgauss[i][j] /= 256;
    }
  }
  size(1024, 1024);
  //size(512, 512);
  colorMode(RGB, 1, 1, 1);
  //img = loadImage("FevCat.png");
  //img2 = loadImage("ImpactKaeruW.png");
  img = loadImage("C1.jpg");
  img2 = loadImage("C2.jpg");
  img.resize(1024, 1024);
  img2.resize(1024, 1024);
  //img.resize(512, 512);
  image(laplacianBlending(img, img2, 5),(width-height)/2, 0, height, height);
}

void draw(){
}
