void main(List<String> args) {
  print("Life");


Future.delayed(Duration(seconds: 2), () => "is").then((status) {
print(status);

Future.delayed(Duration(seconds: 1), () => "never flat").then((value) {
  print(value);
});
});
}