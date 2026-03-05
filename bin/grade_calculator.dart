import 'dart:io';

/// Interface (abstract class in Dart)
abstract class Gradable {
  double calculateAverage();
  String getLetterGrade();
}

/// Base class
class Person {
  String name;
  Person(this.name);
}

/// Student class implementing interface + inheritance
class Student extends Person implements Gradable {
  List<int> grades;

  Student(String name, this.grades) : super(name);

  @override
  double calculateAverage() =>
      grades.isEmpty ? 0 : grades.reduce((a, b) => a + b) / grades.length;

  @override
  String getLetterGrade() {
    double avg = calculateAverage();
    if (avg >= 90) return 'A';
    if (avg >= 80) return 'B';
    if (avg >= 70) return 'C';
    if (avg >= 60) return 'D';
    return 'F';
  }

  bool validateGrades() => grades.every((g) => g >= 0 && g <= 100);

  String formatStudent() =>
      "$name: Average ${calculateAverage().toStringAsFixed(1)} → ${getLetterGrade()}";
}

void main() {
  print("Enter student name:");
  String name = stdin.readLineSync() ?? "Unknown";

  print("Enter grades separated by spaces:");
  List<int> grades = (stdin.readLineSync() ?? "")
      .split(" ")
      .map((e) => int.tryParse(e))       // lambda + higher-order function
      .where((e) => e != null)           // filter with lambda
      .map((e) => e!)                    // unwrap values
      .toList();

  Student student = Student(name, grades);

  if (!student.validateGrades()) {
    print("Invalid grades entered.");
    return;
  }

  print(student.formatStudent());

  // Demonstrating polymorphism + higher-order functions
  List<Gradable> students = [
    student,
    Student("Alice", [95, 85, 90]),
    Student("Bob", [50, 60, 55])
  ];

  var passed = students.where((s) => s.calculateAverage() >= 60).toList();

  print("\nStudents who passed:");
  passed.forEach((s) => print((s as Student).formatStudent()));
}
