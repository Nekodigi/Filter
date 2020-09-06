//based on this site https://docs.opencv.org/trunk/d9/d61/tutorial_py_morphological_ops.html
PImage img, eroded, dilated;
int filterS = 5;
int threshold = 255;//we have to binarize

void setup(){
  size(2000, 500);
  img = loadImage("ErodeTest.png");
  img.resize(500, 500);
  img.filter(GRAY);
}

void draw(){
  eroded = morphologicalT(true, filterS, img);
  dilated = morphologicalT(false, filterS, img);
  image(img, 0, 0, width/4, height);
  image(eroded, width/4, 0, width/4, height);
  image(dilated, width/4*2, 0, width/4, height);
  image(sub(dilated, eroded), width/4*3, 0, width/4, height);
}

PImage morphologicalT(boolean erode, int filterS, PImage input){
  //erode or dilate, filter size=filterS*2+1
  PImage result = input.copy();
  input.loadPixels();
  for(int i=0; i<input.width; i++){
    for(int j=0; j<input.height; j++){
      int count = 0, total = 0;
      for(int is=-filterS; is<=filterS; is++){
        for(int js=-filterS; js<=filterS; js++){
          if(is*is+js*js<=filterS*filterS){//use this when you want disk kernal.
            if(brightness(img.pixels[constrain(i+is, 0, input.width-1)+constrain(j+js, 0, input.height-1)*input.width]) >= threshold)count++;
            total++;
          }
        }
      }
      if(erode){
        if(count == total)result.pixels[i+j*input.width] = color(255);
        else result.pixels[i+j*input.width] = color(0);
      }
      if(!erode){
        if(count == 0)result.pixels[i+j*input.width] = color(0);
        else result.pixels[i+j*input.width] = color(255);
      }
      //result.pixels[i+j*img.width] = img.pixels[i+j*img.width];
    }
  }
  return result;
}

PImage sub(PImage A, PImage B){//A, B must same size
  //erode or dilate, filter size=filterS*2+1
  PImage result = A.copy();
  for(int i=0; i<result.width; i++){
    for(int j=0; j<result.height; j++){
      color Ac = A.pixels[i+j*result.width];
      color Bc = B.pixels[i+j*result.width];
      result.pixels[i+j*result.width] = color(red(Ac)-red(Bc), green(Ac)-green(Bc), blue(Ac)-blue(Bc));
    }
  }
  return result;
}
