PImage laplacianBlending(PImage A, PImage B, int pyramidN, boolean[][] mask){
  PImage[] Alap = laplacianPyramid(A, pyramidN);
  PImage[] Blap = laplacianPyramid(B, pyramidN);
  PImage[] blendLap = new PImage[pyramidN-1];
  for(int ix=0; ix<pyramidN-1; ix++){
    mask = halfSample(mask);
    blendLap[ix] = maskBlend(Alap[ix], Blap[ix], mask);
  }
  
  PImage Atop = gaussianPyramid(A, pyramidN)[pyramidN-1];
  PImage Btop = gaussianPyramid(B, pyramidN)[pyramidN-1];
  mask = halfSample(mask);
  PImage x = maskBlend(Atop, Btop, mask);
  
  for(int i=pyramidN-2; i>=0; i--){
    if(useNegative)x = addSpecial(pyramidUp(x), blendLap[i]);
    else x = add(pyramidUp(x), blendLap[i]);
  }
  return x;
  //image(normalizeImage(blendLap[3]), 0, 0, width, height);
}
