PImage directBlend(PImage A, PImage B){
  PImage result = B.copy();
  for(int i=0; i<A.width/2; i++){
    for(int j=0; j<A.height; j++){
      result.pixels[i+j*A.width] = A.pixels[i+j*A.width];
    }
  }
  return result;
}

PImage maskBlend(PImage A, PImage B, boolean[][] mask){
  PImage result = B.copy();
  for(int i=0; i<A.width; i++){
    for(int j=0; j<A.height; j++){
      if(!mask[i][j]){
        result.pixels[i+j*A.width] = A.pixels[i+j*A.width];
      }
    }
  }
  return result;
}


PImage sub(PImage A, PImage B){//A, B must be same size
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

PImage subSpecial(PImage A, PImage B){//+1 and divided 2 to have negative value, so I need to reverse this when use
  PImage result = A.copy();
  for(int i=0; i<result.width; i++){
    for(int j=0; j<result.height; j++){
      color Ac = A.pixels[i+j*result.width];
      color Bc = B.pixels[i+j*result.width];
      result.pixels[i+j*result.width] = color((red(Ac)-red(Bc)+1)/2, (green(Ac)-green(Bc)+1)/2, (blue(Ac)-blue(Bc)+1)/2);
    }
  }
  return result;
}

PImage add(PImage A, PImage B){//B multiply 2 and -1 to treat negative value
  PImage result = A.copy();
  for(int i=0; i<result.width; i++){
    for(int j=0; j<result.height; j++){
      color Ac = A.pixels[i+j*result.width];
      color Bc = B.pixels[i+j*result.width];
      result.pixels[i+j*result.width] = color(red(Ac)+red(Bc), green(Ac)+green(Bc), blue(Ac)+blue(Bc));
    }
  }
  return result;
}

PImage addSpecial(PImage A, PImage B){//B multiply 2 and -1 to treat negative value
  PImage result = A.copy();
  for(int i=0; i<result.width; i++){
    for(int j=0; j<result.height; j++){
      color Ac = A.pixels[i+j*result.width];
      color Bc = B.pixels[i+j*result.width];
      result.pixels[i+j*result.width] = color(red(Ac)+red(Bc)*2-1, green(Ac)+green(Bc)*2-1, blue(Ac)+blue(Bc)*2-1);
    }
  }
  return result;
}
