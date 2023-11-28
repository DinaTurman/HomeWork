import 'dart:math';

enum Tariff {
  economy(1),
  standard(2),
  premium(3);

  const Tariff(this.value);
  final num value;
}

extension on Tariff {
  String get tariffName {
    switch (this) {
      case Tariff.economy:
      return 'Economy';
      case Tariff.standard:
      return 'Standard';
      case Tariff.premium:
      return 'Premium';
    }
  }
}

void main() {
  var distance = 0;
  var index = Random().nextInt(Tariff.values.length);
  var tariff = Tariff.values[index];
  var randomDistance = Random().nextInt(22) + 1;
  int distanceCost = 250; 
  while (distance != randomDistance) {
    ++ distance;
      if (distance >= 10 && distance < 20) {
    distanceCost = 200;
  } 
  if (distance >= 20) {
    distanceCost = 150;
  }

print('''
Travel distance is $distance
Kilometer cost is $distanceCost
Cost is ${distance * distanceCost * tariff.value}.
Tariff is ${tariff.tariffName}\nCoefficient is ${tariff.value}
 '''); 
 }
 print("Total cost is ${distance * distanceCost * tariff.value}\nTotal distance is $randomDistance");
}

//OUTPUT EXAMPLE:
// Travel distance is 1
// Kilometer cost is 250
// Cost is 500.
// Tariff is Standard
// Coefficient is 2

// Travel distance is 2
// Kilometer cost is 250
// Cost is 1000.
// Tariff is Standard
// Coefficient is 2
 
// Travel distance is 3
// Kilometer cost is 250
// Cost is 1500.
// Tariff is Standard
// Coefficient is 2
 
// Total cost is 1500
// Total distance is 3


