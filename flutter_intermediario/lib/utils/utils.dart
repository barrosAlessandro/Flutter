import 'dart:math';

class Utils {
  static int generateRandomIndex(int len) {
    var rng = new Random();
    rng.nextInt(100);

    return rng.nextInt(len-1);
  }



}

