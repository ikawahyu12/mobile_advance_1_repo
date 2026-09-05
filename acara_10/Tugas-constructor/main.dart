import 'employee.dart';

void main() {
  Employee emp = Employee(101, "Developer", "IT Support");

  print("ID: ${emp.id}");
  print("Nama: ${emp.name}");
  print("Departemen: ${emp.department}");
}