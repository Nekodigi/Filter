PImage[] laplacianPyramid(PImage input, int pyramidN){
  PImage[] gaussP = gaussianPyramid(input, pyramidN);
  PImage[] pyramid = new PImage[pyramidN];
  for(int i=0; i<pyramidN-1; i++){
    pyramid[i] = subSpecial(gaussP[i], pyramidUp(gaussP[i + 1]));
  }
  return pyramid;
}

PImage normalizeImage(PImage input){
  float max = Float.NEGATIVE_INFINITY;
  float min = Float.POSITIVE_INFINITY;
  PImage result = input.copy();
  for(color col : input.pixels){
    float r = red(col);float g = green(col);float b = blue(col);
    max = max(max, r, max(g, b));
    min = min(min, r, min(g, b));
  }
  for(int i=0; i<input.pixels.length; i++){
    color col = input.pixels[i];
    float r = red(col);float g = green(col);float b = blue(col);
    result.pixels[i] = color((r-min)/(max-min), (g-min)/(max-min), (b-min)/(max-min));
  }
  return result;
}
