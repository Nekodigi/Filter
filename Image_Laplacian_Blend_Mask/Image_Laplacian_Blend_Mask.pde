//based on this site https://blog.shikoan.com/pytorch-laplacian-pyramid/
//extend image when use filter

float brushS = 50;//brush size
PImage img, img2;
boolean[][] mask;
float[][] kgauss = {{1,  4,  6,  4, 1},
                    {4, 16, 24, 16, 4},
                    {6, 24, 36, 24, 6},
                    {4, 16, 24, 16, 4},
                    {1,  4,  6,  4, 1}};
                    
PImage[] gaussianPyramid;
PImage[] laplacianPyramid;
boolean showGaussian = true;
boolean useNegative = true;

void setup(){
  for(int i=0; i<5; i++){
    for(int j=0; j<5; j++){
      kgauss[i][j] /= 256;
    }
  }
  //size(1024, 1024);
  fullScreen();
  //size(512, 512);
  colorMode(RGB, 1, 1, 1);
  //img = loadImage("FevCat.png");
  //img2 = loadImage("ImpactKaeruW.png");
  img = loadImage("C1.jpg");
  img2 = loadImage("C2.jpg");
  img.resize(1024, 1024);
  img2.resize(1024, 1024);
  //img.resize(512, 512);
  //img2.resize(512, 512);
  
  mask = new boolean[img.width][img.height];
  //gaussianPyramid = gaussianPyramid(img, 6);
  //laplacianPyramid = laplacianPyramid(img, 6);
}

void draw(){
  if(mousePressed){
    for(int i=0; i<mask.length; i++){
      for(int j=0; j<mask[0].length; j++){
        if(dist(i, j, map(mouseX, 0, width, 0, img.width), map(mouseY, 0, height, 0, img.height)) < brushS){
          mask[i][j] = true;
        }
      }
    }
  }
  image(laplacianBlending(img, img2, 5, mask), (width-height)/2, 0, height, height);
  //if(showGaussian)image(gaussianPyramid[(int)map(mouseX, 0, width, 0, 6)], 0, 0, width, height);
  //else image(normalizeImage(laplacianPyramid[(int)map(mouseX, 0, width, 0, 5)]), 0, 0, width, height);
  
}

void keyPressed(){
  if(key == 't'){
    showGaussian = !showGaussian;
  }
}
