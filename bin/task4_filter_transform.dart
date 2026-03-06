// Abstract interface
abstract class NumberProcessor {
  int process(List<int?> numbers);
}

// Concrete implementation
class DoubleAndSumProcessor implements NumberProcessor {
  @override
  int process(List<int?> numbers) {
    return numbers
        .where((n) => n != null)
        .map((n) => n! * 2)
        .reduce((a, b) => a + b);
  }
}

// Polymorphic runner
void runProcessor(NumberProcessor processor, List<int?> numbers) {
  final result = processor.process(numbers);
  print("Sum of doubled values: $result");
}

void main() {
  final numbers = [1, null, 3, null, 5, 6, null, 8];
  final processor = DoubleAndSumProcessor();
  runProcessor(processor, numbers);
}
