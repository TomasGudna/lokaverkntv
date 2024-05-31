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

  static String newDiceLogic(int greenRoll, int blueRoll) {
    bool isGreenEven = greenRoll % 2 == 0;

    if (isGreenEven) {
      switch (blueRoll) {
        case 1: return "KFC";
        case 2: return "J&J";
        case 3: return "Lemon";
        case 4: return "Brauð & Co";
        case 5: return "Sara kebab";
        case 6: return "KFC";
        default: return "";
      }
    } else {
      switch (blueRoll) {
        case 1: return "JWI";
        case 2: return "Pure Deli";
        case 3: return "Subway";
        case 4: return "Metro";
        case 5: return "JWI";
        case 6: return "Salatbarinn";
        default: return "";
      }
    }
  }
}


