class DiceLogic {
  static String nidurstodur(int roll1, int roll2) {
    int sum = roll1 + roll2;
    if (sum == 2 || sum == 12) {
      return "Food Place";
    } else if (sum % 3 == 0) {
      return "Bónus";
    } else if (sum % 3 == 1) {
      return "Hagkaup";
    } else if (sum % 3 == 2) {
      return "Krónan";
    }
    return "";
  }
}


