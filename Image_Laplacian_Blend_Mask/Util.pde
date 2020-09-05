boolean[][] halfSample(boolean[][] input){
  boolean[][] result = new boolean[input.length/2][input[0].length/2];
  for(int i=0; i<result.length; i++){
    for(int j=0; j<result[0].length; j++){
      result[i][j] = input[i*2][j*2];
    }
  }
  return result;
}

PImage applyFilter(PImage sourceImg, int stride, float[][] filter){
  int[] source = sourceImg.pixels;
  PImage result = createImage(sourceImg.width/stride, sourceImg.height/stride, RGB);;
  for(int x=0; x<sourceImg.width/stride; x++){
    for(int y=0; y<sourceImg.height/stride; y++){
      float r = 0, g = 0, b = 0;
      for(int i=-filter.length/2; i<=filter.length/2; i++){
        for(int j=-filter[0].length/2; j<=filter[0].length/2; j++){
          int ci0 = constrain(i+x, 0, (sourceImg.width-1)/stride);
          int cj0 = constrain(j+y, 0, (sourceImg.height-1)/stride);
          int col = source[cj0*stride*sourceImg.width+ci0*stride];
          int ci = i+filter.length/2;
          int cj = j+filter.length/2;
          r += red(col)*filter[ci][cj];
          g += green(col)*filter[ci][cj];
          b += blue(col)*filter[ci][cj];
        }
      }
      result.pixels[y*result.width+x] = color(r, g, b);
    }
  }
  return result;
}
