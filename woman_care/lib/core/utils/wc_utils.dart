import 'dart:math';

class WCUtils {
  static int getRandomNumber() {
    Random random = Random();
    int randomNumber = random.nextInt(999999);
    return randomNumber;
  }
}
