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
  var randomDistance = 0;
  var index = Random().nextInt(Tariff.values.length);
  var tariff = Tariff.values[index];
  int distanceCost = 250;
  while (randomDistance != 24) {
    ++ randomDistance;
      if (randomDistance >= 10 && randomDistance < 20) {
    distanceCost = 200;
  } 
  if (randomDistance >= 20) {
    distanceCost = 150;
  }

print('''
Travel distance is $randomDistance
Kilometer cost is $distanceCost
Cost is ${randomDistance * distanceCost * tariff.value}.
Tariff is ${tariff.tariffName}\nCoefficient is ${tariff.value}
 '''); 
 }
}

//OUTPUT EXAMPLE:

// Travel distance is 1
// Kilometer cost is 250
// Cost is 250.
// Tariff is Economy
// Coefficient is 1
// Travel distance is 2
// Kilometer cost is 250
// Cost is 500.
// Tariff is Economy
// Coefficient is 1
 
// Travel distance is 3
// Kilometer cost is 250
// Cost is 750.
// Tariff is Economy
// Coefficient is 1
 
// Travel distance is 4
// Kilometer cost is 250
// Cost is 1000.
// Tariff is Economy
// Coefficient is 1
 
// Travel distance is 5
// Kilometer cost is 250
// Cost is 1250.
// Tariff is Economy
// Coefficient is 1
 
// Travel distance is 6
// Kilometer cost is 250
// Cost is 1500.
// Tariff is Economy
// Coefficient is 1
 
// Travel distance is 7
// Kilometer cost is 250
// Cost is 1750.
// Tariff is Economy
// Coefficient is 1
 
// Travel distance is 8
// Kilometer cost is 250
// Cost is 2000.
// Tariff is Economy
// Coefficient is 1
 
// Travel distance is 9
// Kilometer cost is 250
// Cost is 2250.
// Tariff is Economy
// Coefficient is 1
 
// Travel distance is 10
// Kilometer cost is 200
// Cost is 2000.
// Tariff is Economy
// Coefficient is 1
 
// Travel distance is 11
// Kilometer cost is 200
// Cost is 2200.
// Tariff is Economy
// Coefficient is 1
 
// Travel distance is 12
// Kilometer cost is 200
// Cost is 2400.
// Tariff is Economy
// Coefficient is 1
 
// Travel distance is 13
// Kilometer cost is 200
// Cost is 2600.
// Tariff is Economy
// Coefficient is 1
 
// Travel distance is 14
// Kilometer cost is 200
// Cost is 2800.
// Tariff is Economy
// Coefficient is 1
 
// Travel distance is 15
// Kilometer cost is 200
// Cost is 3000.
// Tariff is Economy
// Coefficient is 1
 
// Travel distance is 16
// Kilometer cost is 200
// Cost is 3200.
// Tariff is Economy
// Coefficient is 1
 
// Travel distance is 17
// Kilometer cost is 200
// Cost is 3400.
// Tariff is Economy
// Coefficient is 1
 
// Travel distance is 18
// Kilometer cost is 200
// Cost is 3600.
// Tariff is Economy
// Coefficient is 1
 
// Travel distance is 19
// Kilometer cost is 200
// Cost is 3800.
// Tariff is Economy
// Coefficient is 1
 
// Travel distance is 20
// Kilometer cost is 150
// Cost is 3000.
// Tariff is Economy
// Coefficient is 1
 
// Travel distance is 21
// Kilometer cost is 150
// Cost is 3150.
// Tariff is Economy
// Coefficient is 1
 
// Travel distance is 22
// Kilometer cost is 150
// Cost is 3300.
// Tariff is Economy
// Coefficient is 1
// Travel distance is 23
// Kilometer cost is 150
// Cost is 3450.
// Tariff is Economy
// Coefficient is 1
 
// Travel distance is 24
// Kilometer cost is 150
// Cost is 3600.
// Tariff is Economy
// Coefficient is 1

//-----------------------


//Travel distance is 1
// Kilometer cost is 250
// Cost is 750.
// Tariff is Premium
// Coefficient is 3
// Travel distance is 2
// Kilometer cost is 250
// Cost is 1500.
// Tariff is Premium
// Coefficient is 3
 
// Travel distance is 3
// Kilometer cost is 250
// Cost is 2250.
// Tariff is Premium
// Coefficient is 3
 
// Travel distance is 4
// Kilometer cost is 250
// Cost is 3000.
// Tariff is Premium
// Coefficient is 3
 
// Travel distance is 5
// Kilometer cost is 250
// Cost is 3750.
// Tariff is Premium
// Coefficient is 3
 
// Travel distance is 6
// Kilometer cost is 250
// Cost is 4500.
// Tariff is Premium
// Coefficient is 3
 
// Travel distance is 7
// Kilometer cost is 250
// Cost is 5250.
// Tariff is Premium
// Coefficient is 3
 
// Travel distance is 8
// Kilometer cost is 250
// Cost is 6000.
// Tariff is Premium
// Coefficient is 3
 
// Travel distance is 9
// Kilometer cost is 250
// Cost is 6750.
// Tariff is Premium
// Coefficient is 3
 
// Travel distance is 10
// Kilometer cost is 200
// Cost is 6000.
// Tariff is Premium
// Coefficient is 3
 
// Travel distance is 11
// Kilometer cost is 200
// Cost is 6600.
// Tariff is Premium
// Coefficient is 3
 
// Travel distance is 12
// Kilometer cost is 200
// Cost is 7200.
// Tariff is Premium
// Coefficient is 3
 
// Travel distance is 13
// Kilometer cost is 200
// Cost is 7800.
// Tariff is Premium
// Coefficient is 3
 
// Travel distance is 14
// Kilometer cost is 200
// Cost is 8400.
// Tariff is Premium
// Coefficient is 3
 
// Travel distance is 15
// Kilometer cost is 200
// Cost is 9000.
// Tariff is Premium
// Coefficient is 3
 
// Travel distance is 16
// Kilometer cost is 200
// Cost is 9600.
// Tariff is Premium
// Coefficient is 3
 
// Travel distance is 17
// Kilometer cost is 200
// Cost is 10200.
// Tariff is Premium
// Coefficient is 3
 
// Travel distance is 18
// Kilometer cost is 200
// Cost is 10800.
// Tariff is Premium
// Coefficient is 3
 
// Travel distance is 19
// Kilometer cost is 200
// Cost is 11400.
// Tariff is Premium
// Coefficient is 3
 
// Travel distance is 20
// Kilometer cost is 150
// Cost is 9000.
// Tariff is Premium
// Coefficient is 3
// Travel distance is 21
// Kilometer cost is 150
// Cost is 9450.
// Tariff is Premium
// Coefficient is 3
 
// Travel distance is 22
// Kilometer cost is 150
// Cost is 9900.
// Tariff is Premium
// Coefficient is 3
 
// Travel distance is 23
// Kilometer cost is 150
// Cost is 10350.
// Tariff is Premium
// Coefficient is 3
 
// Travel distance is 24
// Kilometer cost is 150
// Cost is 10800.
// Tariff is Premium
// Coefficient is 3

