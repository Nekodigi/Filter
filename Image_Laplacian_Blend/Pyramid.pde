PImage pyramidUp(PImage input){
  PImage scaled = createImage(input.width*2, input.width*2, RGB);
  for(int i=0; i<scaled.width; i++){
    for(int j=0; j<scaled.height; j++){
      scaled.pixels[i+j*scaled.width] = input.pixels[i/2+j/2*input.height];
    }
  }
  return applyFilter(scaled, 1, kgauss);
}

PImage pyramidDown(PImage input){
  return applyFilter(input, 2, kgauss);
}

PImage[] gaussianPyramid(PImage input, int pyramidN){
  PImage[] pyramid = new PImage[pyramidN];
  PImage current = input;
  for(int i=0; i<pyramidN; i++){
    current = pyramidDown(current);
    pyramid[i] = current;
  }
  return pyramid;
}
