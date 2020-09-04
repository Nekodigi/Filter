void laplacianBlending(PImage A, PImage B, int pyramidN){
  PImage[] Alap = laplacianPyramid(A, pyramidN);
  PImage[] Blap = laplacianPyramid(B, pyramidN);
  PImage[] blendLap = new PImage[pyramidN-1];
  for(int ix=0; ix<pyramidN-1; ix++){
    blendLap[ix] = directBlend(Alap[ix], Blap[ix]);
  }
  
  PImage Atop = gaussianPyramid(A, pyramidN)[pyramidN-1];
  PImage Btop = gaussianPyramid(B, pyramidN)[pyramidN-1];
  PImage x = directBlend(Atop, Btop);
  
  for(int i=pyramidN-2; i>=0; i--){
    x = addSpecial(pyramidUp(x), blendLap[i]);println(blendLap[i].width, x.width);
  }
  image(x, 0, 0, width, height);
  //image(normalizeImage(blendLap[3]), 0, 0, width, height);
}
