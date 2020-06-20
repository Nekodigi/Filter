PImage img;
float[][] kx = {{-1, 0, 1},
                {-2, 0, 2},
                {-1, 0, 1}};
float[][] ky = {{-1, -2, -1},
                {0, 0, 0},
                {1, 2, 1}};
void setup(){
  size(500, 500);
  img = loadImage("FevCat.png");
  
  image(img, 0, 0, width, height);
  
  loadPixels();
  int[] sxpixels = applyFilter(pixels, kx);
  int[] sypixels = applyFilter(pixels, ky);
  int[] mixpixels = sqrMix(sxpixels, sypixels);
  setPixels(sxpixels);
  setPixels(sypixels);
  setPixels(mixpixels);
  //pixels = tpixels;
  updatePixels();
}

void draw(){
  
}

void setPixels(int[] source){
  for(int x=0; x<width; x++){
    for(int y=0; y<height; y++){
      pixels[y*width+x] = source[y*width+x];
    }
  }
}

int[] sqrMix(int[]... sources){
  int[] result = sources[0].clone();
  for(int x=0; x<width; x++){
    for(int y=0; y<height; y++){
      float sumr = 0, sumg = 0, sumb = 0;
      for(int[] source : sources){
        float tr = red(source[y*width+x]);
        float tg = green(source[y*width+x]);
        float tb = blue(source[y*width+x]);
        sumr += tr*tr;
        sumg += tg*tg;
        sumb += tb*tb;
      }
      result[y*width+x] = color(sqrt(sumr), sqrt(sumg), sqrt(sumb));
    }
  }
  return result;
}

int[] applyFilter(int[] source, float[][] filter){
  int[] result = source.clone();
  for(int x=0; x<width; x++){
    for(int y=0; y<height; y++){
      float r = 0, g = 0, b = 0;
      for(int i=-1; i<=1; i++){
        for(int j=-1; j<=1; j++){
          int ci0 = constrain(i+x, 0, width-1);
          int cj0 = constrain(j+y, 0, height-1);
          int col = source[cj0*width+ci0];
          int ci = constrain(i+1, 0, width);
          int cj = constrain(j+1, 0, height);
          r += red(col)*filter[ci][cj];
          g += green(col)*filter[ci][cj];
          b += blue(col)*filter[ci][cj];
        }
      }
      result[y*width+x] = color(r, g, b);
    }
  }
  return result;
}
