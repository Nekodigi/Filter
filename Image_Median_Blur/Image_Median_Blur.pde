//based on this site jp http://labs.eecs.tottori-u.ac.jp/sd/Member/oyamada/OpenCV/html/py_tutorials/py_imgproc/py_filtering/py_filtering.html#filtering
//en https://opencv-python-tutroals.readthedocs.io/en/latest/py_tutorials/py_imgproc/py_filtering/py_filtering.html
PImage img, result;
int filterS = 2;//filter size=filterS*2+1
int filterSize = filterS*2+1;

void setup(){
  size(1000, 500);
  img = loadImage("FevCat.png");
  img.resize(200, 200);
  img.filter(GRAY);
  for(int i=0; i<img.width; i++){
    for(int j=0; j<img.height; j++){
      if(random(1)<0.1){
        img.pixels[i+j*img.width] = color(brightness(img.pixels[i+j*img.width])+random(-100, 100));
      }
    }
  }
  result = img.copy();
  img.loadPixels();
  for(int i=0; i<img.width; i++){
    for(int j=0; j<img.height; j++){
      float[] cols = new float[filterSize*filterSize];//use color or brightness
      for(int is=-filterS; is<filterS; is++){
        for(int js=-filterS; js<filterS; js++){
          //cols[(filterS+is)+(filterS+js)*filterSize] = img.pixels[constrain(i+is, 0, img.width-1)+constrain(j+js, 0, img.height-1)*img.width];
          cols[(filterS+is)+(filterS+js)*filterSize] = brightness(img.pixels[constrain(i+is, 0, img.width-1)+constrain(j+js, 0, img.height-1)*img.width]);//! constrain index
        }
      }
      cols = sort(cols);//println(cols[0]);
      result.pixels[i+j*img.width] = color(cols[(filterS+1)+(filterS+1)*filterSize]);//choose median
      //result.pixels[i+j*img.width] = img.pixels[i+j*img.width];
    }
  }
  image(img, 0, 0, width/2, height);
  image(result, width/2, 0, width/2, height);
}

void draw(){
  
}
