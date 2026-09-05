import 'dart:async';

void main(List<String> args) async {
  var h = Human();

  print("Luffy");
  print("Zoro");
  print("Killer");

  await h.getData();

  print("name 3: ${h.name}");
}

class Human {
  String name = "nama character one piece";
  Future<void> getData() async {
    await Future.delayed(const Duration(seconds: 3));
    name = "Ikai";
    print("get data [done]");
  }
}