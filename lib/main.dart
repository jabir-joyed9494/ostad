import 'dart:io';

abstract class Person {
  String _name;
  int _age;
  String _address;

  Person(this._name, this._age, this._address);

  String get name => _name;
  int get age => _age;
  String get address => _address;

  void displayRole();
}

class Student extends Person {
  int studentID;
  String grade;
  List<double> courseScore;

  Student(String name, int age, String address, this.studentID, this.grade,
      this.courseScore)
      : super(name, age, address);

  @override
  void displayRole() {
    print("Role: Student");
  }

  double calculateAvg() {
    if (courseScore.isEmpty) return 0;
    double sum = 0, avg;
    for (int i = 0; i < courseScore.length; i++) {
      sum += courseScore[i];
    }
    avg = sum / courseScore.length;
    return sum / courseScore.length;
  }
}

class Teacher extends Person {
  int teacherID;
  List<String> courseTaught;

  Teacher(
      String name, int age, String address, this.teacherID, this.courseTaught)
      : super(name, age, address);

  @override
  void displayRole() {
    print("Role: Teacher");
  }

  void displayCourseTaught() {
    if (courseTaught.isEmpty) {
      print("No courses taught.");
      return;
    }
    print("Courses Taught:");
    for (var course in courseTaught) {
      print(course);
    }
  }
}

void main() {
  print("Enter Student Details:");
  print("Name: ");
  String studentName = stdin.readLineSync()!;

  print("Age: ");
  int studentAge = int.parse(stdin.readLineSync()!);

  print("Address: ");
  String studentAddress = stdin.readLineSync()!;

  print("Student ID: ");
  int studentID = int.parse(stdin.readLineSync()!);

  print("Grade: ");
  String studentGrade = stdin.readLineSync()!;

  print("Enter number of scores: ");
  int numScores = int.parse(stdin.readLineSync()!);
  List<double> scores = [];
  print("Enter the scorse: ");
  for (int i = 0; i < numScores; i++) {
    scores.add(double.parse(stdin.readLineSync()!));
  }
  var student = Student(
      studentName, studentAge, studentAddress, studentID, studentGrade, scores);

  print("\nStudent Info :");
  student.displayRole();
  print("Name: ${student.name}");
  print("Age: ${student.age}");
  print("Address: ${student.address}");
  print("Average Score: ${student.calculateAvg().toStringAsFixed(2)}");

  print("\nEnter Teacher Details:\n");
  print("Name: ");
  String teacherName = stdin.readLineSync()!;

  print("Age: ");
  int teacherAge = int.parse(stdin.readLineSync()!);

  print("Address: ");
  String teacherAddress = stdin.readLineSync()!;

  print("Teacher ID: ");
  int teacherID = int.parse(stdin.readLineSync()!);

  print("Enter number of courses taught: ");
  int numCourses = int.parse(stdin.readLineSync()!);
  List<String> courses = [];
  print("Enter the course title : ");
  for (int i = 0; i < numCourses; i++) {
    courses.add(stdin.readLineSync()!);
  }

  var teacher =
      Teacher(teacherName, teacherAge, teacherAddress, teacherID, courses);

  print("\nTeacher Info :");
  print("Name: ${teacher.name}");
  print("Age: ${teacher.age}");
  print("Address: ${teacher.address}");
  teacher.displayRole();
  teacher.displayCourseTaught();
}
