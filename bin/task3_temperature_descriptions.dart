// Abstract interface
abstract class TemperatureDescriber {
  String describe(int? temp);
}

// Concrete implementation
class RangeTemperatureDescriber implements TemperatureDescriber {
  @override
  String describe(int? temp) {
    if (temp == null) return "No data";
    if (temp <= 0) return "Freezing";
    if (temp >= 1 && temp <= 15) return "Cold";
    if (temp >= 16 && temp <= 25) return "Mild";
    if (temp >= 26 && temp <= 35) return "Warm";
    if (temp >= 36 && temp <= 45) return "Hot";
    return "Extreme";
  }
}

// Polymorphic runner
void runDescriber(TemperatureDescriber describer, List<int?> temps) {
  temps.forEach((t) => print("Temp: $t → ${describer.describe(t)}"));
}

void main() {
  final temps = [null, -2, 10, 20, 30, 40, 50];
  final describer = RangeTemperatureDescriber();
  runDescriber(describer, temps);
}
