Future<void> main(List<String> args) async {
  print("Ready. Sing");

  await line();
  await line2();
  await line3();
  await line4();
}

Future<void> line() async {
  String text = "Pernahkah kau merasa";
  return await Future.delayed(Duration(seconds: 5), () {
    print(text);
    return text;
  });
}

Future<String> line2() async {
  String text = "pernahkan kau merasa.....";
  return await Future.delayed(Duration(seconds: 3), () {
    print(text);
    return text;
  });
}

Future<String> line3() async {
  String text = "pernahkan kau merasa";
  return await Future.delayed(Duration(seconds: 2), () {
    print(text);
    return text;
  });
}

Future<String> line4() async {
  String text = "Hatimu hampa, pernahkan kau merasa hati mu kosong....";
  return await Future.delayed(Duration(seconds: 1), () {
    print(text);
    return text;
  });
}