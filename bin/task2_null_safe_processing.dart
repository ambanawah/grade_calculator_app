// Interface for data processors
abstract class DataProcessor {
  void process(List<User> users);
}

// Base User class
class User {
  final String name;
  final String? email;

  User(this.name, this.email);
}

// Concrete processor
class EmailProcessor implements DataProcessor {
  @override
  void process(List<User> users) {
    users.forEach((user) {
      final message = user.email?.toUpperCase() ?? "${user.name} has no email";
      print(message);
    });

    final countValid = users.where((u) => u.email != null).length;
    print("Total users with valid emails: $countValid");
  }
}

// Polymorphic runner
void runProcessor(DataProcessor processor, List<User> users) {
  processor.process(users);
}

void main() {
  final users = [
    User("Alex", "alex@example.com"),
    User("Blake", null),
    User("Casey", "casey@work.com"),
  ];

  final processor = EmailProcessor();
  runProcessor(processor, users);
}
