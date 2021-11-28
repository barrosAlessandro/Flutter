import 'dart:math';

class Utils {
  static int generateRandomIndex(int len) {
    var rng = new Random();
    rng.nextInt(100);

    return rng.nextInt(len-1);
  }

  static int indexFavorite(int len){
    if(len < 6){
      return len;
    }
    else{
      return 6;
    }
  }



}

