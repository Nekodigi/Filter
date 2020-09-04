//based on this site https://blog.shikoan.com/pytorch-laplacian-pyramid/
//extend image when use filter

PImage img;
float[][] kgauss = {{1,  4,  6,  4, 1},
                    {4, 16, 24, 16, 4},
                    {6, 24, 36, 24, 6},
                    {4, 16, 24, 16, 4},
                    {1,  4,  6,  4, 1}};
                    
PImage[] gaussianPyramid;
PImage[] laplacianPyramid;
boolean showGaussian = true;

void setup(){
  for(int i=0; i<5; i++){
    for(int j=0; j<5; j++){
      kgauss[i][j] /= 256;
    }
  }
  size(1024, 1024);
  //size(512, 512);
  colorMode(RGB, 1, 1, 1);
  img = loadImage("FevCat.png");
  img.resize(1024, 1024);
  //img.resize(512, 512);
  
  
  gaussianPyramid = gaussianPyramid(img, 6);
  laplacianPyramid = laplacianPyramid(img, 6);
}

void draw(){
  if(showGaussian)image(gaussianPyramid[(int)map(mouseX, 0, width, 0, 6)], 0, 0, width, height);
  else image(normalizeImage(laplacianPyramid[(int)map(mouseX, 0, width, 0, 5)]), 0, 0, width, height);
  
}

void keyPressed(){
  if(key == 't'){
    showGaussian = !showGaussian;
  }
}
