import 'dart:math';

void main() {
  int numSimulations = 1000000;
  int count = 0;
  Random random = Random();

  const maxVal = 3;
  const avgVal = 1.5;

  for (int i = 0; i < numSimulations; i++) {
    double x = (random.nextDouble() * 2 - 1) * maxVal; // Generuje číslo od -1 do 1
    double y = (random.nextDouble() * 2 - 1) * maxVal; // Generuje číslo od -1 do 1
    double z = (x + y) / 2;

    if (z >= -avgVal && z <= avgVal) {
      count++;
    }
  }

  double probability = count / numSimulations;
  print('Pravděpodobnost, že Z je v intervalu [-$avgVal, $avgVal]: $probability');
}
