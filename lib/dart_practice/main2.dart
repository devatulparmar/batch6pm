void main() {
  Abc a = Abc();
  a.myFunction();

  Weltec w = Weltec();
  var getNameWithPrice = w.getNameWithPrice();
  print(getNameWithPrice);
  print(w.getName());
}

class Abc {
  int i = 0;

  void myFunction() {
    print('Hello');
  }
}

class Xyz {
  String name = 'Weltec';

  String getName() {
    return name;
  }
}

class Weltec extends Xyz {
  double price = 3.14;

  getPrice() {
    return price;
  }

  getNameWithPrice() {
    Xyz x = Xyz();
    var name = x.getName();
    var p = getPrice();
    return "$name $p";
  }
}
